defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Earth escape velocity is 11.2" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Moon escape velocity is 2.4" do
    assert Physics.Rocketry.escape_velocity(:moon) == 2.4
  end

  test "Earth escape velocity is 5.1" do
    assert Physics.Rocketry.escape_velocity(:mars) == 5.1
  end

  test "Earth (explicit) escape velocity is 11.2" do
    assert Physics.Rocketry.escape_velocity(%{mass: 5.972e24, radius: 6.371e6}) == 11.2
  end

  test "Orbital term for height of 100km is 1.5" do
    assert Physics.Rocketry.orbital_term(100) == 1.5
  end
end
