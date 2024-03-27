resource "postgresql_database" "simple" {
  for_each          = { for d in var.databases : d => d }
  name              = each.value
  connection_limit  = 10
  allow_connections = true
}

resource "postgresql_extension" "assets_postgis" {
  for_each = postgresql_database.simple
  name     = "postgis"
  database = each.value.name
}

resource "postgresql_grant" "revoke_database" {
  for_each    = postgresql_database.simple
  database    = each.value.name
  role        = "public"
  object_type = "database"
  privileges  = []

}
