///in
/// 

module 0x2::vec{
//literals with explicit annotations;
   public fun vec_study() : u8 {
         let explicit_u8 = 1u8;

   


















         explicit_u8
    }


   
}
script{


    fun byte_and_hex_strings(){}
}
script {
fun byte_and_hex_strings() {
    assert!(b"" == x"", 0);
    assert!(b"Hello!\n" == x"48656C6C6F210A", 1);
    assert!(b"\x48\x65\x6C\x6C\x6F\x21\x0A" == x"48656C6C6F210A", 2);
    assert!(
        b"\"Hello\tworld!\"\n \r \\Null=\0" ==
            x"2248656C6C6F09776F726C6421220A200D205C4E756C6C3D00",
        3
    );
}
}

script{
   use std::vector;
  fun destroy_any_vector<T>(vec: vector<T>) {
    vector::destroy_empty(vec) // deleting this line will cause a compiler error
}
}
