# move_study

- move에는 module, script 두가지유형의 프로그램
- 모듈은 구조체 유형을 정의
- 구조체 유형은 Move의 전역 스키마 정의
- 모듈은 저장소 업데이트 규칙 정의
- 모듈 자체도 전역 저장소 저장

## 스크립트

```
script {
    <use>*
    <constants>*
    fun <identifier><[type parameters: constraint]*>([identifier: type]*) <function_body>
}
```

- 스크립트 블록은 use선언으로 시작
- 그뒤에 상수 및 함수선언

## 모듈

```
module <address>::<identifier> {
    (<use> | <friend> | <type> | <function> | <constant>)*
}

```

```
module 0x42::test {
    struct Example has copy, drop { i: u64 }

    use std::debug;
    friend 0x42::another_test;

    const ONE: u64 = 1;

    public fun print(x: u64) {
        let sum = x + ONE;
        let example = Example { i: sum };
        debug::print(&sum)
    }
}
```

- module 0x42::test부분은 모듈 이 전역 저장소 의 계정 주소 로 test게시되도록 지정
- 일반적으로 모듈 이름은 소문자로 시작
- 모듈은 types의 모음
- friend키워드는 신뢰할수있는 모듈 목록 지정
- const:상수

## 정수

- move는 u8,u16,u32,u64,u128,u256

## 리터럴

- 나머지 유형은 러스트링 동일

```
// literals with explicit annotations;
let explicit_u8 = 1u8;
let explicit_u16 = 1u16;
let explicit_u32 = 1u32;
let explicit_u64 = 2u64;
let explicit_u128 = 3u128;
let explicit_u256 = 1u256;
let explicit_u64_underscored = 154_322_973u64;

// literals with simple inference
let simple_u8: u8 = 1;
let simple_u16: u16 = 1;
let simple_u32: u32 = 1;
let simple_u64: u64 = 2;
let simple_u128: u128 = 3;
let simple_u256: u256 = 1;

// literals with more complex inference
let complex_u8 = 1; // inferred: u8
// right hand argument to shift must be u8
let _unused = 10 << complex_u8;

let x: u8 = 38;
let complex_u8 = 2; // inferred: u8
// arguments to `+` must have the same type
let _unused = x + complex_u8;

let complex_u128 = 133_876; // inferred: u128
// inferred from function argument type
function_that_takes_u128(complex_u128);

// literals can be written in hex
let hex_u8: u8 = 0x1;
let hex_u16: u16 = 0x1BAE;
let hex_u32: u32 = 0xDEAD80;
let hex_u64: u64 = 0xCAFE;
let hex_u128: u128 = 0xDEADBEEF;
let hex_u256: u256 = 0x1123_456A_BCDE_F;

```

## address

- copy가능 -> 스칼라로
- 128비트(16바이트) 식별자
- 주어진 주소에 Modules와 Resources두가지 저장가능
- 주소는 이름 또는 숫자의 두가지 형태로 제공
- 주소가 표현식으로 사용되는 경우 @붙여애한다.(명명된 주소)
- 표현 문맥 밖에서는 @없이 사용
- @일반적으로 네임스페이스 항목에서 표현식 항목으로 주소를 가져오는 연산자로 생각
- 명명된 주소는 값 수준뿐만 아니라 주소가 사용되는 모든 지점에서 숫자 값 대신 식별자를 사용할 수 있도록 하는 기능

```
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

## 글로벌 스토리지 운영

- address값은 exists, borrow_global, borrow_global_mut및 move_from 작업 과 함께 사용

## Vec

- vector<T>Move에서 제공하는 유일한 기본 컬렉션 유형

```
(vector[]: vector<bool>);
(vector[0u8, 1u8, 2u8]: vector<u8>);
(vector<u128>[]: vector<u128>);
(vector<address>[@0x42, @0x100]: vector<address>);

