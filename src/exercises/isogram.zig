const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn isIsogram(str: []const u8) bool {
    var buffer: [500]u8 = undefined;
    var fix_buff_alloc = std.heap.FixedBufferAllocator.init(&buffer);
    var allocator = fix_buff_alloc.allocator();
    var map = std.AutoHashMap(u8, void).init(allocator);

    for (str) |k| {
        if (k == '-' or k == ' ') continue;
        if (k >= 65 and k <= 122) {
            if (k >= 65 and k <= 90 and map.getKey(k + 32) != null) return false;
            if (k >= 90 and k <= 122 and map.getKey(k - 32) != null) return false;
        }
        if (map.contains(k)) return false else map.put(k, {}) catch unreachable;
    }

    return true;
}
