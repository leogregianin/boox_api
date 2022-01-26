import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
  config :boox_api, BooxApi.Repo,
  username: "boox_api",
  password: "boox_api",
  hostname: "172.24.76.58",
  database: "postgrex_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :boox_api, BooxApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wal/aGwyGEQCwgEEpDLL0gXwvETboEeyc5qYtxDqmy7HRuufsKHEjFP2P8VSZDY6",
  server: false

# In test we don't send emails.
config :boox_api, BooxApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
