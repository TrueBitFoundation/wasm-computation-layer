# WASM Computation Layer

This is the WASM Truebit Computation Layer for running generic programs that are written in wasm. 

To install emscripten (this will take a while):
```
./install_emscripten.sh
```

If they didn't already download, grab the submodules like this:
```
git submodule update --init --recursive
```

Install ocaml-offchain:
```
cd ocaml-offchain
./build.sh
```

Install emscripten module-wrapper:
```
cd emscripten-module-wrapper/
npm install
```

## Usage

You will need to compile a LLVM language script into wasm using Emscripten.

Make sure you have emscripten commands available in your terminal session:
```
source ./emsdk/emsdk_env.sh
```

Then you can convert LLVM languages into WASM using emscripten. For example:
```
cd example/
EMCC_WASM_BACKEND=1 emcc -s WASM=1 ./simple.c -o ./simple.js
cd ..
```
This generates your wasm files

It is possible to run:
```
node ./example/simple.js
```

However it will not be able to use the filesystem.

Make sure you have files to be used:
```
touch example/input.data
touch example/output.data
```

In order to be able to use the file system you will need to prepare the runtime using emscripten-module-wrapper.
Ensure you are back in the wasm-computation-layer directory.
```
cd example
node ../emscripten-module-wrapper/prepare.js simple.js --file input.data --file output.data
```