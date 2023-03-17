defmodule Act2 do

    def ex1 do
      %{
        P0 => [A],
        A => [P1, P2],
        P1 => [B, D],
        B => [P3],
        D => [P3, P4],
        P2 => [D, C],
        C => [P4],
        P3 => [E],
        P4 => [E],
        E => [P5]
      }
    end


    def ex2 do
      %{P0 => [A], A => [P1, P2], P1 => [B],B => [P3], D => [P2],P2 => [C], C => [P4], P3 => [E], P4 => [E,D], E => [P5]}
    end

    def ex3 do
      %{P0 => [A], A => [P1, P2], P1 => [B,D], B => [P3], D => [P3], P2 => [D,C], C => [P4], P3 => [E], P4 => [E], E => [P5]}
    end

    def preset(f, p) do
      f
      |> Map.filter(fn {_key, val} -> p in val end)
      |> Map.keys

    end

    def postset(f, p) do
      f
      |> Map.get(p)

    end


    # m = %{P0 => 1, P1 => 0, P2 => 0, P3 => 0, P4 => 0, P5 => 0}

    def isEnabled?(f, t, m) do

      MapSet.subset?(
        preset(f, t) |> MapSet.new,
        Map.filter(m, fn {_key, val} -> val == 1 end) |> Map.keys |> MapSet.new()

      )
    end

    def fire(f, t, m) do
      if isEnabled?(f, t, m) do
        # (M \ *t) U t*
        Map.merge(m, preset(f, t) |> Map.new(fn x -> {x, 0} end))
        |> Map.merge(postset(f, t) |> Map.new(fn x -> {x, 1} end))

      else
        m
      end
    end
  end
