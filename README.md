# lanbiraaakcomApi

Install dependencies

`composer install`

Edit the .env file (or create .env.local) and add DB params

`bin/console doctrine:database:create`

Run migrations

`bin/console doctrine:migrations:migrate`

## Swagger

[http://localhost/api/doc](http://localhost/api/doc)
