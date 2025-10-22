# 🚀 Basic WebAssembly Test Application

A simple WebAssembly application that demonstrates basic C functions compiled to WASM and called from JavaScript in a web browser.

## 📁 Project Structure

```
basic_wasm/
├── math.c              # C source code with basic functions
├── index.html          # Web interface for testing WASM functions
├── wasm-loader.js      # JavaScript interface for WASM module
├── build.sh            # Build script for compiling C to WASM
├── Makefile            # Alternative build system
└── README.md           # This file
```

## 🛠️ Prerequisites

Before running this application, you need to install **Emscripten**, which is the toolchain for compiling C/C++ to WebAssembly.

### Installing Emscripten

1. **Clone the Emscripten SDK:**
   ```bash
   git clone https://github.com/emscripten-core/emsdk.git
   cd emsdk
   ```

2. **Install and activate the latest SDK:**
   ```bash
   ./emsdk install latest
   ./emsdk activate latest
   ```

3. **Add Emscripten to your PATH:**
   ```bash
   source ./emsdk_env.sh
   ```

4. **Verify installation:**
   ```bash
   emcc --version
   ```

For more detailed installation instructions, visit: [Emscripten Getting Started](https://emscripten.org/docs/getting_started/downloads.html)

## 🏗️ Building the Application

### For GitHub Pages Deployment
**Important**: For GitHub Pages to work, you need to build the WASM file and commit it to the repository.

1. **Install Emscripten** (see Prerequisites section above)
2. **Build the WASM file**:
   ```bash
   ./build.sh
   ```
3. **Commit the generated math.wasm file**:
   ```bash
   git add math.wasm
   git commit -m "Add built WASM file for GitHub Pages"
   git push
   ```

### Development Build Options

#### Option 1: Using the Build Script
```bash
./build.sh
```

#### Option 2: Using Make
```bash
make
```

#### Option 3: Manual Build
```bash
emcc math.c -o math.wasm -s EXPORTED_FUNCTIONS="['_add', '_multiply', '_fibonacci', '_factorial', '_string_length', '_array_sum', '_malloc', '_free']" -s EXPORTED_RUNTIME_METHODS="['ccall', 'cwrap']" -s ALLOW_MEMORY_GROWTH=1 -s INITIAL_MEMORY=16MB -O2 --no-entry
```

## 🌐 Running the Application

1. **Start a local web server:**
   ```bash
   # Using Python 3
   python3 -m http.server 8000
   
   # Or using Python 2
   python -m SimpleHTTPServer 8000
   
   # Or using Node.js (if you have it installed)
   npx http-server
   ```

2. **Open your browser and navigate to:**
   ```
   http://localhost:8000
   ```

3. **Test the WebAssembly functions:**
   - Basic math operations (addition, multiplication)
   - Fibonacci sequence calculation
   - Factorial calculation
   - String length calculation
   - Array sum calculation

## 🧪 Available Functions

The WebAssembly module exports the following C functions:

- `add(a, b)` - Simple addition
- `multiply(a, b)` - Simple multiplication
- `fibonacci(n)` - Calculate nth Fibonacci number
- `factorial(n)` - Calculate factorial of n
- `string_length(str)` - Calculate string length
- `array_sum(arr, length)` - Sum array elements

## 🔧 Development

### Adding New Functions

1. **Add your C function to `math.c`:**
   ```c
   EMSCRIPTEN_KEEPALIVE
   int your_function(int param) {
       return param * 2;
   }
   ```

2. **Update the build script** to export your function:
   ```bash
   -s EXPORTED_FUNCTIONS="['_add', '_multiply', '_your_function']"
   ```

3. **Add a test interface** in `index.html` and `wasm-loader.js`

4. **Rebuild and test:**
   ```bash
   ./build.sh
   ```

### Debugging

- Open browser developer tools (F12)
- Check the Console tab for any errors
- Use `console.log()` in JavaScript to debug
- The WASM module is available as `window.wasmModule`

## 🐛 Troubleshooting

### Common Issues

1. **"Emscripten not found" error:**
   - Make sure Emscripten is installed and activated
   - Run `source ./emsdk_env.sh` in your terminal

2. **"WebAssembly module not loaded" error:**
   - Make sure you're serving the files through a web server (not opening HTML directly)
   - Check that `math.wasm` exists in the project directory

3. **CORS errors:**
   - Always serve files through a web server, not by opening HTML files directly
   - Use `python3 -m http.server 8000` or similar

4. **Memory allocation errors:**
   - The build script includes memory management flags
   - If you add functions that use malloc/free, make sure they're exported

## 📚 Learning Resources

- [WebAssembly Documentation](https://webassembly.org/)
- [Emscripten Documentation](https://emscripten.org/docs/)
- [MDN WebAssembly Guide](https://developer.mozilla.org/en-US/docs/WebAssembly)
- [WebAssembly Studio](https://webassembly.studio/) - Online WASM development

## 🎯 Next Steps

Try these enhancements:

1. **Add more complex algorithms** (sorting, searching, etc.)
2. **Implement file I/O** using Emscripten's file system
3. **Add WebGL integration** for graphics
4. **Create a more sophisticated UI** with charts and visualizations
5. **Add performance benchmarking** to compare WASM vs JavaScript

## 📄 License

This project is open source and available under the MIT License.

---

**Happy WebAssembly coding! 🎉**
