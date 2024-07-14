#!/bin/bash

# Set the path to the Unreal Engine installation
UE5_ROOT="/Users/Shared/Epic Games/UE_5.3"
UE5_ENGINE="${UE5_ROOT}/Engine"
UAT_SCRIPT="${UE5_ENGINE}/Build/BatchFiles/RunUAT.sh"

# Set the path to your Unreal project
PROJECT_PATH="/Users/admin/Documents/projects/iwabo/unreal/test/CompileTest/CompileTest.uproject"

# Set the output directory for the packaged build
OUTPUT_DIR="/Users/admin/Documents/projects/iwabo/unreal/test/builds"

# Set the build configuration (Development or Shipping)
BUILD_CONFIG="Development"

# Set the platform (e.g., Win64, Mac, Linux, etc.)
PLATFORM="Mac"

# Package the project
"${UAT_SCRIPT}" BuildCookRun \
    -project="${PROJECT_PATH}" \
    -noP4 \
    -platform="${PLATFORM}" \
    -clientconfig="${BUILD_CONFIG}" \
    -serverconfig="${BUILD_CONFIG}" \
    -cook \
    -allmaps \
    -build \
    -stage \
    -pak \
    -archive \
    -archivedirectory="${OUTPUT_DIR}"

# Check if the packaging was successful
if [ $? -eq 0 ]; then
    echo "Packaging successful!"
else
    echo "Packaging failed!"
    exit 1
fi

