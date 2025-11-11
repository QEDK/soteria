# safe-hash-action


## Quickstart

### Using Docker
```bash
docker build -t soteria .
```

Replace `$(pwd)/src/mocks` with your directory of files to check:
```bash
docker run -v $(pwd)/src/mocks:/mnt/data soteria /mnt/data
```
