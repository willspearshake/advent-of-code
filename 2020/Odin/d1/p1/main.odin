package d1

import "core:os"
import "core:strings"
import "core:strconv"
import "core:fmt"
import "core:slice"



main :: proc() {

    filepath: string = ".\\d1.txt"
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		// could not read file
		return
	}
	defer delete(data, context.allocator)

    entries: [dynamic]int

	it := string(data)
	for line in strings.split_lines_iterator(&it) {
        n, ok := strconv.parse_int(line)
		append(&entries,n)
	}
    slice.sort(entries[:])

    for i in 0..=len(entries)-1 {
        internal_check: for j in (i+1)..=len(entries)-1 {
            check_sum := entries[i] + entries[j]
            if  check_sum == 2020 {
                fmt.println(entries[i]," ",entries[j]," ",entries[i] * entries[j])
            }
            else if check_sum > 2020 {
                break internal_check
            }
            else {
                continue
            }

        }
    }
}