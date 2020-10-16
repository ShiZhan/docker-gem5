#!/bin/bash
# Build and Clean in one step to keep image manageable

git apply /usr/local/src/NVmain/patches/gem5/nvmain2-gem5-11688+
scons -j$(nproc) --ignore-style EXTRAS=../NVmain build/X86/gem5.opt
rm -f /usr/local/bin/gem5.opt
mv build/X86/gem5.opt /usr/local/bin
rm -rf build
mkdir -p build/X86
ln -s /usr/local/bin/gem5.opt build/X86/gem5.opt
