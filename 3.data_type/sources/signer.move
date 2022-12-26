///in
module 0x2::signer{
//literals with explicit annotations;
   public fun signer_study() : address {
         let explicit_u8 = 1u8;
         let a1= @0x1;
         let a2= @0x2;



         a1
    }


   
}
script{
    use std::signer;
    fun main(s:signer){
        assert!(signer::address_of(&s)==@0x42,0);
    }
}