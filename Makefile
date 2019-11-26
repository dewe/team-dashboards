jsonnet-ci = docker run --rm -v $$(pwd):$$(pwd) --workdir $$(pwd) quay.io/coreos/jsonnet-ci

.DEFAULT_GOAL := help

.PHONY: update build all help

build:  ## Build yaml manifest from config.jsonnet and src/vendor folder
	$(jsonnet-ci) dashboard.jsonnet

# $(jsonnet-ci) ./build.sh dashboard.jsonnet

help:  ## Display this help (thanks to https://suva.sh/posts/well-documented-makefiles)
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } /\Z/ { printf "\n"}' $(MAKEFILE_LIST)
