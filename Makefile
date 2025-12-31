NIX_DEVELOP_RUN ?= nix develop -c

help:	## Show this help
	@printf "\nUSAGE: make [command] \n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@printf '\n'

start:	## Start hugo dev server
	$(NIX_DEVELOP_RUN) hugo server --buildDrafts --disableFastRender

build:	## Build the site
	$(NIX_DEVELOP_RUN) hugo build --minify

dev-shell:	## Enter nix dev shell
	nix develop

format-config:	## Format config toml files
	$(NIX_DEVELOP_RUN) taplo format ./config/**/*.toml
