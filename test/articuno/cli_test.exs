# defmodule CliTest do
#   use ExUnit.Case
#   doctest Articuno

#   import Articuno.CLI, only: [parse_args: 1]

#   #   test ":help returned by option parsing with -h and --help options" do
#   #     assert parse_args(["-h", "anything"]) == :help
#   #     assert parse_args(["--help", "anything"]) == :help
#   #     assert parse_args([]) == :help
#   #   end

#   #   test "when a site path but no build path is provided the default build path is used" do
#   #     assert parse_args(["."]) == {"/Users/zorn/??"}
#   #   end

#   #   test "two values returned if two given" do
#   #     assert parse_args([".", "_build/"]) == {".", "_build/"}
#   #   end

#   #   test "count is defaulted if two values given" do
#   #     assert parse_args(["user", "project"]) == {"user", "project", 4}
#   #   end
# end
