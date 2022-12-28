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



  fun returns_unit() {}
    fun returns_2_values(): (bool, bool) { (true, false) }
    fun returns_4_values(x: &u64): (&u64, u8, u128, vector<u8>) { (x, 0, 1, b"foobar") }



    fun example(cond:bool){
        let ()=();
        let (x,y):(u8,u64)=(0,1);
        let (a,b,c,d) = (@0x0,1,false,b"");


        ()=();
        (x,y)= if(cond)(1,2,)else(3,4);
        (a,b,c,d)= (@0x1,1,true,b"1");
    }



    fun example_with_function_calls(){
        let () = returns_unit();
        let (x, y): (bool, bool) = returns_2_values();
        let (a, b, c, d) = returns_4_values(&0);

        () = returns_unit();
        (x, y) = returns_2_values();
        (a, b, c, d) = returns_4_values(&1);

        let x: &u64 = &0;
let y: &mut u64 = &mut 1;

// (&u64, &mut u64) is a subtype of (&u64, &u64)
// since &mut u64 is a subtype of &u64
let (a, b): (&u64, &u64) = (x, y);

// (&mut u64, &mut u64) is a subtype of (&u64, &u64)
// since &mut u64 is a subtype of &u64
let (c, d): (&u64, &u64) = (y, y);

// error! (&u64, &mut u64) is NOT a subtype of (&mut u64, &mut u64)
// since &u64 is NOT a subtype of &mut u64
// let (e, f): (&mut u64, &mut u64) = (x, y);


    }

       
}
}