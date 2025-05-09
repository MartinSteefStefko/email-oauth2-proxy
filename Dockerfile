FROM python:3.11-slim

WORKDIR /app

# Install OpenSSL
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Copy all necessary files
COPY . .

# Generate self-signed certificate
RUN chmod +x generate-cert.sh && ./generate-cert.sh

# Install core and GUI requirements
RUN pip install -r requirements-core.txt -r requirements-gui.txt

# Run in no-gui mode with local server auth
CMD ["python", "emailproxy.py", "--no-gui", "--local-server-auth", "--config-file", "emailproxy.config"] 