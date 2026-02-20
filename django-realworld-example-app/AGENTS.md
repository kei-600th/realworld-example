# Repository Guidelines

## Project Structure & Module Organization
- `conduit/`: Django project package with settings and routing (`settings.py`, `urls.py`, `wsgi.py`).
- `conduit/apps/`: Feature apps such as `articles/`, `authentication/`, `profiles/`, and `core/`.
- `manage.py`: Django management entrypoint.
- `requirements.txt`: Pinned Python dependencies.
- `project-logo.png`: README asset.

## Build, Test, and Development Commands
- `pyenv install 3.5.2`: Install the Python version used by this repo.
- `pyenv virtualenv 3.5.2 productionready` and `pyenv local productionready`: Create and select the local virtualenv.
- `pip install -r requirements.txt`: Install dependencies.
- `python manage.py migrate`: Apply database migrations.
- `python manage.py runserver`: Start the development server at `http://127.0.0.1:8000/`.

## Coding Style & Naming Conventions
- Python code follows standard Django conventions.
- Use 4-space indentation, `snake_case` for functions/variables, and `CamelCase` for classes.
- No formatter or linter is configured in this repository; keep diffs minimal and consistent with surrounding code.

## Testing Guidelines
- No test framework or test suite is present in the repository.
- If you add tests, place them under each app (e.g., `conduit/apps/articles/tests.py`) and run with `python manage.py test`.

## Commit & Pull Request Guidelines
- The Git history does not show a strict commit message convention.
- Prefer concise, imperative commit subjects (e.g., "Fix article serialization").
- For pull requests, include a short summary, reproduction steps (if bug-related), and any API or model changes.

## Configuration & Security Notes
- Settings live in `conduit/settings.py`; review database and secret configuration before deployment.
- This project targets an older Django/DRF stack; avoid upgrading dependencies without verifying compatibility.
