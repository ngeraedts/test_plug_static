# Import all plugins from `rel/plugins`
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"6f/RXjC482bQHk[/M|gX@Ih`e3!,JchMrA8^1FUp@ceLT{$=.Rd8;D?{[s_7WlU@"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"$z9)8)p~[1PvgIU~;KM%%1/%zn]*4V1hL5&ukT3~r>uXfEVD0&1h8(HojXS?dc<!"
end

release :test_plug_static do
  set version: current_version(:test_plug_static)
  set applications: [
    :runtime_tools
  ]
  plugin Conform.ReleasePlugin
end

