// script{
//     <use>*
//     <constants>*
//     fun<identifier><[type] parameterts:>([identifier:type]*)
//     <function_body>
// }
script{
       // Import the debug module published at the named account address std.
    // use std::debug;

    const ONE:u64=1;
    fun main(x:u64){
        let sum = x+ONE;
        // debug::print(*sum);
    }
}