resource "postgresql_role" "read_write" {
  for_each = { for d in var.databases : d => d }
  name     = "${each.value}_default_read_write"
}

resource "postgresql_grant" "read_write_db" {
  for_each    = postgresql_database.simple
  database    = each.value.name
  role        = postgresql_role.read_write[each.key].name
  object_type = "database"
  privileges  = local.read_write_privileges["database"]
}

resource "postgresql_default_privileges" "read_write_function" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_write[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "function"
  privileges  = local.read_write_privileges["function"]
}

resource "postgresql_default_privileges" "read_write_table" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_write[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "table"
  privileges  = local.read_write_privileges["table"]
}

resource "postgresql_default_privileges" "read_write_sequence" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.read_write[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "sequence"
  privileges  = local.read_write_privileges["sequence"]
}
