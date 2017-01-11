use Mix.Releases.Config,

  default_release: :distillery_test,
  default_environment: :with_erts

environment :with_erts do
  set include_erts: true
  set cookie: :test
end

environment :without_erts do
  set include_erts: false
  set cookie: :test
end

release :distillery_test do
  set version: current_version(:distillery_test)
  set config: "config/config.exs"
  plugin Conform.ReleasePlugin
end
