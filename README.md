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



## Example

