# Tagion Virtual Machine

This is the initial implementation of the virtual machine which is going to replace the current scripting engine used in the tagion network.

This VM can execute [webassembler]:https://webassembly.github.io/spec/  and the current implementation is a standalone program that is able to link a shared object file and wasm file together.

## Requirement

The current version depends on [dstep]https://dlang.org/blog/2019/04/22/dstep-1-0-0/, [dmd]:https://dlang.org/download.html and [wasm-ld]:https://lld.llvm.org/WebAssembly.html

## Pull submodules

After the project has been pulling all the submodules is updated as follows.

```bash
make subdate
```
## Compile the package

This will link and compile the **Tagion Virtual Machine** called tvm.

This is a simple program base on the lib_tvm. This program can load a shared-object file **.so** and a web-assembler binary file **.wasm**.

```bash
make all
```

## Run the test example

This will run the default example placed inside **bin_tvm/tests/testapp/**

```bash
make run
```

The test example include a **bin_tvm/tests/testapp/native_impl.d/** which is compile to a **libtestapp.so** and are place in **build/bin/** and the wasm-example are found in **bin_tvm/tests/testapp/betterc/testapp.d**. which compiled to a **.wasm** file place in **build/bin/testapp.wasm**

This make **run** tag execute this command.

**./build/bin/tvm build/bin/testapp.wasm build/bin/libtestapp.so**

## Make help

More information can be found by.

```bash
make help
```

 