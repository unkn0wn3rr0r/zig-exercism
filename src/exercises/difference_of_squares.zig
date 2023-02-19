const std = @import("std");
const math = std.math;

pub fn squareOfSum(number: isize) isize {
    var n: isize = number;
    var i: isize = 0;
    var result: isize = 0;
    while (n > 0) : (i += 1) {
        result += n;
        n -= 1;
    }
    return result * result;
}

pub fn sumOfSquares(number: isize) isize {
    var n: isize = number;
    var i: isize = 0;
    var result: isize = 0;
    while (n > 0) : (i += 1) {
        result += n * n;
        n -= 1;
    }
    return result;
}

pub fn differenceOfSquares(number: isize) isize {
    return squareOfSum(number) - sumOfSquares(number);
}
