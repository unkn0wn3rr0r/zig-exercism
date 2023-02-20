pub fn steps(number: isize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;

    var result: usize = 0;
    var curr: isize = number;
    while (curr != 1) {
        if (@rem(curr, 2) == 0) curr = @divExact(curr, 2) else curr = curr * 3 + 1;
        result += 1;
    }
    return result;
}

pub const ComputationError = error{IllegalArgument};
