# golang-tutorial

Minimal Golang repository template with Docker, tests/coverage, style tooling,
static analysis, and API doc generation.

All build and quality tools live in a long-lived container. You only need Docker
(and Make on the host to invoke the wrappers). Make targets started from the
host run inside that container automatically.

## Layout

```
cmd/hello/          application entrypoint
internal/greet/     library code + unit tests
docs/api/           generated package docs (gomarkdoc)
Dockerfile          Go toolchain + quality tools
compose.yml         persistent workspace container
Makefile            thin wrapper over scripts/
scripts/            one script per make target
.golangci.yml       lint config
```

## Quick start

```bash
make docker-build              # once
make run                       # starts the container if needed, then builds + prints stdout
make test
make coverage
make style-check
make style-fix
make static-analysis
make docs
```

Open an interactive shell in the same persistent container:

```bash
make docker-shell
```

Container lifecycle:

```bash
make docker-up                 # start in the background
make docker-shell              # bash inside /workspace
docker compose stop            # pause without removing
docker compose down            # stop and remove the container
```

The workspace directory is bind-mounted at `/workspace`, so edits on the host
are visible inside the container immediately.

## Code quality

| Concern        | Tool            | Make target        |
|----------------|-----------------|--------------------|
| Format check   | gofmt/goimports | `style-check`      |
| Format fix     | gofmt/goimports | `style-fix`        |
| Lint           | golangci-lint   | `lint`             |
| Complexity     | gocyclo         | `complexity`       |
| Duplication    | dupl            | `duplication`      |
| All of above   |                 | `static-analysis`  |

`static-analysis` runs lint + complexity + duplication.

## Documentation

Public APIs are documented with package and `//` comments (Go convention).
This template generates static Markdown from those comments with
[gomarkdoc](https://github.com/princjef/gomarkdoc):

```bash
make docs
# -> docs/api/...
```

Browse interactively inside the container (optional):

```bash
make docker-shell
go run golang.org/x/pkgsite/cmd/pkgsite@latest
```

## Building

```bash
make run
# or:
make build
./bin/hello
./bin/hello Alice
```

## Golang tutorial

Create go module:

~~~bash
go mod init <module path> << can correspond to a repo
go mod init booking-app
~~~

Run main package:

~~~bash
go run main.go
~~~