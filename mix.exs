defmodule Dwolla.Mixfile do
  use Mix.Project

  @description """
    An Elixir Library for Dwolla
  """

  def project do
    [app: :dwolla,
     version: "1.0.1",
     description: @description,
     elixir: "~> 1.5",
     elixirc_paths: elixirc_paths(Mix.env),
     package: package(),
     deps: deps(),
     docs: docs(),
     source_url: "https://github.com/wfgilman/dwolla-elixir",
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test, "coveralls.detail": :test]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
     {:httpoison, "~> 0.13"},
     {:poison, "~> 3.0"},
     {:recase, "~> 0.2"},
     {:bypass, "~> 0.8", only: [:test]},
     {:credo, "~> 0.5", only: [:dev], runtime: false},
     {:excoveralls, "~> 0.6", only: [:test]},
     {:ex_doc, "~> 0.19", only: [:dev], runtime: false},
    ]
  end

  defp package do
    [
      name: :dwolla_elixir,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Will Gilman"],
      links: %{"Github" => "https://github.com/wfgilman/dwolla-elixir"}
    ]
  end

  defp docs do
    [
      extras: ["parameters.md"]
    ]
  end
end
