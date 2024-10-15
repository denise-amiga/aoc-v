import os
import benchmark

fn p2(txt string) int {
	ar := txt.split('x').map(it.int())
	mut a, mut b, mut c := ar[0], ar[1], ar[2]
	if a > b {
		a, b = b, a
	}
	if b > c {
		b, c = c, b
	}
	return 2 * (a + b) + a * b * c
}

fn main() {
	assert p2('2x3x4') == 34
	assert p2('1x1x10') == 14

	mut result := 0
	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		result += p2(l)
	}
	println(result)
	b.measure('P2')
}
