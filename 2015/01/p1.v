import os
import benchmark

fn p1(txt string) int {
	mut result := 0
	for c in txt {
		if c == `(` {
			result += 1
		} else if c == `)` {
			result -= 1
		}
	}
	return result
}

fn main() {
	assert p1('(())') == 0
	assert p1('()()') == 0
	assert p1('(((') == 3
	assert p1('(()(()(') == 3
	assert p1('))(((((') == 3
	assert p1('())') == -1
	assert p1('))(') == -1
	assert p1(')))') == -3
	assert p1(')())())') == -3

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p1(ar[0]))
	b.measure('P1')
}
