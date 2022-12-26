address 0x42 {
module example {
    // all 3 of these functions are equivalent

    // when no return type is provided, it is assumed to be `()`
    fun returns_unit_1() { }

    // there is an implicit () value in empty expression blocks
    fun returns_unit_2(): () { }

    // explicit version of `returns_unit_1` and `returns_unit_2`
    fun returns_unit_3(): () { () }


    fun returns_3_values(): (u64, bool, address) {
        (0, false, @0x42)
    }
    fun returns_4_values(x: &u64): (&u64, u8, u128, vector<u8>) {
        (x, 0, 1, b"foobar")
    }
}
}