import os
import benchmark

@[direct_array_access]
fn check1(txt string) bool {
	for i in 0 .. txt.len - 1 {
		if txt[i + 2..].contains(txt[i..i + 2]) {
			// println(txt[i..i+2])
			return true
		}
	}
	return false
}

@[direct_array_access]
fn check2(txt string) bool {
	for i in 0 .. txt.len - 2 {
		if txt[i] == txt[i + 2] {
			// println(txt[i..i+3])
			return true
		}
	}
	return false
}

fn p2(txt string) bool {
	return check1(txt) && check2(txt)
}

fn main() {
	assert p2('qjhvhtzxzqqjkmpb') == true
	assert p2('xxyxx') == true
	assert p2('uurcxstgmygtbstg') == false
	assert p2('ieodomkazucvgmuy') == false

	mut result := 0
	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		if p2(l) {
			result += 1
		}
	}
	println(result)
	b.measure('P2')
}
