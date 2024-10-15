import os
import benchmark

@[direct_array_access]
fn on(mut matrix [][]bool, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			matrix[yy][xx] = true
		}
	}
}

@[direct_array_access]
fn off(mut matrix [][]bool, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			matrix[yy][xx] = false
		}
	}
}

@[direct_array_access]
fn toggle(mut matrix [][]bool, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			if matrix[yy][xx] {
				matrix[yy][xx] = false
			} else {
				matrix[yy][xx] = true
			}
		}
	}
}

@[direct_array_access]
fn p1(txt string, mut matrix [][]bool) {
	match txt[6] {
		`n` { on(mut matrix, ...txt[8..].replace(' through ', ',').split(',').map(it.int())) }
		`f` { off(mut matrix, ...txt[9..].replace(' through ', ',').split(',').map(it.int())) }
		` ` { toggle(mut matrix, ...txt[7..].replace(' through ', ',').split(',').map(it.int())) }
		else { panic('Error') }
	}
}

@[direct_array_access]
fn main() {
	mut result := 0
	mut matrix := [][]bool{len: 1000, init: []bool{len: 1000}}

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		p1(l, mut matrix)
	}
	for y in 0 .. 1000 {
		for x in 0 .. 1000 {
			if matrix[y][x] {
				result += 1
			}
		}
	}
	println(result)
	b.measure('P1')
}
