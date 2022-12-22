module 0x42::Test{
    struct Example has copy,drop{i:u64}


    use Std::Debug;
    friend 0x42::AnotherTest;

    const ONE:u64=1;
}