// module 0xCAFE::BasicCoin{
//     struct Coin has key{
//         value:u64,
//     }
//     public fun mint(account:signer,value:u64){
//         move_to(&account,Coin{value})
//     }
// }

module 0xCAFE::BasicCoin{
    struct Coin has key{
        value:u64,
    }
    public fun mint(account:signer,value:u64){
        move_to(&account,Coin{value})
    }

    #[test(account = @0xC0FFEE)]
   fun test_mint_10(account: signer) acquires Coin {
        let addr = 0x1::signer::address_of(&account);
        mint(account, 10);
        // Make sure there is a `Coin` resource under `addr` with a value of `10`.
        // We can access this resource and its value since we are in the
        // same module that defined the `Coin` resource.
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }
}