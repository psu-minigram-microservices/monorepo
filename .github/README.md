<div align="center">
 <h1>Minigram Monorepo</h1>
 <div>
  Монорепозиторий, объединяющий микросервисы проекта Minigram через git submodules.
 </div>
</div>

### Структура

```
sources/          — git submodules (исходные репозитории)
  chats-service/      github.com/psu-minigram-microservices/chats-service
  frontend-service/   github.com/psu-minigram-microservices/frontend-service
  profiles-service/   github.com/psu-minigram-microservices/profiles-service (auth + profile)

services/         — символьные ссылки на отдельные сервисы
  auth-service/      -> sources/profiles-service/backend/Minigram/Minigram.Auth
  chats-service/     -> sources/chats-service
  frontend-service/  -> sources/frontend-service
  profile-service/   -> sources/profiles-service/backend/Minigram/Minigram.Profile
```

### Конфигурация (.env)

В корне репозитория находится файл `.env.example` — шаблон переменных окружения для всех сервисов.<br>
Скопируйте его в `.env` и заполните нужными значениями:

```bash
cp .env.example .env
```

| Переменная              | Описание                                      | По умолчанию       |
|-------------------------|-----------------------------------------------|--------------------|
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
| `CHATS_SPRING_PROFILES` | Активный Spring-профиль                       | `pg`               |
| **Profile service**     |                                               |                    |
| `PROFILE_DB_NAME`       | Имя базы данных                               | `minigram_profile` |
| `PROFILE_DB_USER`       | Пользователь БД                               | `minigram`         |
| `PROFILE_DB_PASSWORD`   | Пароль БД                                     | `minigram`         |
| `PROFILE_DB_PORT`       | Порт PostgreSQL                               | `5433`             |

### Конфигурация Caddy (reverse proxy)

В директории `config/` находится файл `Caddyfile.example` — шаблон конфигурации reverse proxy.<br>
Скопируйте его в `Caddyfile` и при необходимости измените:

```bash
cp config/Caddyfile.example config/Caddyfile
```

- `localhost` — dev-режим (HTTP only, порт 80)
- Замените на доменное имя (например, `minigram.example.com`) для автоматического HTTPS через Let's Encrypt

### Быстрый старт

```bash
git clone --recurse-submodules <repo-url>
cd monorepo
```

Если репозиторий уже склонирован без `--recurse-submodules`, скрипты ниже сами подтянут сабмодули.

**Linux / macOS:**
```bash
sh setup.sh
```

**Windows:**
```bat
setup.bat
```

Скрипты инициализируют сабмодули и создадут ссылки на сервисы в директории `services/`.

### Обновление сабмодулей

```bash
# Обновить все сабмодули до последнего коммита в main
git submodule update --remote
```

### Сервисы

| Сервис           | Описание              | Источник                                                                                                                 |
|------------------|-----------------------|--------------------------------------------------------------------------------------------------------------------------|
| auth-service     | Сервис аутентификации | [profiles-service](https://github.com/psu-minigram-microservices/profiles-service) (`backend/Minigram/Minigram.Auth`)    |
| chats-service    | Сервис чатов          | [chats-service](https://github.com/psu-minigram-microservices/chats-service)                                             |
| frontend-service | Сервис фронтенда      | [frontend-service](https://github.com/psu-minigram-microservices/frontend-service)                                       |
| profile-service  | Сервис профилей       | [profiles-service](https://github.com/psu-minigram-microservices/profiles-service) (`backend/Minigram/Minigram.Profile`) |
