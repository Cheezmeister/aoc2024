import gleam/io
import gleam/string
import gleam/list

const input = "4 2
3 7
5 1"


pub fn main() {
  let inlist = string.split(input, "\n")
  
  let lol = list.map(inlist, fn(i) { string.split(i, " ") } )

  io.println("Solution is:")
  
  let lnr = list.transpose(lol)
  let sorted = list.map(lnr, fn(l) { list.sort(l, by: string.compare) })
  let pairs: List(List(String)) =  list.transpose(sorted)
  let distance = list.map(pairs, fn(i: List(String)) { 
    let j = list.map(i, fn(a) { 0 + parseInt(a) })
    list.reduce(j, with: fn(a,b){Int(a)-Int(b)}) 
  })

  io.println(string.join( list.map(distance, fn(l) { string.join(l, ",") } ), " / "))
  // 👆️ Uncomment this line
  
// why not 
}
