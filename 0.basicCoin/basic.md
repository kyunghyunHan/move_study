# 🚗Move Tutorial

## 📝모듈작성

- sources:package애 대한 모든 move코드가 있는곳
- move.toml:cargo.toml 과 유사

```move
module 0xCAFE::BasicCoin {
    ...
}
```

- module:Move코드의 빌딩블록,특정 주소로 정의된다.
- BasicCoin은 0xCAFE에서만 게시할수 있다.

```move
module 0xCAFE::BasicCoin {
    struct Coin has key {
        value: u64,
    }

    public fun mint(account: signer, value: u64) {
        move_to(&account, Coin { value })
    }
}
```

- 구조체(struct)를 정의하고 이를 계정에 저장하는 함수
- signer:보유자가 특정을 대신해서 행동할수 있는 기능 address

```
move build
```

## 단위 테스트

## BasicCoin module 설계

## BasicCoin module 구현

## 모듈로 단위 테스트 추가 및 사용

```
move test
```

## BasicCoin모듈 일반화

## Move Priver사용

## 모듈 공식 사양 작성
