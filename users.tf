resource "postgresql_role" "users" {
  for_each = var.users
  name     = each.key
  login    = true
  password = random_password.users[each.key].result
  lifecycle {
    ignore_changes = [
      roles
    ]
  }
}

resource "postgresql_grant_role" "users" {
  for_each   = local.user_db_map
  role       = postgresql_role.users[each.value.user].name
  grant_role = "${each.value.database}_default_${each.value.role}"

  depends_on = [
    postgresql_role.admin,
    postgresql_role.read_write,
    postgresql_role.read_only
  ]
}

resource "random_password" "users" {
  for_each = var.users
  length   = 64
  special  = false
  keepers = {
    pass_version = 1
  }
}
