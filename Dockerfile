FROM golang:1.22-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        make \
        curl \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Style
RUN go install golang.org/x/tools/cmd/goimports@v0.24.0

# Lint (pinned for reproducible CI/dev)
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
    | sh -s -- -b /usr/local/bin v1.59.1

# Complexity + duplication
RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@v0.6.0 \
    && go install github.com/mibk/dupl@v1.0.0

# Docs: Go equivalent of doxygen-style API docs (markdown from package comments)
RUN go install github.com/princjef/gomarkdoc/cmd/gomarkdoc@v1.1.0

ENV PATH="/go/bin:${PATH}"
ENV GOTOOLCHAIN=local

# Bind-mounted workspaces often differ in UID from the image user.
RUN git config --global --add safe.directory '*'

WORKDIR /workspace

COPY go.mod ./
RUN go mod download

COPY . .

CMD ["bash"]
