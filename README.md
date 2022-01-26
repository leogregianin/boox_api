# BooxApi

Bookstore REST API with Elixir and Phoenix

## Endpoints

  * GET `/books`
  * GET `/books/:id`
  * POST `/books`
  * PUT `/books/:id`
  * DELETE `/books/:id`
  * PATCH `/books/:id`

## Step by step

  * Install Erlang VM and Elixir
  * Install Phoenix Framework `mix archive.install hex phx_new`
  * Create new project `mix phx.new boox_api --no-html --binary-id`
  * Build Postgres container `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=boox_api -e POSTGRES_USER=boox_api --name postgrex postgres:alpine`
  * Edit config/dev.exs e config/test.exs for database connection
  * Run `mix ecto.create` for create `dev` database
  * Change `export MIX_ENV=test`
  * Run `mix ecto.create` for create `test` database
  * Create books schema: `mix phx.gen.context Store Book books title:string isbn:text:unique description:text price:float authors:array:string`
  * Running Migrations: `mix ecto.migrate`
  * Generate JSON endpoint: `mix phx.gen.json Store Book books title:string isbn:text:unique description:text price:float authors:array:string --no-context --no-schema`
  * Running tests: `mix test`
  * Running server: `mix phx.server`

## Local

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deploy

  * [Gigalixir deployment](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html)
  * API URL: `https://boox-api.gigalixirapp.com/api/books`

## License

  * BooxApi is licensed under the [MIT license](LICENSE).