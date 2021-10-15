defmodule SimpleAuth.Repo do
  use Ecto.Repo,
    otp_app: :simple_auth,
    adapter: Ecto.Adapters.Postgres
end
