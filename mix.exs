defmodule DistilleryTest.Mixfile do
  use Mix.Project

  def project do
    [app: :distillery_test,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :conform]]
  end

  defp deps do
    [
      {:distillery, github: "bitwalker/distillery"},
      {:conform, github: "bitwalker/conform"},
    ]
  end
end
