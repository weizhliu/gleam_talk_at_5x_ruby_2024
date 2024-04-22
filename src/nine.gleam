import gleam/dynamic
import gleam/int
import gleam/io
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
  io.debug(msg.like)
  io.debug(model.liked)

  let liked = case list.contains(model.liked, msg.like) {
    True -> list.filter(model.liked, fn(x) { x != msg.like })
    False -> [msg.like, ..model.liked]
  }

  #(Model(liked: liked), effect.none())
}

pub fn view(model: Model) -> element.Element(Msg) {
  let liked = model.liked

  html.div([], [
    like_button(1, liked),
    like_button(2, liked),
    like_button(3, liked),
    like_button(4, liked),
    like_button(5, liked),
    like_button(6, liked),
    like_button(7, liked),
    like_button(8, liked),
    like_button(9, liked),
  ])
}

fn like_button(number: Int, liked: List(Int)) -> element.Element(Msg) {
  html.button([event.on_click(Msg(number))], [
    element.text(int.to_string(number)),
    is_liked(number, liked),
  ])
}

fn is_liked(number: Int, liked: List(Int)) -> element.Element(Msg) {
  case list.contains(liked, number) {
    True -> element.text("❤️")
    False -> element.text("")
  }
}
