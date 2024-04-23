import argv
import c1_dev_ux
import c2_functional
import c3_simple_syntax
import c4_static_typing
import c5_result_type
import c6_pattern_matching
import c7_labelled_arguments
import c8_javascript_and_erlang
import c9_recursion
import gleam/io

pub fn main() {
  case argv.load().arguments {
    ["1"] -> c1_dev_ux.sample()
    ["2"] -> c2_functional.sample()
    ["3"] -> c3_simple_syntax.sample()
    ["4"] -> c4_static_typing.sample()
    ["5"] -> c5_result_type.sample()
    ["6"] -> c6_pattern_matching.sample()
    ["7"] -> c7_labelled_arguments.sample()
    ["8"] -> c8_javascript_and_erlang.sample()
    ["9"] -> c9_recursion.sample()
    _ -> io.println("No or invalid arguments provided. try `gleam run 2`")
  }
}
