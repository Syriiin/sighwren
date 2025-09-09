help:	## Show this help
	@printf "\nUSAGE: make [command] \n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@printf '\n'

start:	## Start hugo dev server
	hugo server --buildDrafts --disableFastRender

format-config:	## Format config toml files
	taplo format ./config/**/*.toml
