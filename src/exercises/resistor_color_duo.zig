pub const ColorBand = enum(isize) {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,

    fn getColorCode(self: ColorBand) u32 {
        return switch (self) {
            .black => 0,
            .brown => 1,
            .red => 2,
            .orange => 3,
            .yellow => 4,
            .green => 5,
            .blue => 6,
            .violet => 7,
            .grey => 8,
            .white => 9,
        };
    }

    pub fn colorCode(colors: []const ColorBand) anyerror!isize {
        return colors[0].getColorCode() * 10 + colors[1].getColorCode();
    }
};
