# ansible-proserver-keycloak
A Keycloak role for FreeBSD Proservers. For the Docker-based Linux role, see [ansible-keycloak](https://github.com/punktDe/ansible-keycloak).

## Requirements
- A FreeBSD-based Proserver
- Ansible >= 8.2.0
- Ansible option `hash_behaviour` set to `merge`

## Dependencies
* [ansible-proserver-dehydrated](https://github.com/punktDe/ansible-proserver-dehydrated)
* [ansible-proserver-nginx](https://github.com/punktDe/ansible-proserver-nginx)

One of the following:
* [ansible-proserver-mariadb](https://github.com/punktDe/ansible-proserver-mariadb)
* [ansible-proserver-postgresql](https://github.com/punktDe/ansible-proserver-postgresql)

## Installation
See [ROLE_USAGE.md](https://github.com/punktDe/ansible-proserver-documentation/blob/main/ROLE_USAGE.md)


## Parameters

### redirect_admin
```yaml
keycloak:
  redirect_admin: false 
```
Redirects `/` to `/admin/console`

### domain
```yaml
keycloak:
  domain: 
```
The domain name for the Keycloak frontend


### config

An array of Keycloak configuration options. These options match the [official Keycloak options](https://www.keycloak.org/server/all-config), with the exception of dashes being replaced with underscores due to YAML limitations.

For example, these options:
```yaml
keycloak:
  config:
    db: "postgres"
    db_url_host: "localhost"
    db_username: keycloak
    db_password: changeme
    db_url_database: keycloak
    hostname_strict: false
    hostname_strict_https: false
    hostname_url: "https://keycloak.example.com"
    http_enabled: true
    proxy: edge
    http_port: 8080
```
...will produce the following Keycloak configuration:
```ini
db=postgres
db-url-host=localhost
db-username=keycloak
db-password=changeme
db-url-database=keycloak
hostname-strict=False
hostname-strict-https=False
hostname-url=https://keycloak.example.com
http-enabled=True
proxy=edge
http-port=8080
```

### prefix
* **prefix.config** – Path to Keycloak configuration folder. Used for themes, providers, configuration,etc. Defaults to `/usr/local/java/keycloak` on FreeBSD and `/var/opt/keycloak` on Linux

```yaml
keycloak:
  prefix:
    config: "{{ '/usr/local/share/java/keycloak' if ansible_system == 'FreeBSD' else '/var/opt/keycloak' }}"
```

