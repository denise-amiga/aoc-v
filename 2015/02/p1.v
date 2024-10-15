import os
import benchmark

fn p1(txt string) int {
	ar := txt.split('x').map(it.int())
	mut a, mut b, mut c := ar[0], ar[1], ar[2]
	if a > b {
		a, b = b, a
	}
	if b > c {
		b, c = c, b
	}
	return 2 * (a * b + b * c + a * c) + a * b
}

fn main() {
	assert p1('2x3x4') == 58
	assert p1('1x1x10') == 43

	mut result := 0
	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		result += p1(l)
	}
	println(result)
	b.measure('P1')
}
