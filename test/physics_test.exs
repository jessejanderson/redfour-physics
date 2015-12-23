defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Earth escape velocity is 11.2" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Earth (explicit) escape velocity is 11.2" do
    assert Physics.Rocketry.escape_velocity(%{mass: 5.972e24, radius: 6.371e6}) == 11.2
  end

  test "Moon escape velocity is 2.4" do
    assert Physics.Rocketry.escape_velocity(%{mass: 7.35e22, radius: 1.738e6}) == 2.4
  end

  test "Mars escape velocity is 5.1" do
    assert Physics.Rocketry.escape_velocity(%{mass: 6.39e23, radius: 3.4e6}) == 5.1
  end
end
