all: bootstrap update install link

bootstrap:
	./etc/bootstrap.sh
	@echo 🔧 Bootstrap completed.

deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	./etc/symlink.sh
	@echo 🔌 dotfiles is deployed.

install:
	for FILE in `find ./macos -name "*.sh"`; do $$FILE & done
	brew bundle
	./etc/env.sh
	@echo 🚀 Packages and settings are successfuly installed.

update:
	git pull origin master
	@echo ✨ Everything is up to date.

