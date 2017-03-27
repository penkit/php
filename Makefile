# macro to build specific version
define docker_build
	docker build --build-arg PHP_VERSION=$1 \
	--file custom/Dockerfile \
	--tag penkit/php:$(shell echo "$1" | sed 's/-r[0-9]*$$//') .
endef

# macro to pull specific version
define docker_pull
	docker pull penkit/php:$(shell echo "$1" | sed 's/-r[0-9]*$$//')
endef

# macro to push specific version
define docker_push
	docker push penkit/php:$(shell echo "$1" | sed 's/-r[0-9]*$$//')
endef

# targets for building specific (or all) versions
build: pull/base $(addprefix build/,$(shell cat PHP_VERSIONS)) ;
build/%:
	$(call docker_build,$*)

# target for building wordpress
build/wordpress/4.7:
	docker build -f wordpress/Dockerfile --build-arg PHP_VERSION=5.6.30-r0 --build-arg WP_VERSION=4.7 -t penkit/wordpress:4.7 .

# targets for pulling specific (or all) versions
pull: $(addprefix pull/,$(shell cat PHP_VERSIONS)) ;
pull/%:
	$(call docker_pull,$*)

# target for pulling base image
pull/base:
	docker pull penkit/alpine:3.5

push: $(addprefix push/,$(shell cat PHP_VERSIONS)) ;
push/%:
	$(call docker_push,$*)
