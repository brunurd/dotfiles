# This is not a config file, it is 
# just for handle the scripts automation 
# to copy from or to the current host system.

.DEFAULT_GOAL := default
default:
	@echo "no default"

install:
	./scripts/install.sh

update-from-os:
	./scripts/update-from-os.sh

update-to-os:
	./scripts/update-to-os.sh
