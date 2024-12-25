import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile

fn read_input(day: Int) -> String {
  let filename = "input." <> int.to_string(day) <> ".txt"
  case simplifile.read(filename) {
    Ok(content) -> content
    Error(_) -> {
      io.print_error("Could not read input file: " <> filename)
      panic
    }
  }
}

pub fn main() {
  let input = read_input(1)
  let inlist = string.split(input, "\n")
  // io.println("inlist is: ")
  // io.println(string.join(inlist, "//"))

  let lol = list.map(inlist, fn(i) { string.split(i, " ") })

  let lnr = list.transpose(lol)

  let sorted = list.map(lnr, fn(l) { list.sort(l, by: string.compare) })
  let pairs: List(List(String)) = list.transpose(sorted)
  let safepairs: List(List(Int)) =
    list.map(pairs, fn(i) {
      list.map(i, fn(a) {
        case int.parse(a) {
          Ok(num) -> num
          Error(_) -> 0
        }
      })
    })

  // io.println("pairs is:")
  // io.println(string.join(list.map(pairs, fn(i) { string.join(i, ";") }), " "))

  let distance: List(Int) =
    list.map(safepairs, fn(i: List(Int)) {
      case list.reduce(i, with: fn(a, b) { a - b }) {
        Ok(num) -> num
        Error(_) -> 0
      }
    })

  // let things = list.map(distance, fn(i) { int.to_string(i) })
  // io.println(string.join(things, " / "))

  io.println("Solution is:")
  io.println(case list.reduce(distance, with: fn(a, b) { a + b }) {
    Ok(num) -> int.to_string(num)
    Error(_) -> "error"
  })
  // 👆️ Uncomment this line

  // why not 
}
