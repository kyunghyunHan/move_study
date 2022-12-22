module NameAddr::BasicCoin{


    struct Coin has store{
        value:u64
    }
    struct Balance has key{
        coin:Coin
    }
    public fun publish_balance(account: &signer) {  }

   
    public fun mint(module_owner: &signer, mint_addr: address, amount: u64) acquires Balance { }

   
    public fun balance_of(owner: address): u64 acquires Balance { }

    
    public fun transfer(from: &signer, to: address, amount: u64) acquires Balance {  }
}