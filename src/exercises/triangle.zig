pub const Triangle = struct {
    first: f64,
    second: f64,
    third: f64,

    pub fn init(first: f64, second: f64, third: f64) TriangleError!Triangle {
        try verifyIfDegenerateAttributesExist(first, second, third);
        try verifyIfTriangleInequalityHolds(first, second, third);

        return Triangle{
            .first = first,
            .second = second,
            .third = third,
        };
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.first == self.second and self.second == self.third;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return (self.first == self.second and self.second != self.third) or
            (self.first != self.second and self.second == self.third) or
            (self.first == self.third and self.second != self.third);
    }

    pub fn isScalene(self: Triangle) bool {
        return self.first != self.second and
            self.second != self.third and
            self.third != self.first;
    }

    fn verifyIfDegenerateAttributesExist(first: f64, second: f64, third: f64) TriangleError!void {
        if (first <= 0 or second <= 0 or third <= 0) {
            return TriangleError.Degenerate;
        }
    }

    fn verifyIfTriangleInequalityHolds(first: f64, second: f64, third: f64) TriangleError!void {
        if ((first + second < third) or
            (second + third < first) or
            (first + third < second))
        {
            return TriangleError.InvalidInequality;
        }
    }
};

pub const TriangleError = error{
    InvalidInequality,
    Degenerate,
};
