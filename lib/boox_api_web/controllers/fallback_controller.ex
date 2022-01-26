defmodule BooxApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use BooxApiWeb, :controller

  # This clause is an example of how to handle resources that bad request.
  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BooxApiWeb.ErrorView)
    |> render(:"400")
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(BooxApiWeb.ErrorView)
    |> render(:"404")
  end

  # This clause will handle invalid resource data.
  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(BooxApiWeb.ErrorView)
    |> render(:"422")
  end
end
