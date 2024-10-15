import os
import benchmark

fn p2(txt string) int {
	mut result := 0
	for i, c in txt {
		if c == `(` {
			result += 1
		} else if c == `)` {
			result -= 1
		}
		if result == -1 {
			return i + 1
		}
	}
	return -1
}

fn main() {
	assert p2(')') == 1
	assert p2('()())') == 5

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p2(ar[0]))
	b.measure('P2')

}