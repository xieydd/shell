#!/bin/bash
find . -name '*.h' -o -name '*.c' -o -name '*.cpp' | xargs -I{} clang-format -i '{}'
