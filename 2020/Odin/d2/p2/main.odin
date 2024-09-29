package main

import "core:os"
import "core:strings"
import "core:slice"
import "core:fmt"
import "core:strconv"
import "core:unicode/utf8"

main :: proc() {
	filepath := ".\\passwords.txt"
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		// could not read file
		return
	}
	defer delete(data, context.allocator)

    entries: [dynamic]int

	it := string(data)

    count : int

	for line in strings.split_lines_iterator(&it) {
		if isValidPassword(line) {count += 1}
	}
    fmt.println(count)
}


isValidPassword :: proc(p: string) -> bool {

    splitted_line := strings.split(p," ")

    rule := strings.split(splitted_line[0],"-")
    letter := splitted_line[1]
    password := splitted_line[2]

    a,_ := strconv.parse_int(rule[1])
    b,_ := strconv.parse_int(rule[0])

    a -= 1
    b -= 1

    if (password[a] == letter[0] && password[b] != letter[0]) ||
       (password[a] != letter[0] && password[b] == letter[0]) {
        return true
    }
    else {return false}


}

