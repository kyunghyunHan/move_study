# move_study

- aptos

## signer

- signer는 명시적으로 명확하지 않는 한 계정에 자산을 처가하거나 제거할수 있는 엑세스제한

## data

- 인덱스로 표시된 소유권이 있는 단일 계정에 배치

```move
struct CoinStore has key {
    coins: table<address, Coin>,
}
```

- 계정에 동전을 저장하는 접근 방식을 선호

```move
struct CoinStore has key {
    coin: Coin,
}
```

- entry :실제 진입함수로 만들어 함수 호출을 분리하여 재진입 방지
- public: 어디서나 호출
- public(entry) : 해당 트랜잭션에 정의된 메서드만 함수를 호출하도록 허용
- public(friend): 현재 모듈이 신뢰하는 모듈을 선언하는 데 사용
- public(script)- Aptos 네트워크에서 임의의 Move 코드 제출, 컴파일 및 실행 가능
