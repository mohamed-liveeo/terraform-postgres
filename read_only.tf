resource "postgresql_role" "read_only" {
  for_each = { for d in var.databases : d => d }
  name     = "${each.value}_default_read_only"
}

resource "postgresql_grant" "read_only_db" {
  for_each    = postgresql_database.simple
  database    = each.value.name
  role        = postgresql_role.read_only[each.key].name
  object_type = "database"
  privileges  = local.read_only_privileges["database"]
}

resource "postgresql_default_privileges" "read_only_function" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_only[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "function"
  privileges  = local.read_only_privileges["function"]
}

resource "postgresql_default_privileges" "read_only_table" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_only[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "table"
  privileges  = local.read_only_privileges["table"]
}

resource "postgresql_default_privileges" "read_only_sequence" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_only[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "sequence"
  privileges  = local.read_only_privileges["sequence"]
}
