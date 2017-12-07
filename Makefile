REGISTRY_ID ?= 115159323386
AWS_DEFAULT_REGION ?= ap-southeast-2
AWS_REGION ?= $(AWS_DEFAULT_REGION)
REGISTRY ?= $(REGISTRY_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com
REGISTRY_NAMESPACE ?= base
DOCKER_CI_REPO ?= $(REGISTRY)/$(REGISTRY_NAMESPACE)
USECACHE = true
DRYRUN = true

DOCKERMK := $(shell if command -v curl >/dev/null; then \
			if [ ! -e docker-ci.mk ]; then \
				curl -fsSL https://raw.githubusercontent.com/full360/docker-ci/master/docker-ci.mk -o docker-ci.mk; \
			fi \
			elif command -v wget >/dev/null; then \
			if [ ! -e docker-ci.mk ]; then \
				wget -q https://raw.githubusercontent.com/full360/docker-ci/master/docker-ci.mk -O docker-ci.mk; \
			fi \
			else \
				echo "cURL and wget not found..."; \
			fi)

include docker-ci.mk
