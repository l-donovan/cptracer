#include <iostream>

#include "cuda/core.h"

int main(int argc, char **argv) {
    if (argc != 3) {
        std::cout << "Usage: cptracer <scene> <outfile>" << std::endl;
        return 1;
    } else {
        std::cout << core::test(5) << std::endl;
    }

    return 0;
}
