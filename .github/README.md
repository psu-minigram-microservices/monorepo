<div align="center">
 <h1>Minigram Monorepo</h1>
 <div>
  Монорепозиторий, объединяющий микросервисы проекта Minigram через git submodules.
 </div>
</div>

### Сервисы

| Сервис           | Описание              | Источник                                                                                       |
|------------------|-----------------------|------------------------------------------------------------------------------------------------|
| auth-service     | Сервис аутентификации | [auth-service](https://github.com/psu-minigram-microservices/auth-service)                     |
| chats-service    | Сервис чатов          | [chats-service](https://github.com/psu-minigram-microservices/chats-service)                   |
| frontend-service | Сервис фронтенда      | [frontend-service](https://github.com/psu-minigram-microservices/frontend-service)             |
| profile-service  | Сервис профилей       | [profiles-service](https://github.com/psu-minigram-microservices/profiles-service)             |

### Быстрый старт

```bash
git clone --recurse-submodules https://github.com/psu-minigram-microservices/monorepo
cd monorepo
cp .env.example .env
cp config/Caddyfile.example config/Caddyfile
# заполните .env
docker compose up -d
```

Для запуска с конкретными версиями сервисов:

```bash
AUTH_TAG=v1.0.0 CHATS_TAG=v2.1.0 FRONTEND_TAG=v1.3.0 PROFILE_TAG=v1.1.0 docker compose up -d
```

### Конфигурация Caddy (reverse proxy)

В директории `config/` находится файл `Caddyfile.example` — шаблон конфигурации reverse proxy.

- `localhost` — dev-режим (HTTP only, порт 80)
- Замените на доменное имя (например, `minigram.example.com`) для автоматического HTTPS через Let's Encrypt

### Переменные окружения

| Переменная              | Описание                                      | По умолчанию       |
|-------------------------|-----------------------------------------------|--------------------|
| **Теги образов**        |                                               |                    |
| `AUTH_TAG`              | Тег образа auth-service                       | `latest`           |
| `CHATS_TAG`             | Тег образа chats-service                      | `latest`           |
| `FRONTEND_TAG`          | Тег образа frontend-service                   | `latest`           |
| `PROFILE_TAG`           | Тег образа profiles-service                   | `latest`           |
| **JWT**                 |                                               |                    |
| `JWT_SECRET`            | Секрет для подписи JWT-токенов (≥ 32 символа) | —                  |
| `JWT_ISSUER`            | Издатель токена                               | `Minigram`         |
| `JWT_AUDIENCE`          | Аудитория токена                              | `MinigramClient`   |
| `JWT_EXPIRATION`        | Время жизни токена (минуты)                   | `15`               |
| **Auth service**        |                                               |                    |
| `AUTH_DB_NAME`          | Имя базы данных                               | `minigram_auth`    |
| `AUTH_DB_USER`          | Пользователь БД                               | `minigram`         |
| `AUTH_DB_PASSWORD`      | Пароль БД                                     | `minigram`         |
| `AUTH_DB_PORT`          | Порт PostgreSQL                               | `5432`             |
| **Chats service**       |                                               |                    |
| `CHATS_DB_NAME`         | Имя базы данных                               | `minigram_chats`   |
| `CHATS_DB_USER`         | Пользователь БД                               | `minigram`         |
| `CHATS_DB_PASSWORD`     | Пароль БД                                     | `minigram`         |
| `CHATS_DB_PORT`         | Порт PostgreSQL                               | `5434`             |
| **Profile service**     |                                               |                    |
| `PROFILE_DB_NAME`       | Имя базы данных                               | `minigram_profile` |
| `PROFILE_DB_USER`       | Пользователь БД                               | `minigram`         |
| `PROFILE_DB_PASSWORD`   | Пароль БД                                     | `minigram`         |
| `PROFILE_DB_PORT`       | Порт PostgreSQL                               | `5433`             |
