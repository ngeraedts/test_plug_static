defmodule TestPlugStatic.HTTP do
  use Plug.Router

  # Static route only enabled when configuration value set
  Application.get_env(:test_plug_static, :static)
  |> case do
    dir when is_bitstring(dir) ->
      dir = Path.expand(dir)
      plug Plug.Static,
        at: "/static",
        from: dir
    _ -> nil
  end

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
