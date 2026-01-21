.PHONY: env clean help

# Get current user's UID and primary GID
USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)

# Default target
env: .env

.env: .env.example
	@echo "Creating .env file with user $(USER_ID):$(GROUP_ID)..."
	@sed -e "s/APACHE_RUN_USER=#[0-9]*/APACHE_RUN_USER=#$(USER_ID)/" \
	     -e "s/APACHE_RUN_GROUP=#[0-9]*/APACHE_RUN_GROUP=#$(GROUP_ID)/" \
	     .env.example > .env
	@echo ".env file created successfully!"

clean:
	@echo "Removing .env file..."
	@rm -f .env
	@echo ".env file removed!"

help:
	@echo "Available targets:"
	@echo "  env    - Create .env file from .env.example (default)"
	@echo "  clean  - Remove generated .env file"
	@echo "  help   - Show this help message"
