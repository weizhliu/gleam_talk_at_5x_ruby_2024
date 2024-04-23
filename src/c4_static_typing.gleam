import gleam/io

pub fn sample() {
  io.println("Running Static typing sample...")

  io.println("elevetor_go(Up)")
  io.println(elevetor_go(Up))
  io.println("elevetor_go(Down)")
  io.println(elevetor_go(Down))
}

/// Custom type
pub type Control {
  Up
  Down
}

fn elevetor_go(control: Control) -> String {
  case control {
    Up -> "電梯向上"
    Down -> "電梯向下"
  }
}

/// Record
pub type Blog {
  Blog(posts: List(Post))
}

pub type Post {
  Post(title: String, content: String)
}
