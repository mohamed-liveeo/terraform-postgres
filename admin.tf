resource "postgresql_role" "admin" {
  for_each = { for d in var.databases : d => d }
  name     = "${each.value}_default_admin"
}

resource "postgresql_grant" "admin_db" {
  for_each    = postgresql_database.simple
  database    = each.value.name
  role        = postgresql_role.admin[each.key].name
  object_type = "database"
  privileges  = local.admin_privileges["database"]
}

resource "postgresql_default_privileges" "admin_function" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.admin[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "function"
  privileges  = local.admin_privileges["function"]
}

resource "postgresql_default_privileges" "admin_table" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.admin[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "table"
  privileges  = local.admin_privileges["table"]
}

resource "postgresql_default_privileges" "admin_sequence" {
  for_each    = local.user_db_map
  database    = postgresql_database.simple[each.value.database].name
  role        = postgresql_role.admin[each.value.database].name
  owner       = postgresql_role.users[each.value.user].name
  object_type = "sequence"
  privileges  = local.admin_privileges["sequence"]
}
