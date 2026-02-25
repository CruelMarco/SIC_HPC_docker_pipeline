FROM python:3.12-slim

# Install basic system dependencies often needed by scientific Python packages (like RDKit, OpenCV, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# 1. Set a working directory inside the container (good practice)
WORKDIR /workspace

# 2. Copy the requirements file from your host machine into the container
COPY requirements.txt .

# 3. Install the packages
RUN pip install --no-cache-dir -r requirements.txt