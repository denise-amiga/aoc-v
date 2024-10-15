import os
import benchmark
import crypto.md5

fn p1(txt string) int {
	mut result := 1
	for {
		if md5.hexhash('${txt}${result}').starts_with('00000') {
			return result
		}
		result += 1
	}
	return -1
}

fn main() {
	assert p1('abcdef') == 609043
	assert p1('pqrstuv') == 1048970

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p1(ar[0]))
	b.measure('P1')
}
