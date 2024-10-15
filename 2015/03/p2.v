import os
import benchmark

fn p2(txt string) int {
	mut x0 := 0
	mut y0 := 0
	mut x1 := 0
	mut y1 := 0
	mut m := map[string]int{}
	m['(${x0}, ${y0})'] += 1
	for i, c in txt {
		if i % 2 == 0 {
			if c == `^` {
				y0 += 1
			} else if c == `>` {
				x0 += 1
			} else if c == `v` {
				y0 -= 1
			} else if c == `<` {
				x0 -= 1
			}
			m['(${x0}, ${y0})'] += 1
		} else {
			if c == `^` {
				y1 += 1
			} else if c == `>` {
				x1 += 1
			} else if c == `v` {
				y1 -= 1
			} else if c == `<` {
				x1 -= 1
			}
			m['(${x1}, ${y1})'] += 1
		}
	}
	return m.len
}

fn main() {
	assert p2('^v') == 3
	assert p2('^>v<') == 3
	assert p2('^v^v^v^v^v') == 11

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p2(ar[0]))
	b.measure('P2')
}