```

- Move에서 벡터의 일반적인 사용 사례는 vector<u8>. 이러한 값은 공개 키 또는 해시 결과와 같은 암호화 목적으로 자주 사용
- 바이트 문자열 b"Hello!\n".

```
\n	새 줄(또는 줄바꿈)
\r	캐리지 리턴
\t	탭
\\	백슬래시
\0	없는
\"	인용하다
\xHH	16진수 이스케이프, 16진수 바이트 시퀀스 삽입HH
```

```
vector::empty<T>(): vector<T>	유형의 값을 저장할 수 있는 빈 벡터를 만듭니다.T	절대
vector::singleton<T>(t: T): vector<T>	다음을 포함하는 크기 1의 벡터를 만듭니다.t	절대
vector::push_back<T>(v: &mut vector<T>, t: T)	t끝에 추가v	절대
vector::pop_back<T>(v: &mut vector<T>): T	의 마지막 요소를 제거하고 반환v	v비어 있는 경우
vector::borrow<T>(v: &vector<T>, i: u64): &T	Tat 인덱스 에 대한 불변 참조를 반환합니다.i	i범위 내에 있지 않은 경우
vector::borrow_mut<T>(v: &mut vector<T>, i: u64): &mut T	Tat 인덱스 에 대한 변경 가능한 참조를 반환합니다.i	i범위 내에 있지 않은 경우
vector::destroy_empty<T>(v: vector<T>)	삭제v	v비어 있지 않은 경우
vector::append<T>(v1: &mut vector<T>, v2: vector<T>)	v2끝에 요소를 추가하십시오.v1	절대
vector::contains<T>(v: &vector<T>, e: &T): bool	e벡터에 있으면 true를 반환합니다 v. 그렇지 않으면 false를 반환합니다.	절대
vector::swap<T>(v: &mut vector<T>, i: u64, j: u64)	i벡터의 th 및 jth 인덱스에 있는 요소를 교체합니다.v	i또는 j범위를 벗어난 경우
vector::reverse<T>(v: &mut vector<T>)	v제자리 에 있는 벡터의 요소 순서를 반대로 바꿉니다.	절대
vector::index_of<T>(v: &vector<T>, e: &T): (bool, u64)	index 의 벡터 에 있는 (true, i)경우 반환 합니다 . 그렇지 않으면 반환evi(false, 0)	절대
vector::remove<T>(v: &mut vector<T>, i: u64): T	ivector 의 th번째 요소를 제거하고 v모든 후속 요소를 이동합니다. 이것은 O(n)이며 벡터에서 요소의 순서를 유지합니다.	i범위를 벗어난 경우
vector::swap_remove<T>(v: &mut vector<T>, i: u64): T	i벡터의 4번째 요소를 마지막 요소로 교체한 v다음 요소를 팝합니다. 이것은 O(1)이지만 벡터의 요소 순서는 유지하지 않습니다.	i범위를 벗어난 경우
```

- copy가 있어야 복사 가능

## 서명자

- signer값은 복사할 수 없다 copy및 \*불가능
- signer기본 제공 이동 리소스 유형
- signer는 보유자가 특정 을 대신하여 행동할 수 있도록 하는 기능address
- 모든 signer인수가 먼저 와야한다,

```
signer::address_of(&signer): address	addressthis 로 래핑된 를 반환합니다 &signer.
signer::borrow_address(&signer): &address	addressthis 로 래핑된 참조를 반환합니다 &signer.

```

## 참조연산자

- Move는 참조를 만들고 확장할 뿐만 아니라 변경 가능한 참조를 변경 불가능한 참조로 변환하기 위한 연산자를 제공

```
&e	&T여기서 e: Tand T는 비참조 유형입니다.	에 대한 불변 참조 생성e
&mut e	&mut T여기서 e: Tand T는 비참조 유형입니다.	에 대한 변경 가능한 참조를 만듭니다 e.
&e.f	&T어디e.f: T	fstruct 의 필드에 대한 불변 참조를 만듭니다 e.
&mut e.f	&mut T어디e.f: T	fstruct 의 필드에 대한 변경 가능한 참조를 만듭니다 e.
freeze(e)	&T어디e: &mut T	변경 가능한 참조 e를 변경 불가능한 참조로 변환합니다.
```

```
let s = S { f: 10 };
let f_ref1: &u64 = &s.f; // works
let s_ref: &S = &s;
let f_ref2: &u64 = &s_ref.f // also works

```

## 참고 문헌을 통한 읽기 및 쓰기

- 변경 가능한 참조와 변경 불가능한 참조를 모두 읽어 참조된 값의 복사본을 생성가능
- 변경 가능한 참조만 작성할 수 있다.

```
*e	T또는 _ e_&T&mut T	가 가리키는 값을 읽습니다.e
*e1 = e2	()어디서 e1: &mut T그리고e2: T	의 값을 e1로 업데이트합니다 e2.
```

```
fun copy_resource_via_ref_bad(c: Coin) {
    let c_ref = &c;
    let counterfeit: Coin = *c_ref; // not allowed!
    pay(c);
    pay(counterfeit);
}
```

## freeze추론

- 컴파일러 freeze가 필요한 곳에 명령을 삽입하기 때문에 작동

```
fun takes_immut_returns_immut(x: &u64): &u64 { x }

// freeze inference on return value
fun takes_mut_returns_immut(x: &mut u64): &u64 { x }

fun expression_examples() {
    let x = 0;
    let y = 0;
    takes_immut_returns_immut(&x); // no inference
    takes_immut_returns_immut(&mut x); // inferred freeze(&mut x)
    takes_mut_returns_immut(&mut x); // no inference

    assert!(&x == &mut y, 42); // inferred freeze(&mut y)
}

fun assignment_examples() {
    let x = 0;
    let y = 0;
    let imm_ref: &u64 = &x;

    imm_ref = &x; // no inference
    imm_ref = &mut y; // inferred freeze(&mut y)
}

```

## Move소유권

```
fun reference_copies(s: &mut S) {
  let s_copy1 = s; // ok
  let s_extension = &mut s.f; // also ok
  let s_copy2 = s; // still ok
  ...
}

