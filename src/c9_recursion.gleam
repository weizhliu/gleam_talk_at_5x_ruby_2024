import gleam/int
import gleam/io
import gleam/list

pub fn sample() {
  io.println("Running compile to erlang sample...")

  // 大部分的時候都可以用 list module 解決
  // 如果需要迴圈，因為所有的變數都是 immutable，所以需要用遞迴

  five_times_ruby()
  // io.debug(add_some_until(100, 0))
  // better_say_ruby(5)
  Nil
}

fn five_times_ruby() {
  say_ruby(5)
}

fn say_ruby(times: Int) -> Nil {
  io.println("Ruby")
  case times <= 1 {
    True -> Nil
    False -> say_ruby(times - 1)
  }
}

// 講一下 tail call optimization
//
//

fn add_some_until(over: Int, start_from: Int) -> Int {
  let next_number = start_from + int.random(10)
  io.debug(next_number)
  case next_number > over {
    True -> start_from
    False -> add_some_until(over, next_number)
  }
}

// 當然可以的話用 range 比較不會寫錯
fn better_say_ruby(times: Int) -> Nil {
  times
  |> list.range(from: 1)
  |> list.each(fn(_) { io.println("Ruby") })
}
