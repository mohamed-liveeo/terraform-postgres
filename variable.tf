variable "provider_config" {
  type = map(any)
  default = {
    host            = "postgres"
    port            = "5432"
    database        = "postgres"
    username        = "postgres"
    sslmode         = "disable"
    connect_timeout = "22"
  }
  sensitive = true
}

variable "provider_pass" {
  type      = string
  default   = "letmein"
  sensitive = true
}

variable "databases" {
  description = "List of databases that will be created."
  type        = list(string)
  default = [
    "db1",
    "db2",
    "db3",
    "db4",
    "db5",
    "db6",
    "db7",
    "db8",
    "db9",
    "db10"
  ]
}

variable "users" {
  description = "Map of user roles that will be created with the appropriate privileges (Admin or Read_Write or Read_Only) to be granted to those users."
  type        = map(object({ admin = list(string), read_write = list(string), read_only = list(string) }))
  default = {
    user_1 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_2 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_3 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_4 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_5 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_6 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_7 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_8 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_9 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
    user_10 = {
      admin      = ["db1", "db2", "db3"],
      read_write = ["db4", "db5", "db6"],
      read_only  = ["db7", "db8", "db9", "db10"]
    }
  }
}
