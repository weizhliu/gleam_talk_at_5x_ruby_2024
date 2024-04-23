import gleam/io

pub fn sample() {
  io.println("Running Simple syntax sample...")

  io.println("is_it_any_good(False)")
  io.println(is_it_any_good(True))

  io.println("is_magic_number(42)")
  io.debug(is_magic_number(42))
  io.println("is_magic_number(43)")
  io.debug(is_magic_number(43))

  io.println("get_name(\"Hello, Gleam\")")
  io.println(get_name("Hello, Gleam"))

  Nil
}

// gleam 沒有 if, 只有 case

/// controller flow
/// 沒有 if
fn is_it_any_good(input: Bool) -> String {
  case input {
    True -> "Yes"
    False -> "No"
  }
}

fn is_magic_number(n: Int) -> Bool {
  case n {
    42 -> True
    _other -> False
  }
}

fn get_name(x: String) -> String {
  case x {
    "Hello, " <> name -> name
    _ -> "Unknown"
  }
}
