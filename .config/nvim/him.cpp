#include <iostream>
#include <vector>
#include <string>

int add(int a, int b) {
    return a + b;
}

int main() {
    // 1. Warning test: unused variable (should show a yellow 'W')
    int unused_var = 42;

    // 2. Type inference & hover test: put cursor on `numbers` and press `K`
    std::vector<std::string> numbers = {"one", "two", "three"};

    // 3. Error test: missing semicolon or wrong type (should show a red 'E')
    int result = add(10, "wrong_type");

    std::cout << "Result: " << result << std::endl;
    return 0;
}
