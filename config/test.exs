use Mix.Config

# Configure your database
config :transport_cms, TransportCms.Repo,
  username: "postgres",
  password: "postgres",
  database: "transport_cms_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :transport_cms, TransportCmsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
