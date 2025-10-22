#include <emscripten/emscripten.h>

// Simple addition function
EMSCRIPTEN_KEEPALIVE
int add(int a, int b) {
    return a + b;
}

// Simple multiplication function
EMSCRIPTEN_KEEPALIVE
int multiply(int a, int b) {
    return a * b;
}

// Fibonacci function
EMSCRIPTEN_KEEPALIVE
int fibonacci(int n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// Factorial function
EMSCRIPTEN_KEEPALIVE
int factorial(int n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

// Simple string length function
EMSCRIPTEN_KEEPALIVE
int string_length(const char* str) {
    int length = 0;
    while (str[length] != '\0') {
        length++;
    }
    return length;
}

// Array sum function
EMSCRIPTEN_KEEPALIVE
int array_sum(int* arr, int length) {
    int sum = 0;
    for (int i = 0; i < length; i++) {
        sum += arr[i];
    }
    return sum;
}
