# Data Type

## 정수

- move는 부호없는 정수 u8~ u256까지 지원

## 리터럴

```move
let explicit_u8 = 1u8;
let explicit_u256 = 1u256;

let simple_u8: u8 = 1;

let hex_u8: u8 = 0x1;
let hex_u16: u16 = 0x1BAE;
let hex_u32: u32 = 0xDEAD80;
let hex_u64: u64 = 0xCAFE;
let hex_u128: u128 = 0xDEADBEEF;
let hex_u256: u256 = 0x1123_456A_BCDE_F;
```

## 산수

```
+ 덧셈
- 빼기
* 곱하기
% 분할
/ 나누기
```

## 비트

```
&
|
^ xor
```

## 비트이동

```
<<< 왼쪽으로 이동
>>> 오른쪽으로 이동

```

## 비교

```
<
>
<=
>=
```

## 주조

```
(e as T) : 정수 표현식 e를 유형으로 캐스트 T
```

## 소유권

- 스칼라 ->copy

## 논리

```
&&
||
!
```

## 주소

- address:128비트
- 주어진 주소에 Modules와 Resources두가지 저장가능

## 주소 및 구문

- 주소는 이름 또는 숫자의 두가지 형태로 제공
- 주소가 표현식으로 사용되는 경우 주소 앞에 @문자(예: @<numerical_value>또는 )를 붙여야 한다.

```move
@<named_address_identifier>.
```

- 표현 문맥 밖에서 주소는 선행 @문자(즉, <numerical_value>또는 ) 없이 쓰여질 수 있습니다

```move
<named_address_identifier>.
```

- @일반적으로 네임스페이스 항목에서 표현식 항목으로 주소를 가져오는 연산자로 생각

## 명명된 주소

- 값 수준뿐만 아니라 주소가 사용되는 모든 지점에서 숫자 값 대신 식별자를 사용할 수 있도록 하는 기능
- 명명된 주소는 Move Packages에서 최상위 수준 요소(모듈 및 스크립트 외부)로 선언 및 바인딩되거나 Move 컴파일러에 인수로 전달

```move
let a1: address = @0x1; // shorthand for 0x00000000000000000000000000000001
let a2: address = @0x42; // shorthand for 0x00000000000000000000000000000042
let a3: address = @0xDEADBEEF; // shorthand for 0x000000000000000000000000DEADBEEF
let a4: address = @0x0000000000000000000000000000000A;
let a5: address = @std; // Assigns `a5` the value of the named address `std`
let a6: address = @66;
let a7: address = @0x42;

module 66::some_module {   // Not in expression context, so no @ needed
    use 0x1::other_module; // Not in expression context so no @ needed
    use std::vector;       // Can use a named address as a namespace item when using other modules
    ...
}

module std::other_module {  // Can use a named address as a namespace item to declare a module
    ...
}

```

## vector

- vector<T>

```move
(vector[]: vector<bool>);
(vector[0u8, 1u8, 2u8]: vector<u8>);
(vector<u128>[]: vector<u128>);
(vector<address>[@0x42, @0x100]: vector<address>);

```

## vector<u8>리터럴

- 공개 키 또는 해시 결과와 같은 암호화 목적으로 자주 사용
