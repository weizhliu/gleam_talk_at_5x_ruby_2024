import gleam/io
import gleam/list

pub fn sample() {
  io.println("Running functional sample...")

  let x = 5
  let y = add_three(x)
  io.debug(y)

  let z = list.map([1, 2, 3, 4, 5], adder(3))
  io.debug(z)

  io.debug(add_two(1))

  Nil
}

pub fn add_two(x: Int) -> Int {
  x + 2
}

/// private function
fn add_three(x: Int) -> Int {
  x + 3
}

/// higher order function 高階函數
fn adder(x: Int) -> fn(Int) -> Int {
  fn(n) { n + x }
}
