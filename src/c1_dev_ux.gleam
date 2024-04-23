//// Dev UX

// gleam cli 除了必要的 build, run 之外，也提供了：
// - formatter
// - test
// - docs
// - lsp
//
// 與 elixir 一樣使用 [hex.pm](https://hex.pm)
// 也可以透過 hexdocs.pm 來查看文件 [hexdocs](https://hexdocs.pm/gleam_stdlib/)
//
// 另外 gleam 提供了 [packages](https://packages.gleam.run/) 來搜尋 gleam 套件
//
import gleam/io

pub fn sample() {
  io.println("Running Dev UX sample...")
  io.println("這頁沒東西")
  Nil
}
