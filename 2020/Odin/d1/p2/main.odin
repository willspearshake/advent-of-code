package main2

import "core:os"
import "core:strings"
import "core:slice"
import "core:fmt"
import "core:strconv"

main :: proc() {
	filepath := ".\\entries.txt"
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		// could not read file
		return
	}
	defer delete(data, context.allocator)

    entries: [dynamic]int

	it := string(data)

	for line in strings.split_lines_iterator(&it) {
		
		entry, ok := strconv.parse_int(line)
		
		append(&entries,entry)
	}


	slice.sort(entries[:])
	//fmt.println(entries)

	first_loop: for i in 0..=len(entries)-1 {
		second_loop: for j in i+1..=len(entries)-1 {
			third_loop: for k in j+1..=len(entries)-1 {
				if entries[i] + entries[j] + entries[k] == 2020 {
					fmt.println(entries[i]," ",entries[j]," ",entries[k]," ",entries[i] * entries[j] * entries[k])
				}
				else if entries[i] + entries[j] + entries[k] > 2020 {
					break third_loop
				}
				else {
					continue
				}
			}
		}
	}
}