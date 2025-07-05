#!/usr/bin/env bash

set -euo pipefail

# Install uv for Python dependency management
pip install --user uv

# Set up Python virtual environment and install dependencies
cd backend
uv venv .venv
uv sync

# Install pre-commit hooks using the created environment
uv run pre-commit install
cd ..

# Install Node.js 20 if not already available
if ! command -v node >/dev/null || ! node --version | grep -q '^v20'; then
    if command -v nvm >/dev/null; then
        nvm install 20
        nvm use 20
    else
        curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
        apt-get install -y nodejs
    fi
fi

# Install frontend dependencies
cd frontend
npm install
cd ..
