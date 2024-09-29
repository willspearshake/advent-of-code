package main

import "core:os"
import "core:strings"
import "core:slice"
import "core:fmt"
import "core:strconv"
import "core:unicode/utf8"

main :: proc() {
	filepath := ".\\forest.txt"
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		// could not read file
		return
	}
	defer delete(data, context.allocator)

    entries: [dynamic]int

    count : int
    tree_path := 3
    check_coordinate := 0

    map_buffer := 31

    tree := "#"

	it := string(data)

    i : int = 0
	for line in strings.split_lines_iterator(&it) {




        if (i == 0) {
            i += 1
            continue
        }

        i += 1

        check_coordinate = tree_path % map_buffer
        tree_path += 3

        if (i == 3) {
            fmt.println(tree[0]," ",line[check_coordinate], " ", tree_path)
        }
    

        if (tree[0] == line[check_coordinate]) {count += 1}
        else {continue}

	}

    fmt.println(count)
}



