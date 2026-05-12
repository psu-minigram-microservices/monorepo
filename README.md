# Minigram — Monorepo

Docker Compose orchestration for the Minigram microservices stack.

## Services

| Service | Image | Description |
|---|---|---|
| `auth-service` | `ghcr.io/psu-minigram-microservices/auth-service` | Authentication & JWT |
| `chats-service` | `ghcr.io/psu-minigram-microservices/chats-service` | Messaging & WebSocket |
| `profile-service` | `ghcr.io/psu-minigram-microservices/profiles-service` | User profiles |
| `frontend-service` | `ghcr.io/psu-minigram-microservices/frontend-service` | Web UI |

Traffic is routed through a [Caddy](https://caddyserver.com/) reverse proxy on port 80.

## Running

Copy the example env file and fill in the required values:

```bash
cp .env.example .env
```

Pull and start all services:

```bash
docker compose up -d
```

To pin specific versions per service:

```bash
AUTH_TAG=v1.0.0 CHATS_TAG=v2.1.0 FRONTEND_TAG=v1.3.0 PROFILE_TAG=v1.1.0 docker compose up -d
```

Each service tag defaults to `latest` if not set.

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `AUTH_TAG` | `latest` | auth-service image tag |
| `CHATS_TAG` | `latest` | chats-service image tag |
| `FRONTEND_TAG` | `latest` | frontend-service image tag |
| `PROFILE_TAG` | `latest` | profile-service image tag |
| `JWT_SECRET` | — | Shared JWT signing secret |
| `JWT_ISSUER` | `Minigram` | JWT issuer claim |
| `JWT_AUDIENCE` | `MinigramClient` | JWT audience claim |
| `JWT_EXPIRATION` | `15` | JWT expiration in minutes |
| `AUTH_DB_*` | see compose | Auth DB connection settings |
| `CHATS_DB_*` | see compose | Chats DB connection settings |
| `PROFILE_DB_*` | see compose | Profile DB connection settings |

## API

Route prefixes handled by Caddy:

| Prefix | Service |
|---|---|
| `/api/v1/auth/*` | auth-service |
| `/api/v1/chats/*` | chats-service |
| `/api/v1/keys/*` | chats-service |
| `/api/v1/profiles/*` | profile-service |
| `/ws/*` | chats-service |
| `*` | frontend-service |

Swagger specs are available in [`docs/`](docs/).
