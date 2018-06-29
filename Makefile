IMAGE_NAME ?= ownport/py3-base
IMAGE_VERSION ?= 0.1.1-debian

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

console:
	docker run -ti --rm $(IMAGE_NAME):$(IMAGE_VERSION) /bin/bash
