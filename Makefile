# This is not a config file, it is 
# just for handle the scripts automation 
# to copy from or to the current host system.

.DEFAULT_GOAL := default
default:
	@echo "no default."

install:
	# TODO: Check if is Linux.
	@set -e
	@if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then \
		./scripts/install-deb-wsl.sh ; \
	else \
		./scripts/install-deb.sh ; \
	fi

update-from-os:
	# TODO: Check if is Linux.
	./scripts/update-from-os.sh

update-to-os:
	# TODO: Check if is Linux.
	@set -e
	@if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then \
		./scripts/update-to-wsl.sh ; \
	else \
		./scripts/update-to-os.sh ; \
	fi
