git clone https://github.com/juj/emsdk.git

cd emsdk

LLVM_CMAKE_ARGS="-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly" ./emsdk install sdk-tag-1.37.28-64bit

./emsdk activate sdk-tag-1.37.28-64bit

source ./emsdk_env.sh