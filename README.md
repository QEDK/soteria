# 🚦 soteria 
A simple CLI tool that validates Safe transaction hashes in JSON log files.

## Quickstart

### Using CLI
```bash
cargo install --git https://github.com/monad-developers/soteria.git
soteria /path/to/your/logs/directory
```

### Using Docker
```bash
docker build -t soteria .
```

Replace `$(pwd)/src/mocks` with your directory of files to check:
```bash
docker run -v $(pwd)/src/mocks:/mnt/data soteria /mnt/data
```
