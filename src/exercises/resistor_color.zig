pub const ColorBand = enum(u8) {
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

    pub fn colorCode(self: ColorBand) u8 {
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

    pub fn colors() []const ColorBand {
        return &[_]ColorBand{
            .black,
            .brown,
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .violet,
            .grey,
            .white,
        };
    }
};
