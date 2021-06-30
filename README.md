# Tagion Virtual Machine

This module is the initial tagion virtual machine.

## Pull submodules

All the submodules is update as follows.

```bash
make subdate
```



## Compile the package

This will link and compile the **Tagion Virtual Machine** called tvm.

This is a simple program base on the lib_tvm. This program can load a shared-object file **.so** and a webassembler binary file **.wasm**. 

```bash
make all
```



## Run the test example

This will run the default example placed inside **bin_tvm/tests/testapp/**

```bash
make run
```

The test example include a **bin_tvm/tests/testapp/native_impl.d/** which is compile to a **libtestapp.so** which is place in **build/bin/** and a wasm found in **bin_tvm/tests/testapp/betterc/testapp.d**. which compiled to a **.wasm** file place in **build/bin/testapp.wasm**

This make **run** tag execute this command.

**./build/bin/tvm build/bin/testapp.wasm build/bin/libtestapp.so**

## Make help

```bash
make help
```



## Tasks

The current example testapp only includes the use of simple wasm types (i32,i64,f32,f64), pointers (i32) and function pointers (func index).

We need to add support for composite types like structs  and delegate pointers.

All the .wasm code should be written in betterc and the native programs should be written in D.

### Task 1

Write an example which enable D to call a function in .wasm with a struct as an argument.

First assumption is that we can map a D struct directly into a wasm memory by a simple copy from native memory into wasm memory.

Note. We will later implement an introspection function to which will do the mapping if necessary.

**Native code**

```D
struct S {
    int x;
    int y;
}
//
S s;
s.x=17; s.y = 42;
auto struct_arg = wasm_engine.lookup("struct_arg");
int ret = wasm_engine.call!int(struct_arg, s);
assert(ret == 17*42);
```

The wasm sample code in betterc would like something like.

```D

struct S {
    int x;
    int y;
}

int struct_arg(S s) {
    scope(exit) {
        s.x = -1;
    }
    return s.x * s.y;
}
```

Create a struct will all the 4 base type in wasm and add this to this to the test.

Note. Check with the wasmutil how the wasm compiler is mapped.



### Task 2

Create at the same test as but where the with a pointer to the struct.



```D
// cut
assert(ret == -1*42);
```



### Task 3

Make a example with a delegate. A delegate in D is function with a scope pointer.

https://dlang.org/spec/function.html

