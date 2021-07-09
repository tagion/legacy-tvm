<a href="https://tagion.org"><img alt="tagion logo" src="https://github.com/tagion/resources/raw/master/branding/logomark.svg?sanitize=true" alt="tagion.org" height="60"></a>

# Tagion Virtual Machine

This repository contains the initial implementation of the virtual machine, which will replace the current scripting engine (Funnel) used in the tagion network.

TVM can execute [webassembler](https://webassembly.github.io/spec/). The current implementation is a standalone program that can link a **shared object file** and **wasm file** together.



## Getting started

### Install dependencies

- [dstep](https://dlang.org/blog/2019/04/22/dstep-1-0-0/)
- [dmd](https://dlang.org/download.html)
- [wasm-ld](https://lld.llvm.org/WebAssembly.html)

### Pull submodules

```bash
make subdate
```

### Compile the package

```bash
make all
```

This will link and compile the **Tagion Virtual Machine** called **TVM**.

You will get a simple program based on the `lib_tvm`. This program can load a shared-object file **.so** and a web-assembler binary file **.wasm**.

### Run the test example

```bash
make run
```

This will run the default example placed inside `bin_tvm/tests/testapp/`.

The test example includes a `bin_tvm/tests/testapp/native_impl.d/` which compiles to a `libtestapp.so` and is placed in `build/bin/`. 

The wasm-example gets `bin_tvm/tests/testapp/betterc/testapp.d`, which compiles to a `.wasm` file, and placed in `build/bin/testapp.wasm`.

```
./build/bin/tvm
./build/bin/testapp.wasm
./build/bin/libtestapp.so
```

### More information

More information can be found by:

```bash
make help
```

## Maintainers

- [@cbleser](https://github.com/cbleser)
- [@vladpazych](https://github.com/vladpazych)

## Questions

For questions and support, please use the [official forum](https://tagion.org/c/development/6) or [Telegram chat](https://t.me/tagionChat). The issue list of this repo is exclusively for bug reports.

 
