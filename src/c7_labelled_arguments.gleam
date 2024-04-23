import gleam/int
import gleam/io
import gleam/string

pub fn sample() {
  io.println("Running named arguments sample...")

  // do i introduce pipe operator yet?

  " how are you doing?  "
  |> string.trim()
  |> string.capitalise()
  |> string.replace("you", "u")
  |> io.println()

  // Labelled arguments

  string.replace("how are you doing?", "you", "u")
  string.replace(in: "how are you doing?", each: "you", with: "u")

  Nil
}

fn labelled(label: String) -> String {
  label
}

fn another_labelled(out in: Int) -> Int {
  in
}

fn pipe_usage() -> String {
  "a"
  |> string.replace(in: "abcd", with: "A")
}
