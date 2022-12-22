module 0xCAFE::BasicCoin{
    struct Coin has key{
        value:u64,
    }
    public fun mint(account:signer,value:u64){
        move_to(&account,Coin{value})
    }
}
//signer:특정 주소에 대한 제어권을 나타내는 위조할