import gleam/io

pub fn sample() {
  io.println("Running Pattern matching sample...")

  // Pattern matching
  let x = 1

  // let #(a, b) = #(1, 2)
  // let #(a, _) = #(1, 2)

  // let [a, b] = [1, 2]
  // let [a, ..] = [1, 2]
  // let [.., b] = [1, 2]

  // Case 也是 pattern matching
  case x {
    1 -> "one"
    2 -> "two"
    _ -> "other"
  }

  case #(1, 2, 3) {
    #(_, 3, _) -> "第二個是 3"
    #(_, _, n) if n > 2 -> "第三個大於 2"
    _ -> "其他"
  }

  case Student("John", 18) {
    Student("Sam", _) -> "Sam"
    Student(_, age) if age >= 18 -> "18"
    _ -> "other"
  }

  Nil
}

type Student {
  Student(name: String, age: Int)
}
