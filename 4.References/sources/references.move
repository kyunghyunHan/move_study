///in
module 0x2::address{
//literals with explicit annotations;
   struct S{
        f:u64
          }
 struct B {
    c:u64
 }
  struct A{
    b:B
  } 

  fun f(a:&A):&u64{
    &a.b.c
  } 

   struct Coin{x:u32}
//    fun copy_resource_via_ref_bad(c:Coin){
//           let c_ref= &c;

//           let counterfeit:Coin= *c_ref;
//           pay(c);
//           pay(counterfeit);



//    }
   public fun address_study() : S {
   let s= S{f:10};
   let f_ref1:&u64 = &s.f;//works
   let s_ref:&S= &s;


   let f_ref2:&u64= &s_ref.f;//also works
    


  let  x= 7;
  let y:&u64= &x;

//  let z: &&u64 = &y; will not compile


       s


















      
    }


   
}
