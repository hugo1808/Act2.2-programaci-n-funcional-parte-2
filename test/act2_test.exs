defmodule Act2Test do
  use ExUnit.Case
  test "First for fire ( cuando el marcado es P3 y P4, la transicion es E)" do
    f = Act2.ex1
    m = %{P0 => 0, P1 => 0, P2 => 0, P3 => 1, P4 => 1, P5 => 0}
    t = E
    assert Act2.fire(f,t,m) == %{P0 => 0, P1 => 0, P2 => 0, P3 => 0, P4 => 0, P5 => 1}
  end

  test "Second for fire ( cuando el marcado es P1 y P2, la transicion es D)" do
    f = Act2.ex1
    m = %{P0 => 0, P1 => 1, P2 => 1, P3 => 0, P4 => 0, P5 => 0}
    t = D
    assert Act2.fire(f,t,m) == %{P0 => 0, P1 => 0, P2 => 0, P3 => 1, P4 => 1, P5 => 0}
  end
end
