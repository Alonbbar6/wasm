#!/bin/bash

# Basic WebAssembly Build Script
# This script compiles C code to WebAssembly using Emscripten

echo "🚀 Building WebAssembly application..."

# Check if emcc is available
if ! command -v emcc &> /dev/null; then
    echo "❌ Error: Emscripten (emcc) not found!"
    echo "Please install Emscripten first:"
    echo "1. Clone the Emscripten repository:"
    echo "   git clone https://github.com/emscripten-core/emsdk.git"
    echo "2. Enter the emsdk directory:"
    echo "   cd emsdk"
    echo "3. Install and activate the latest SDK tools:"
    echo "   ./emsdk install latest"
    echo "   ./emsdk activate latest"
    echo "4. Add the Emscripten environment to your PATH:"
    echo "   source ./emsdk_env.sh"
    echo ""
    echo "For more details, visit: https://emscripten.org/docs/getting_started/downloads.html"
    exit 1
fi

# Create build directory if it doesn't exist
mkdir -p build

# Compile C code to WebAssembly
echo "📦 Compiling math.c to WebAssembly..."
emcc math.c \
    -o build/math.wasm \
    -s EXPORTED_FUNCTIONS="['_add', '_multiply', '_fibonacci', '_factorial', '_string_length', '_array_sum', '_malloc', '_free']" \
    -s EXPORTED_RUNTIME_METHODS="['ccall', 'cwrap']" \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s INITIAL_MEMORY=16MB \
    -O2 \
    --no-entry

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "✅ WebAssembly compilation successful!"
    echo "📁 Output files:"
    echo "   - build/math.wasm (WebAssembly binary)"
    echo "   - build/math.js (JavaScript glue code)"
    
    # Copy the WASM file to the root directory for easy access
    cp build/math.wasm ./math.wasm
    echo "📋 Copied math.wasm to root directory"
    
    echo ""
    echo "🎉 Build complete! You can now:"
    echo "1. Start a local web server: python3 -m http.server 8000"
    echo "2. Open http://localhost:8000 in your browser"
    echo "3. Test the WebAssembly functions!"
    
else
    echo "❌ WebAssembly compilation failed!"
    exit 1
fi
