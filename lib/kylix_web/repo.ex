defmodule KylixWeb.Repo do
  use Ecto.Repo,
    otp_app: :kylix_web,
    adapter: Ecto.Adapters.Postgres
end
