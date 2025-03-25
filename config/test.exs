import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kylix_web, KylixWeb.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "kylix_web_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kylix_web, KylixWebWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Ik3l3SVNoGp4F2UBEPvKGpzFe3wArwsSFiNvNdVrdFqCbF9epjZN8I3H1YJ0ylXP",
  server: false

# In test we don't send emails.
config :kylix_web, KylixWeb.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
