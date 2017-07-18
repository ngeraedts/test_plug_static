defmodule TestPlugStatic.Mixfile do
  use Mix.Project

  def project do
    [
      app: :test_plug_static,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TestPlugStatic, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:distillery, "~> 1.0"},
      {:conform, "== 2.2.2"}
    ]
  end
end
