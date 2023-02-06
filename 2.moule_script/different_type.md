# different types

- move에는 두가지 타입
- module:구조체 유형을 정의하는 라이브러리
- 구조체 유형: Move의 전역 저장소 스키마를 정의 하고 모듈 함수는 저장소 업데이트 규칙을 정의
- 모듈 자체도 전역 저장소에 저장
- main script는 기존 언어 의 함수와 유사한 실행 가능한 진입점
- 스크립트는 일반적으로 전역 저장소에 대한 업데이트를 수행하는 게시된 모듈의 기능을 호출
- 스크립트는 전역 저장소에 게시되지 않는 임시 코드 스니펫

## script

```move
script {
    <use>*
    <constants>*
    fun <identifier><[type parameters: constraint]*>([identifier: type]*) <function_body>
}
```

- script블록은 모든 use선언
- 그 뒤에 상수 와 (마지막으로) 기본 함수 선언
- main 함수는 어떤 이름이든 가질 수 있으며(즉, 호출할 필요가 없음 main) 스크립트 블록의 유일한 함수이고 인수를 얼마든지 가질 수 있으며 값을 반환해서는 안된다.

```move

script {
    // Import the debug module published at the named account address std.
    use std::debug;

    const ONE: u64 = 1;

    fun main(x: u64) {
        let sum = x + ONE;
        debug::print(&sum)
    }
}
```

- 스크립트는 권한이 매우 제한, 친구를 선언하거나 유형을 구성하거나 전역 저장소에 액세스할 수 없다.
- 주요 목적은 모듈 함수를 호출하는 것

## module

```move
module <address>::<identifier>{
    (<use>|<friend>|<type>|<function>|<constant>)*
}
```

- 여기서 <address>유효한 명명된 주소 또는 리터럴 주소

```move
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

- 이 module 0x42::test부분은 모듈 이 전역 저장소 의 계정 주소 로 test게시되도록 지정
- 모듈은 명명된 주소 를 사용하여 선언할수도 있다.

```move
module test_addr::test {
    struct Example has copy, drop { a: address }

    use std::debug;
    friend test_addr::another_test;

    public fun print() {
        let example = Example { a: @test_addr };
        debug::print(&example)
    }
}

```

```move
script {
    fun example() {
        my_addr::m::foo(@my_addr);
    }
}
```

```move
script {
    fun example() {
        0xC0FFEE::m::foo(@0xC0FFEE);
    }
}
```

```move
module my_module {}
module foo_bar_42 {}
```

- 일반적으로 모듈 이름은 소문자로 시작
- 모듈은 types및 의 모음
- friend키워드는 신뢰할 수 있는 모듈 목록을 지정
- const키워드는 모듈의 함수에서 사용할 수 있는 전용 상수를 정의
