import os
import benchmark

fn p1(txt string) int {
    mut result := 0
    return result
}

fn main() {
    assert p1('') == 0

    mut b := benchmark.start()
    ar := os.read_lines('input.txt') or { panic('No input') }
    println(p1(ar[0]))
    b.measure('P1')
}
