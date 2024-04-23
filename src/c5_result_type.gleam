import gleam/int
import gleam/io
import gleam/list
import simplifile

pub fn sample() {
  io.println("Running Result type sample...")
  let result = case simplifile.read(from: "README.md") {
    Ok(content) -> content
    Error(_) -> "error"
  }
  // io.println(result)

  let find_result = list.find([1, 2, 3], fn(x) { x > 2 })
  case find_result {
    Ok(result) -> "Got result: " <> int.to_string(result)
    Error(_) -> "Error"
  }
  |> io.debug

  let assert Ok(find_result) = list.find([1, 2, 3], fn(x) { x > 2 })
  io.debug(find_result)
  Nil
}
