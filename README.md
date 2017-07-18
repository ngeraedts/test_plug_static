# PlugstaticConf

A simple Elixir project to outline a configuration issue using Plug, Conform, and Distillery.


## Setup
The following steps outline the surrounding environment. You will need permission to write to `/opt/testapp/` for this.

```
> mkdir /opt/testapp/{dev,prod}
> echo "dev testfile" > /opt/testapp/dev/testfile.txt
> echo "prod testfile" > /opt/testapp/prod/testfile.txt

```

Build the application for both the `dev` and `prod` environments.

```
> mix deps.get
> mix do deps.compile, release
> MIX_ENV=prod mix deps.compile, release
```

## The Problem

When running the application via `iex`, the configuration values from `config/<env>.exs` appear to be used as expected; the `/static` route is avaialble, and serves the correct file based on the environment.

When a release is run (e.g. `_build/<env>/rel/test_plug_static/bin/test_plug_static console`), the static route does not serve files out of the specified path.
