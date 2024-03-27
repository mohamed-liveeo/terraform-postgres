locals {
  admin_privileges = {
    database = [
      "CREATE",
      "CONNECT",
      "TEMPORARY"
    ]
    table = [
      "INSERT",
      "SELECT",
      "UPDATE",
      "DELETE",
      "TRUNCATE",
      "REFERENCES",
      "TRIGGER"
    ]
    sequence = [
      "SELECT",
      "UPDATE",
      "USAGE"
    ]
    function = [
      "EXECUTE"
    ]
  }
  read_write_privileges = {
    database = [
      "CONNECT"
    ]
    table = [
      "INSERT",
      "SELECT",
      "UPDATE",
      "DELETE",
      "TRUNCATE",
      "REFERENCES",
      "TRIGGER"
    ]
    sequence = [
      "SELECT",
      "USAGE",
      "UPDATE"
    ]
    function = [
      "EXECUTE"
    ]
  }
  read_only_privileges = {
    database = [
      "CONNECT"
    ]
    table = [
      "SELECT"
    ]
    sequence = [
      "SELECT",
      "USAGE",
    ]
    function = [
      "EXECUTE"
    ]
  }

  user_db_list = flatten([for u, v in var.users :
    [for k, db_list in v :
      [for db in db_list :
        { database = db
          user     = u,
        role = k }
      ]
    ]
  ])
  user_db_map = { for v in local.user_db_list : "${v.database}.${v.user}.${v.role}" => v }
}
