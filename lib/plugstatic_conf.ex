defmodule TestPlugStatic do
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, TestPlugStatic.HTTP, [],
                                      [port: 8000,
                                       acceptors: 3])
    ]

    opts = [strategy: :one_for_one, name: TestPlugStatic.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
