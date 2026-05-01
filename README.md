# Minigram Monorepo

This repository contains multiple services that make up the Minigram application.

## Services

- [Auth Service](sources/auth-service/) - Handles user authentication
- [Profiles Service](sources/profiles-service/) - Manages user profiles and relationships
- [Chats Service](sources/chats-service/) - Handles chat functionality
- [Frontend Service](sources/frontend-service/) - Web-based client interface

## Getting Started

Each service can be run independently using Docker. Refer to the README in each service directory for specific instructions.

## Architecture

The services communicate with each other through REST APIs and WebSockets. Authentication is handled by the Auth service, which issues JWT tokens that are used by other services for authorization.

## License

See the LICENSE file in each service directory for licensing information.