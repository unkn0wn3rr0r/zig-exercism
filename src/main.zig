const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqualStrings = std.testing.expectEqualStrings;

const two_fer = @import("./exercises/two_fer.zig");
const resistor_color = @import("./exercises/resistor_color.zig");
const resistor_color_duo = @import("./exercises/resistor_color_duo.zig");

pub fn main() !void {}

test "two fer" {
    const twoFer = two_fer.twoFer;

    var response: [100]u8 = undefined;

    var expected: []const u8 = "One for you, one for me.";
    var actual: []u8 = try twoFer(&response, null);
    try expectEqualStrings(expected, actual);

    expected = "One for Alice, one for me.";
    actual = try two_fer.twoFer(&response, "Alice");
    try expectEqualStrings(expected, actual);
}

test "resistor color" {
    const ColorBand = resistor_color.ColorBand;

    const color = ColorBand.colorCode(.red);
    try expect(color == 2);

    const allColors = ColorBand.colors();
    try expectEqualSlices(ColorBand, allColors, std.enums.values(ColorBand));
}

test "resistor color duo" {
    const colorCode = resistor_color_duo.colorCode;
    const ColorBand = resistor_color_duo.ColorBand;

    var colors: [3]ColorBand = [_]ColorBand{ .red, .black, .orange };
    var color: isize = try colorCode(&colors);
    try expect(color == 20);

    colors = [_]ColorBand{ .red, .black, .orange };
    color = try colorCode(&colors);
    try expect(color == 20);

    colors = [_]ColorBand{ .green, .yellow, .blue };
    color = try colorCode(&colors);
    try expect(color == 54);

    colors = [_]ColorBand{ .grey, .white, .orange };
    color = try colorCode(&colors);
    try expect(color == 89);

    colors = [_]ColorBand{ .white, .white, .orange };
    color = try colorCode(&colors);
    try expect(color == 99);

    colors = [_]ColorBand{ .white, .violet, .grey };
    color = try colorCode(&colors);
    try expect(color == 97);
}
