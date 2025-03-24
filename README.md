This is the infrastructure repository for everything I host on my unmanaged kubernetes cluster on Hetzner.

Currently not easily reproducible but being able to get this up and running for your own projects with minimal effort would be nice to have at some point in the future.

### Expected Secrets

#### Flux

Github PAT for Flux

- `github-pat`
  - `token`

Flux webhook token for push deployments

- `flux-webhook-token`
  - `token`

#### Alerting

Alertmanager push notification configuration

- `pushover-config`
  - `user_key`
  - `api_key`

#### Database

Wasabi S3 credentials for PostgreSQL backups

- `postgres-s3-backups`
  - `access_key`
  - `secret_key`

S3 credentials for PostgreSQL backups

- `s3-postgres-credentials`
  - `access_key`
  - `secret_key`

PostgreSQL user for development

- `postgres-user-developer`
  - `password`

#### Analytics

PostgreSQL credentials for Umami

- `postgres-user-umami`
  - `password`

Postgres connection URL for umami

- `umami-postgres-url`
  - `url`

#### Monitoring

S3 credentials

- `wasabi-s3-credentials`
  - `access_key`
  - `secret_key`

#### Tailscale

Tailscale operator OAuth credentials

- `tailscale-operator-oauth`
  - `client_id`
  - `client_secret`

#### Wireguard

Wireguard server IP

- `wireguard-server-ip`
  - `ip`

Wireguard password hash

- `wireguard-password-hash`
  - `password`

Wireguard config

- `wireguard-config`
  - `wg0.conf`

#### Ingress

Cloudflare origin certificate for xetera.dev

- `cloudflare-origin:xetera-dev`
  - `tls.key`

Cloudflare MTLS certificate

- `cloudflare-mtls`
  - `ca.crt`
