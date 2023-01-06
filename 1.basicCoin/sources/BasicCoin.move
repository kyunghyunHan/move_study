
/// This module defines a minimal Coin and Balance.
module NameAddr::BasicCoin{
use std::singer;
   struct Coin has store {
        value: u64
    }
    /// Struct representing the balance of each address.
    struct Balance has key {
        coin: Coin
    }

}