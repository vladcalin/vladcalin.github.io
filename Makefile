
npm_bin := $(shell npm bin)
build:
	$(npm_bin)/gulp

dev:
	$(npm_bin)/gulp dev
