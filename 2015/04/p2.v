import os
import benchmark
import crypto.md5

fn p2(txt string) int {
	mut result := 1
	for {
		if md5.hexhash('${txt}${result}').starts_with('000000') {
			return result
		}
		result += 1
	}
	return -1
}

fn main() {
	// assert p2('abcdef') == 609043
	// assert p2('pqrstuv') == 1048970

	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	println(p2(ar[0]))
	b.measure('P2')
}
