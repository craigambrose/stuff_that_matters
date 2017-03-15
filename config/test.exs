use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stuff_that_matters, StuffThatMatters.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :stuff_that_matters, StuffThatMatters.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "stuff_that_matters_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
