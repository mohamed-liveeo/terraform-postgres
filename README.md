<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.13.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [postgresql_database.simple](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/database) | resource |
| [postgresql_default_privileges.admin_function](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.admin_sequence](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.admin_table](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_only_function](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_only_sequence](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_only_table](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_write_function](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_write_sequence](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_default_privileges.read_write_table](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/default_privileges) | resource |
| [postgresql_extension.assets_postgis](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/extension) | resource |
| [postgresql_grant.admin_db](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/grant) | resource |
| [postgresql_grant.read_only_db](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/grant) | resource |
| [postgresql_grant.read_write_db](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/grant) | resource |
| [postgresql_grant.revoke_database](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/grant) | resource |
| [postgresql_grant_role.users](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/grant_role) | resource |
| [postgresql_role.admin](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/role) | resource |
| [postgresql_role.read_only](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/role) | resource |
| [postgresql_role.read_write](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/role) | resource |
| [postgresql_role.users](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.13.0/docs/resources/role) | resource |
| [random_password.users](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | List of databases that will be created. | `list(string)` | <pre>[<br>  "db1",<br>  "db2",<br>  "db3",<br>  "db4",<br>  "db5",<br>  "db6",<br>  "db7",<br>  "db8",<br>  "db9",<br>  "db10"<br>]</pre> | no |
| <a name="input_provider_config"></a> [provider\_config](#input\_provider\_config) | n/a | `map(any)` | <pre>{<br>  "connect_timeout": "22",<br>  "database": "postgres",<br>  "host": "postgres",<br>  "port": "5432",<br>  "sslmode": "disable",<br>  "username": "postgres"<br>}</pre> | no |
| <a name="input_provider_pass"></a> [provider\_pass](#input\_provider\_pass) | n/a | `string` | `"letmein"` | no |
| <a name="input_users"></a> [users](#input\_users) | Map of user roles that will be created with the appropriate privileges (Admin or Read\_Write or Read\_Only) to be granted to those users. | `map(object({ admin = list(string), read_write = list(string), read_only = list(string) }))` | <pre>{<br>  "user_1": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_10": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_2": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_3": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_4": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_5": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_6": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_7": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_8": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  },<br>  "user_9": {<br>    "admin": [<br>      "db1",<br>      "db2",<br>      "db3"<br>    ],<br>    "read_only": [<br>      "db7",<br>      "db8",<br>      "db9",<br>      "db10"<br>    ],<br>    "read_write": [<br>      "db4",<br>      "db5",<br>      "db6"<br>    ]<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
