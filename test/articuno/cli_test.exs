defmodule CliTest do
  use ExUnit.Case, async: false
  doctest Articuno

  import Mock

  @default_help_message "Please add a command like `init` or `build`."

  # http://redgreenrepeat.com/2017/09/29/mocking-elixir-io-puts/

  describe "main/1" do
    test "When the app is run with no commands or arguments, I expect the default help message to appear." do
      with_mock IO, [], puts: fn _ -> nil end do
        Articuno.CLI.main([])
        assert called(IO.puts(@default_help_message))
      end
    end

    test "When the help command is ran I expect to see a helpful message on the console." do
      with_mock IO, [], puts: fn _ -> nil end do
        Articuno.CLI.main(["help"])
        assert called(IO.puts(@default_help_message))
      end
    end

    test "When the build example site basic is ran, the expected output is produced." do
    end

    test "When the build command is ran with no arguments a useful help message is presented" do
    end

    test "When the initialize command is ran a new default site is created" do
    end
  end
end
