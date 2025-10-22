# Makefile for Basic WebAssembly Application

# Variables
CC = emcc
CFLAGS = -O2 -s EXPORTED_FUNCTIONS="['_add', '_multiply', '_fibonacci', '_factorial', '_string_length', '_array_sum', '_malloc', '_free']" -s EXPORTED_RUNTIME_METHODS="['ccall', 'cwrap']" -s ALLOW_MEMORY_GROWTH=1 -s INITIAL_MEMORY=16MB --no-entry
TARGET = math.wasm
SOURCE = math.c
BUILD_DIR = build

# Default target
all: $(TARGET)

# Build WebAssembly module
$(TARGET): $(SOURCE)
	@echo "🚀 Building WebAssembly application..."
	@mkdir -p $(BUILD_DIR)
	$(CC) $(SOURCE) -o $(BUILD_DIR)/$(TARGET) $(CFLAGS)
	@cp $(BUILD_DIR)/$(TARGET) ./$(TARGET)
	@echo "✅ Build complete! WebAssembly module: $(TARGET)"

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@rm -f $(TARGET)
	@echo "✅ Clean complete!"

# Run a local web server
serve:
	@echo "🌐 Starting local web server..."
	@echo "Open http://localhost:8000 in your browser"
	python3 -m http.server 8000

# Build and serve
build-serve: $(TARGET) serve

# Check if emcc is available
check-emcc:
	@which emcc > /dev/null || (echo "❌ Error: Emscripten (emcc) not found! Please install Emscripten first." && exit 1)
	@echo "✅ Emscripten found!"

# Help target
help:
	@echo "Available targets:"
	@echo "  all        - Build the WebAssembly module (default)"
	@echo "  clean      - Remove build artifacts"
	@echo "  serve      - Start a local web server"
	@echo "  build-serve- Build and start web server"
	@echo "  check-emcc - Check if Emscripten is installed"
	@echo "  help       - Show this help message"

# Phony targets
.PHONY: all clean serve build-serve check-emcc help
