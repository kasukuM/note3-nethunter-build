#!/bin/bash

# NetHunter Kernel Build Script

# Set up environment variables
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

# Define configurations for WiFi support
CONFIG_2GHZ="y"
CONFIG_5GHZ="y"
CONFIG_DUAL_BAND="y"

# Define configurations for cellular networks
CONFIG_SAFARICOM="y"
CONFIG_AIRTEL="y"

# Export the configurations
export CONFIG_2GHZ
export CONFIG_5GHZ
export CONFIG_DUAL_BAND
export CONFIG_SAFARICOM
export CONFIG_AIRTEL

# Start build process
echo "Starting Kernel Build..."

make clean
make -j$(nproc)

# Check for successful build
if [ "$?" -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi

# Install the kernel
sudo make modules_install
sudo make install

echo "Kernel built and installed successfully!"