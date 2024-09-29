package main

import "core:os"
import "core:strings"
import "core:slice"
import "core:fmt"
import "core:strconv"
import "core:unicode/utf8"

main :: proc() {
	filepath := ".\\passports.txt"
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		// could not read file
		return
	}
	defer delete(data, context.allocator)

    entries: [dynamic]int

    count : int

	it := string(data)

    s : string = ""

    separator := ""
	for line in strings.split_lines_iterator(&it) {
        if line == "" {
            if isPassportValid(s) {
                count += 1
            }
            s = ""
            continue
        }
        s_to_concatenate := [?]string {s,line," "}
        s = strings.concatenate(s_to_concatenate[:])
	}
    if isPassportValid(s) {
        count += 1
    }
    fmt.println(count)
}



isPassportValid :: proc(p: string) -> bool {
    passport_to_test := strings.split(p," ")

    //fmt.println(len(passport_to_test))
    if len(passport_to_test) == 9 {
        //fmt.println(passport_to_test)
        return true
    }
    else if len(passport_to_test) == 8 {
        for f in passport_to_test {
            if strings.contains(f,"cid:") {
                //fmt.println(passport_to_test)
                return false
            }
        }
        return true
    }
    else {
        //fmt.println(passport_to_test)
        return false
    }
}


