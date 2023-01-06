address 0x42 {
module m {
    fun foo(): u64 { 0 }
    fun calls_foo(): u64 { foo() } // valid
}


}

