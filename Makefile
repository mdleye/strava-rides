compose=docker compose

dc:
	@${compose} -f .docker/docker-compose.yml $(cmd)

dcr:
	@make dc cmd="run --rm php-cli $(cmd)"

stop:
	@make dc cmd="stop"

up:
	@make dc cmd="up -d"

build-containers:
	@make dc cmd="build $(arg)"

down:
	@make dc cmd="down"

## Helpers.
git-add:
	@make csfix && git add .

composer:
	@make dcr cmd="composer $(arg)"

console:
	@make dcr cmd="bin/console $(arg)"

migrate-diff:
	@make dcr cmd="bin/doctrine-migrations diff"

migrate-run:
	@make dcr cmd="bin/doctrine-migrations migrate"

phpunit:
	@make dcr cmd="vendor/bin/phpunit $(arg)"

phpstan:
	@make dcr cmd="vendor/bin/phpstan --memory-limit=1G $(arg)"

csfix:
	@make dcr cmd="vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php"

cleanup-snapshots:
	@make dcr cmd="find . -name __snapshots__ -type d -prune -exec rm -rf {} \; "