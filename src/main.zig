const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;
const expectError = std.testing.expectError;
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqualStrings = std.testing.expectEqualStrings;

const darts = @import("./exercises/darts.zig");
const two_fer = @import("./exercises/two_fer.zig");
const isogram = @import("./exercises/isogram.zig");
const triangle = @import("./exercises/triangle.zig");
const resistor_color = @import("./exercises/resistor_color.zig");
const resistor_color_duo = @import("./exercises/resistor_color_duo.zig");
const collatz_conjecture = @import("./exercises/collatz_conjecture.zig");
const difference_of_squares = @import("./exercises/difference_of_squares.zig");

pub fn main() !void {}

test "darts" {
    const init = darts.Coordinate.init;

    var coordinate = init(-9.0, 9.0);
    var expected: isize = 0;
    var actual: isize = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.0, 10.0);
    expected = 1;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(-5.0, 0.0);
    expected = 5;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.0, -1.0);
    expected = 10;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.0, 0.0);
    expected = 10;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(-0.1, -0.1);
    expected = 10;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.7, 0.7);
    expected = 10;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.8, -0.8);
    expected = 5;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(3.5, -3.5);
    expected = 5;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(-3.6, -3.6);
    expected = 1;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(-7.0, 7.0);
    expected = 1;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(7.1, -7.1);
    expected = 0;
    actual = coordinate.score();
    try expectEqual(expected, actual);

    coordinate = init(0.5, -4.0);
    expected = 5;
    actual = coordinate.score();
    try expectEqual(expected, actual);
}

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

test "isogram" {
    const isIsogram = isogram.isIsogram;

    try expect(isIsogram(""));
    try expect(!isIsogram("zzyzx"));
    try expect(isIsogram("isogram"));
    try expect(!isIsogram("eleven"));
    try expect(!isIsogram("angola"));
    try expect(!isIsogram("Alphabet"));
    try expect(!isIsogram("alphAbet"));
    try expect(!isIsogram("accentor"));
    try expect(!isIsogram(" lumberjackK "));
    try expect(!isIsogram("up-to-date"));
    try expect(isIsogram("six-year-old"));
    try expect(isIsogram("subdermatoglyphic"));
    try expect(isIsogram("thumbscrew-japingly"));
    try expect(!isIsogram("thumbscrew-jappingly"));
    try expect(isIsogram("Emily Jung Schwartzkopf--"));
}

test "triangle" {
    const init = triangle.Triangle.init;

    var actual = try init(2, 2, 2);
    try expect(!actual.isScalene());
    actual = try init(2, 2, 1);
    try expect(!actual.isScalene());
    actual = try init(3, 2, 1);
    try expect(actual.isScalene());

    actual = try init(3, 3, 3);
    try expect(!actual.isIsosceles());
    actual = try init(3, 2, 1);
    try expect(!actual.isIsosceles());
    actual = try init(2, 2, 1);
    try expect(actual.isIsosceles());

    var actual_err = init(55, 2, 1);
    try expectError(triangle.TriangleError.InvalidInequality, actual_err);
    actual_err = init(0, 0, 0);
    try expectError(triangle.TriangleError.Degenerate, actual_err);
    actual_err = init(-1, -300, 0);
    try expectError(triangle.TriangleError.Degenerate, actual_err);

    actual = try init(4, 55, 55);
    try expect(!actual.isEquilateral());
    actual = try init(55, 55, 55);
    try expect(actual.isEquilateral());
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

test "collatz conjecture" {
    const steps = collatz_conjecture.steps;
    const ComputationError = collatz_conjecture.ComputationError;

    var expected: usize = 0;
    var actual = try steps(1);
    try expectEqual(expected, actual);

    expected = 4;
    actual = try steps(16);
    try expectEqual(expected, actual);

    expected = 9;
    actual = try steps(12);
    try expectEqual(expected, actual);

    expected = 152;
    actual = try steps(1_000_000);
    try expectEqual(expected, actual);

    var expected_err: anyerror = ComputationError.IllegalArgument;
    var result = steps(0);
    try expectError(expected_err, result);

    expected_err = ComputationError.IllegalArgument;
    result = steps(-15);
    try expectError(expected_err, result);
}

test "difference of squares" {
    const squareOfSum = difference_of_squares.squareOfSum;
    const sumOfSquares = difference_of_squares.sumOfSquares;
    const differenceOfSquares = difference_of_squares.differenceOfSquares;

    var expected: isize = 1;
    var actual = squareOfSum(1);
    try expectEqual(expected, actual);

    expected = 225;
    actual = squareOfSum(5);
    try expectEqual(expected, actual);

    expected = 25_502_500;
    actual = squareOfSum(100);
    try expectEqual(expected, actual);

    expected = 1;
    actual = sumOfSquares(1);
    try expectEqual(expected, actual);

    expected = 55;
    actual = sumOfSquares(5);
    try expectEqual(expected, actual);

    expected = 338_350;
    actual = sumOfSquares(100);
    try expectEqual(expected, actual);

    expected = 0;
    actual = differenceOfSquares(1);
    try expectEqual(expected, actual);

    expected = 170;
    actual = differenceOfSquares(5);
    try expectEqual(expected, actual);

    expected = 25_164_150;
    actual = differenceOfSquares(100);
    try expectEqual(expected, actual);
}
