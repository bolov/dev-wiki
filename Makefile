# CONTAINER_PORT=4200

# HOST_PORT=32110
# DEV_HOST_PORT=32111

build_dev:
	docker build -t mihail.balan/dev-wiki/dev ./docker/dev/
.PHONY: build_dev

run_dev: build_dev
	docker run \
		--name dev-wiki-dev \
		-dit \
		--mount type=volume,source=dev_wiki_vscode,target="/root/.vscode-server-insiders/" \
		--mount type=bind,source="$(shell pwd)",target="/workspace/dev-wiki/" \
		mihail.balan/dev-wiki/dev
.PHONY: run_dev

# -p $(DEV_HOST_PORT):$(CONTAINER_PORT) \