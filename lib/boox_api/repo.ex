defmodule BooxApi.Repo do
  use Ecto.Repo,
    otp_app: :boox_api,
    adapter: Ecto.Adapters.Postgres
end
