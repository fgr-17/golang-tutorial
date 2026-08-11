SCRIPTS := scripts

.PHONY: all help build run test coverage coverage-html \
	style-check style-fix fmt fmt-check \
	lint complexity duplication static-analysis \
	docs clean tidy \
	docker-build docker-up docker-shell docker-run docker-make

all: build

help:
	@$(SCRIPTS)/help.sh

build:
	@$(SCRIPTS)/build.sh

run:
	@$(SCRIPTS)/run.sh

test:
	@$(SCRIPTS)/test.sh

coverage:
	@$(SCRIPTS)/coverage.sh

coverage-html:
	@$(SCRIPTS)/coverage-html.sh

fmt: style-fix
fmt-check: style-check

style-check:
	@$(SCRIPTS)/style-check.sh

style-fix:
	@$(SCRIPTS)/style-fix.sh

lint:
	@$(SCRIPTS)/lint.sh

complexity:
	@$(SCRIPTS)/complexity.sh

duplication:
	@$(SCRIPTS)/duplication.sh

static-analysis:
	@$(SCRIPTS)/static-analysis.sh

docs:
	@$(SCRIPTS)/docs.sh

tidy:
	@$(SCRIPTS)/tidy.sh

clean:
	@$(SCRIPTS)/clean.sh

docker-build:
	@$(SCRIPTS)/docker-build.sh

docker-up:
	@$(SCRIPTS)/docker-up.sh

docker-shell:
	@$(SCRIPTS)/docker-shell.sh

docker-run:
	@$(SCRIPTS)/docker-run.sh

# Example: make docker-make ARGS='test coverage static-analysis'
docker-make:
	@$(SCRIPTS)/docker-make.sh $(ARGS)