```

- 참조와 튜플은 구조체의 필드 값으로 저장할 수 없는 유일한 유형
- 구조체 내부에 참조 저장을 지원

## 튜플과 단위

- 튜플을 완전히 지원하지 않는다.
- 로컬 변수에 저장할수 없다.
- 튜플을 복사하려면 먼저 지역 변수에 넣어야 하므로 튜플은 현재에만 이동할 수 있다.

```
()	(): ()	단위, 빈 튜플 또는 인수가 0인 튜플
(e1, ..., en)	(e1, ..., en): (T1, ..., Tn)여기서 e_i: Tist 0 < i <= n와n > 0	A n-튜플, 인수 n수의 튜플, n요소 가 있는 튜플
```

```
address 0x42 {
module example {
    // all 3 of these functions are equivalent

    // when no return type is provided, it is assumed to be `()`
    fun returns_unit_1() { }

    // there is an implicit () value in empty expression blocks
    fun returns_unit_2(): () { }

    // explicit version of `returns_unit_1` and `returns_unit_2`
    fun returns_unit_3(): () { () }


    fun returns_3_values(): (u64, bool, address) {
        (0, false, @0x42)
    }
    fun returns_4_values(x: &u64): (&u64, u8, u128, vector<u8>) {
        (x, 0, 1, b"foobar")
    }
}
}

```

## 중단 및 어설션

- return그리고 abort 실행을 종료하는 두개의 제어흐름구조

## entry수식어

- entry수정자는 스크립트와 같이 모듈 함수를 안전하고 직접 호출할 수 있도록 설계
- entry함수는 모듈의 "주요" 함수이며 Move 프로그램이 실행되기 시작하는 위치를 지정

```
address 0x42 {
module m {
    public entry fun foo(): u64 { 0 }
    fun calls_foo(): u64 { foo() } // valid!
}

module n {
    fun calls_m_foo(): u64 {
        0x42::m::foo() // valid!
    }
}

module other {
    public entry fun calls_m_foo(): u64 {
        0x42::m::foo() // valid!
    }
}
}

script {
    fun calls_m_foo(): u64 {
        0x42::m::foo() // valid!
    }
}

```

## 유형능력

- 능력은 지정된 유형의 값에 허용되는 작업을 제어하는 ​​Move의 입력 기능

- copy
  이 기능이 있는 유형의 값을 복사할 수 있습니다.
- drop
  이 기능이 있는 유형의 값을 팝/드롭할 수 있습니다.
- store
  이 기능이 있는 유형의 값이 전역 저장소의 구조체 내에 존재할 수 있습니다.
- key
  유형이 글로벌 스토리지 작업의 키 역할을 할 수 있습니다.

## copy

- copy기능은 해당 기능이 있는 유형의 값을 복사할 수 있도록 허용합
- copy연산자를 사용하여 지역 변수에서 값을 복사하고 역참조를 사용하여 참조\*e 를 통해 값을 복사하는 기능을 제어

## drop

- 이 drop기능을 사용하면 해당 기능이 있는 유형의 값을 삭제

## store

- store기능을 사용하면 이 기능이 있는 유형의 값이 글로벌 스토리지의 구조체(리소스) 내부에 존재할 수 있지만 반드시 글로벌 스토리지의 최상위 리소스로 존재할 필요는 없

## key

- 형이 글로벌 스토리지 작업key 의 키 역할을 할 수 있다.
- move_toborrow_globalmove_fromkeykey 값이 이면 key해당 값 안에 포함된 모든 값이 store

## 빌트인 유형

대부분의 기본 내장 유형에는 copy, drop및 가 있습니다. 단 , store는 예외입니다 .signerdrop

bool, u8, u16, u32, u64, u128, u256그리고 address모두 copy, drop, 및 store.
signer가지다drop
복사할 수 없으며 글로벌 저장소에 넣을 수 없습니다.
vector<T>의 능력에 따라 copy, drop및 를 가질 수 있습니다 . storeT
자세한 내용은 조건부 기능 및 제네릭 유형 을 참조하세요.
불변 참조 &와 가변 참조 &mut모두 copy및 가 drop있습니다.
참조 대상이 아니라 참조 자체를 복사 및 삭제하는 것을 말합니다.
참조는 전역 저장소에 표시될 수 없으므로 store.
프리미티브 유형에는 가 없습니다. 즉, 전역 저장 작업key 에 직접 사용할 수 없습니다 .

## 친구

- friend구문은 현재 모듈에서 신뢰하는 모듈을 선언하는 데 사용

```
address 0x42 {
module a {
    friend 0x42::b;
}
}

```

## 글로벌 스토리지

```
move_to<T>(&signer,T)	T아래에 게시signer.address	signer.address이미 보유하고 있는 경우T
move_from<T>(address): T	T에서 제거 address하고 반환	address보유하지 않는 경우T
borrow_global_mut<T>(address): &mut T	T아래에 저장된 변경 가능한 참조를 반환합니다.address	address보유하지 않는 경우T
borrow_global<T>(address): &T	T아래에 저장된 불변 참조를 반환합니다.address	address보유하지 않는 경우T
exists<T>(address): bool	a 가 아래에 저장되어 true있으면 반환Taddress	절대
```
