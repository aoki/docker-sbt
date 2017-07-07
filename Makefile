user = ringo
name = sbt

# Build Container
build:
	docker build -t $(user)/$(name) .
.PHONY: build

# Publish Container
push:
	docker login -u $${DOCKER_HUB_USER} -p $${DOCKER_HUB_PASSWORD} && docker push $(user)/$(name)
.PHONY: push

# Run Container
run:
	docker run --rm --name $(name) $(user)/$(name)
.PHONY: run

# Login container
login:
	docker exec -it $(name) /bin/bash
.PHONY: login

# Display log
log:
	docker logs -f $(name)
.PHONY: log
