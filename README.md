# ARM-7-Nuitka-Compiler-Docker

A Docker environment for compiling Python applications to native binary executables using Nuitka on ARM7 architecture.

## Overview

This project provides a ready-to-use Docker environment for compiling Python applications into standalone executables using the [Nuitka](https://nuitka.net/) compiler, specifically configured for ARM7 architecture. This enables cross-compilation for ARM-based systems like Raspberry Pi and other ARM devices.

## Features

- ARM7 compatible Docker container
- Pre-installed Nuitka Python compiler
- Build optimization with ccache
- Volume mapping for easy file access
- Interactive container environment

## Requirements

- Docker
- Docker Compose

## Setup and Usage

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/ARM-7-Nuitka-Compiler-Docker.git
cd ARM-7-Nuitka-Compiler-Docker
```

### 2. Build the Docker image

```bash
docker-compose build
```

### 3. Run the container

```bash
docker-compose up -d
```

### 4. Access the container

```bash
docker exec -it arm-nuitka bash
```

### 5. Compile your Python application

Inside the container, you can compile your Python applications using Nuitka. Place your Python files in the project directory, and they will be available inside the container at `/workspace`.

Example compilation command:

```bash
python3 -m nuitka --standalone --show-progress your_script.py
```

Additional compilation options:

```bash
# For optimized builds
python3 -m nuitka --standalone --lto=yes your_script.py

# For minimal executable size
python3 -m nuitka --standalone --remove-output --no-pyi-file your_script.py

# Including specific data files or packages
python3 -m nuitka --standalone --include-data-dir=./data=data/ your_script.py
```

## Project Structure

- `Dockerfile`: Configures the Debian-based environment with Python and Nuitka
- `docker-compose.yml`: Sets up the container with volume mapping and ARM7 platform specification

## Customization

### Adding Python Dependencies

To include additional Python packages, you can either:

1. Install them manually inside the container:
   ```bash
   pip3 install package-name
   ```

2. Create a `requirements.txt` file and uncomment the related line in the Dockerfile:
   ```
   RUN pip install --no-cache-dir --user -r requirements.txt
   ```

### Adjusting Compiler Options

Nuitka offers numerous options for optimization, inclusion/exclusion of modules, and more. Refer to the [Nuitka documentation](https://nuitka.net/doc/user-manual.html) for detailed information.

## License

None

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.