defmodule Physics.Rocketry do

  import Calcs
  import Physics.Laws
  import Planets

  def escape_velocity(:earth), do: escape_velocity(earth)
  def escape_velocity(:moon),  do: escape_velocity(moon)
  def escape_velocity(:mars),  do: escape_velocity(mars)
  def escape_velocity(planet) when is_map(planet) do
    planet
    |> calculate_escape
    |> to_km
    |> to_nearest_tenth
  end

  def orbital_speed(height),        do: orbital_speed(earth, height)
  def orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(height)
    |> square_root
  end

  def orbital_acceleration(height),         do: orbital_acceleration(earth, height)
  def orbital_acceleration(:earth, height), do: orbital_acceleration(earth, height)
  def orbital_acceleration(:moon, height),  do: orbital_acceleration(moon, height)
  def orbital_acceleration(:mars, height),  do: orbital_acceleration(mars, height)
  def orbital_acceleration(planet, height)  do
    (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
  end

  # T = √(4 * pi^2 * R^3) / G * M
  def orbital_term(height),         do: orbital_term(earth, height)
  def orbital_term(:earth, height), do: orbital_term(earth, height)
  def orbital_term(:moon, height),  do: orbital_term(moon, height)
  def orbital_term(:mars, height),  do: orbital_term(mars, height)
  def orbital_term(planet, height)  do
    4 * (:math.pi |> squared) * (orbital_radius(planet, height) |> cubed) / (newtons_gravitational_constant * planet.mass)
    |> square_root
    |> seconds_to_hours
  end

  # EXTRA CREDIT
  # (doesn't seem to work?)
  # R = ³√G * M * T^2 / 4 * pi^2
  def calculate_time_by_term(hours),        do: calculate_time_by_term(earth, hours)
  def calculate_time_by_term(planet, hours) do
    cube_root(newtons_gravitational_constant) * planet.mass * (hours |> squared) / 4 * (:math.pi |> squared)
    |> orbital_radius
  end

  def orbital_radius(height), do: orbital_radius(earth, height)
  def orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
    |> square_root
  end
end
