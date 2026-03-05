# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a RealWorld example application ("Conduit" - a Medium.com clone) implemented as a monorepo with two separate apps:

- `react-redux-realworld-example-app/` — Frontend (React + Redux)
- `django-realworld-example-app/` — Backend (Django REST Framework)

## Running the Project

### Docker (recommended, runs both services)

```bash
docker-compose up
# Frontend: http://localhost:4100
# Backend: http://localhost:8000
```

### Frontend only

```bash
cd react-redux-realworld-example-app
npm install
npm start        # dev server on port 4100
npm run build    # production build
npm test -- --env=jsdom
```

### Backend only

Requires Python 3.5.2 (via pyenv).

```bash
cd django-realworld-example-app/src
pip install -r ../requirements.txt
python manage.py runserver   # port 8000
```

## Architecture

### Frontend (React + Redux)

**Data flow:** UI component → dispatch action → `promiseMiddleware` handles async API call → reducer updates state → component re-renders.

Key files:
- `src/index.js` — Redux store setup and app entry point
- `src/agent.js` — Centralized API client (Superagent); `API_ROOT` is hardcoded to `http://localhost:8000/api`
- `src/reducer.js` — Combines all slice reducers: `article`, `articleList`, `auth`, `common`, `editor`, `home`, `profile`, `settings`, `router`
- `src/middleware.js` — `promiseMiddleware` (handles Promise payloads), `localStorageMiddleware` (persists JWT under key `jwt`)
- `src/components/App.js` — Top-level routing and JWT initialization

### Backend (Django REST Framework)

Django project is `conduit`; source is under `src/`.

Apps under `src/conduit/apps/`:
- `authentication` — User registration/login, JWT generation
- `articles` — Article CRUD, comments, tags
- `profiles` — User profiles, follow/unfollow, favorites
- `core` — Shared base model (`TimestampedModel`), renderers, exception handling

**API** is rooted at `/api/`. CORS is enabled to allow requests from the frontend. Authentication uses JWT passed as a Bearer token.

**Database:** SQLite (`db.sqlite3`) in development.
