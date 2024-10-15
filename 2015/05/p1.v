import os
import benchmark

fn check1(txt string) bool {
	mut v := 0
	vowels := [u8(`a`), u8(`e`), u8(`i`), u8(`o`), u8(`u`)]
	for c in txt {
		if c in vowels {
			v += 1
		}
	}
	return v > 2
}

fn check2(txt string) bool {
	for i in 0 .. txt.len - 1 {
		if txt[i] == txt[i + 1] {
			return true
		}
	}
	return false
}

fn check3(txt string) bool {
	fails := ['ab', 'cd', 'pq', 'xy']
	for t in fails {
		if txt.contains(t) {
			return false
		}
	}
	return true
}

fn p1(txt string) bool {
	return check1(txt) && check2(txt) && check3(txt)
}

fn main() {
	assert p1('ugknbfddgicrmopn') == true
	assert p1('aaa') == true
	assert p1('jchzalrnumimnmhp') == false
	assert p1('haegwjzuvuyypxyu') == false
	assert p1('dvszwmarrgswjxmb') == false

	mut result := 0
	mut b := benchmark.start()
	ar := os.read_lines('input.txt') or { panic('No input') }
	for l in ar {
		if p1(l) {
			result += 1
		}
	}
	println(result)
	b.measure('P1')
}
