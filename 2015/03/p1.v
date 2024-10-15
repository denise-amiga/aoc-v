import os
import benchmark

fn p1(txt string) int {
	mut x := 0
	mut y := 0
	mut m := map[string]int{}
	m['(${x}, ${y})'] += 1
	for c in txt {
		if c == `^` {
			y += 1
		} else if c == `>` {
			x += 1
		} else if c == `v` {
			y -= 1
		} else if c == `<` {
			x -= 1
		}
		m['(${x}, ${y})'] += 1
	}
	return m.len
}

fn main() {
	assert p1('>') == 2
	assert p1('^>v<') == 4
	assert p1('^v^v^v^v^v') == 2

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p1(ar[0]))
	b.measure('P1')
}
