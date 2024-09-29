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

    slope_list : [5][2]int= {
        {1, 1},
        {3, 1}, 
        {5, 1},
        {7, 1},
        {1, 2},
    }

    s := 1
    for x in slope_list {
        s *= slope_counter(string(data),x.x,x.y)
    }
   fmt.println(s)
}



slope_counter :: proc(text: string, right: int, down: int) -> int {
    count : int
    tree_path := right
    check_coordinate := 0

    map_buffer := 31

    tree := "#"

	it := text

    i : int = 0
	for line in strings.split_lines_iterator(&it) {

        if (i == 0) || (i % down != 0 && down != 1) {
            i += 1
            continue
        }

        i += 1

        check_coordinate = tree_path % map_buffer
        tree_path += right

        if (tree[0] == line[check_coordinate]) {count += 1}
        else {continue}

	}

    fmt.println(count)
    return count
}