import os
import benchmark

@[direct_array_access]
fn on(mut matrix [][]int, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			matrix[yy][xx] += 1
		}
	}
}

@[direct_array_access]
fn off(mut matrix [][]int, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			if matrix[yy][xx] > 0 {
				matrix[yy][xx] -= 1
			}
		}
	}
}

@[direct_array_access]
fn toggle(mut matrix [][]int, x int, y int, w int, h int) {
	for yy in y .. h + 1 {
		for xx in x .. w + 1 {
			matrix[yy][xx] += 2
		}
	}
}

@[direct_array_access]
fn p2(txt string, mut matrix [][]int) {
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
	mut matrix:= [][]int{len: 1000, init: []int{len: 1000}}

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		p2(l, mut matrix)
	}
	for y in 0 .. 1000 {
		for x in 0 .. 1000 {
			result += matrix[y][x]
		}
	}
	println(result)
	b.measure('P2')
}
