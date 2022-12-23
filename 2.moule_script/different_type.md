# different types

- move에는 두가지 타입이 있다.
- module and scripts
- **module** are libaries that define struct types along whit functions that oparate on these
- **struct** types difine the schema of themselves are also strored in global strage.

## script

```
script{
    <use>*
    <constants>*
    fun <identifier><[type parameters:constraint*]>(
        [identifier:type]*
        <function_body>

    )
}
```

```move

script{


    use std::debug;

    const ONE:u64= 1;

    fun main(x:u64){
        let sum = x+ONE;
        debug::print(&sum)
    }
}
```

## module

```
module <address>::<identifier>{
    (<use>|<friend>|<type>|<function>|<constant>)*
}
```
