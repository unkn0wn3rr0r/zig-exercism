const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const expectEqualSlices = std.testing.expectEqualSlices;

const resistor_color = @import("./exercises/resistor_color.zig");
const resistor_color_duo = @import("./exercises/resistor_color_duo.zig");

pub fn main() !void {}

test "resistor color" {
    const ColorBand = resistor_color.ColorBand;

    const color = ColorBand.colorCode(.red);
    try expect(color == 2);

    const allColors = ColorBand.colors();
    try expectEqualSlices(ColorBand, allColors, std.enums.values(ColorBand));
}

test "resistor color duo" {
    const ColorBand = resistor_color_duo.ColorBand;
    var colors: [3]ColorBand = [_]ColorBand{ .red, .black, .orange };
    var color: isize = try ColorBand.colorCode(&colors);
    try expect(color == 20);

    colors = [_]ColorBand{ .red, .black, .orange };
    color = try ColorBand.colorCode(&colors);
    try expect(color == 20);

    colors = [_]ColorBand{ .green, .yellow, .blue };
    color = try ColorBand.colorCode(&colors);
    try expect(color == 54);

    colors = [_]ColorBand{ .grey, .white, .orange };
    color = try ColorBand.colorCode(&colors);
    try expect(color == 89);

    colors = [_]ColorBand{ .white, .white, .orange };
    color = try ColorBand.colorCode(&colors);
    try expect(color == 99);

    colors = [_]ColorBand{ .white, .violet, .grey };
    color = try ColorBand.colorCode(&colors);
    try expect(color == 97);
}
