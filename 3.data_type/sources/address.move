///in
module 0x2::address{
//literals with explicit annotations;
   public fun address_study() : address{
         let a1:address= @0x1;//shorthand for 0x00000000000000000000000000000001
         let a2:address= @0x42; //0x00000000000000000000000000000042
      let a3:address= @0xDEADBEEF;
      let a4:address= @0x0000000000000000000000000000000A;
      let a5:address= @std;
      let a6:address= @66;
      let a7:address= @0x42;

      







    












         a1
    }


   
}
module 66::some_module {   // Not in expression context, so no @ needed
    use 0x1::other_module; // Not in expression context so no @ needed
    use std::vector;       // Can use a named address as a namespace item when using other modules
    
}module std::other_module {  // Can use a named address as a namespace item to declare a module
    
}