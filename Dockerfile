FROM python:3.11-slim

WORKDIR /app

# Copy all necessary files
COPY . .

# Install core and GUI requirements
RUN pip install -r requirements-core.txt -r requirements-gui.txt

# Run in no-gui mode with local server auth
CMD ["python", "emailproxy.py", "--no-gui", "--local-server-auth", "--config-file", "emailproxy.config"] 