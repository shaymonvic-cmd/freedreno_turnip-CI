#!/bin/bash

# Build script for scaled Adreno 6xx performance improvements

# Compile flags for Adreno 6xx optimizations
CFLAGS="-march=armv8-a -mtune=cortex-a76 -O3 -flto=full -Dfreedreno-ok=true -Dshader-cache=enabled"

# Parallel build based on available cores
make -j$(nproc)

# Link flags for security and optimization
LDFLAGS="--as-needed -z relro -z now"

# Build name and output tag
BUILD_NAME="Turnip-Main-Optimized-A6xx-SDK35"
OUTPUT_TAG="V97-A6xx-Opt-SDK35"

# Start build process
make CC="gcc" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" -o "$BUILD_NAME"

# Strip command to reduce binary size
strip --strip-unneeded "$BUILD_NAME"