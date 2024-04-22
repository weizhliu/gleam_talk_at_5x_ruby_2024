import gleam/int
import gleam/list
import lustre
import lustre/attribute
import lustre/effect
import lustre/element
import lustre/element/html
import lustre/event

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

pub type Model {
  Model(liked: List(Int))
}

fn init(_flags) -> #(Model, effect.Effect(Msg)) {
  #(Model(liked: []), effect.none())
}

pub type Msg {
  Msg(like: Int)
}

pub fn update(model: Model, msg: Msg) -> #(Model, effect.Effect(Msg)) {
  let liked = case list.contains(model.liked, msg.like) {
    True -> list.filter(model.liked, fn(x) { x != msg.like })
    False -> [msg.like, ..model.liked]
  }

  #(Model(liked: liked), effect.none())
}

pub fn view(model: Model) -> element.Element(Msg) {
  let liked = model.liked
  html.div([attribute.class("flex content-center justify-center h-dvh")], [
    html.div([attribute.class("grid grid-cols-3 m-auto gap-1")], [
      block(4, "靜態性別", liked),
      block(9, "遞迴", liked),
      block(6, "模式匹配", liked),
      block(7, "標籤參數", liked),
      block(1, "開發體驗", liked),
      block(3, "極簡語法", liked),
      block(2, "函數式", liked),
      block(5, "Result", liked),
      block(8, "編譯成 JavaScript 或 Erlang", liked),
    ]),
  ])
}

fn block(number: Int, title: String, liked: List(Int)) -> element.Element(Msg) {
  html.div(
    [
      event.on_click(Msg(number)),
      attribute.class(
        "bg-gray-50 border size-40 font-bold text-2xl
        flex flex-col items-center justify-center cursor-pointer",
      ),
      is_liked(number, liked),
    ],
    [
      html.h3([], [element.text(int.to_string(number))]),
      html.span([attribute.class("text-center")], [element.text(title)]),
    ],
  )
}

fn is_liked(number: Int, liked: List(Int)) -> attribute.Attribute(Msg) {
  case list.contains(liked, number) {
    True -> attribute.class("!bg-amber-200")
    False -> attribute.class("")
  }
}
