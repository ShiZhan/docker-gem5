#!/bin/bash
# Build and Clean in one step to keep image manageable

scons -j$(nproc) --ignore-style build/X86/gem5.opt
rm -f /usr/local/bin/gem5.opt
mv build/X86/gem5.opt /usr/local/bin
rm -rf build
mkdir -p build/X86
ln -s /usr/local/bin/gem5.opt build/X86/gem5.opt
