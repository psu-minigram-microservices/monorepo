<div align="center">
 <h1>Minigram Monorepo</h1>
 <div>
  Монорепозиторий, объединяющий микросервисы проекта Minigram через git submodules.
 </div>
</div>

## Структура

```
sources/          — git submodules (исходные репозитории)
  chats-service/      github.com/psu-minigram-microservices/chats-service
  minigram/           github.com/aarusanov/minigram (auth + profile)

services/         — символьные ссылки на отдельные сервисы
  chats-service/   -> sources/chats-service
  auth-service/    -> sources/minigram/backend/Minigram/Minigram.Auth
  profile-service/ -> sources/minigram/backend/Minigram/Minigram.Profile
```

## Быстрый старт

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

## Обновление сабмодулей

```bash
# Обновить все сабмодули до последнего коммита в main
git submodule update --remote
```

## Сервисы

| Сервис          | Описание              | Источник                                                                                                |
|-----------------|-----------------------|---------------------------------------------------------------------------------------------------------|
| auth-service    | Сервис аутентификации | [aarusanov/minigram](https://github.com/aarusanov/minigram) (`backend/Minigram/Minigram.Auth`)          |
| chats-service   | Сервис чатов          | [psu-minigram-microservices/chats-service](https://github.com/psu-minigram-microservices/chats-service) |
| profile-service | Сервис профилей       | [aarusanov/minigram](https://github.com/aarusanov/minigram) (`backend/Minigram/Minigram.Profile`)       |
