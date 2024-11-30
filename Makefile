.PHONY: help build run update

default: help

help:
	@echo "help"

build:
	npm run build

run:
	npm run dev

update:
	scp -r src/.vuepress/dist/* root@27.155.79.224:/root/book/


