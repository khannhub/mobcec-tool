# Contributor Guide

## Repository Overview
- **backend/**: FastAPI backend application with SQLModel and other dependencies.
- **frontend/**: React frontend built with Vite and TypeScript.
- Docker compose files at the repo root start the full stack for local development.

## Development Workflow
- Python dependencies are managed with **uv**. From `backend/` run:

  ```bash
  uv sync
  ```

- Activate the virtual environment at `backend/.venv` when running backend commands.
- Node dependencies for the frontend are installed with `npm install` inside `frontend/`.

## Linting and Tests
- From `backend/` run the backend linter with:

  ```bash
  uv run bash scripts/lint.sh
  ```

- From `backend/` run backend tests with coverage using:

  ```bash
  uv run bash scripts/tests-start.sh
  ```

- Frontend end-to-end tests use Playwright. With Docker Compose running, execute:

  ```bash
  npx playwright test
  ```

 - Install and configure **pre-commit** hooks to automatically format code before commits. Run `uv sync` inside `backend/` so that the virtual environment and `pre-commit` executable are created at `backend/.venv/bin/`:

  ```bash
  uv sync
  uv run pre-commit install
  ```

  To run on all files:

  ```bash
  uv run pre-commit run --all-files
  ```

## Pull Request Instructions
- Follow the title format: `[<project_name>] <Title>`.
- Ensure `pre-commit`, lints and tests pass before opening a PR.
- Update or add tests for any changed code.

## Commit Signing
- All contributors must sign their commits. Use `git commit -S` to add a verified signature.
- Consider enabling automatic commit signing in your Git configuration.
- For more details, see GitHub's signing guide: https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits
