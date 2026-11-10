#!/bin/bash

echo "Building site with aggressive garbage collection..."
GOGC=20 hugo --cleanDestinationDir

echo "Ensuring correct permissions..."
chmod -R 755 public/

echo "Displaying disk usage..."
df -h

echo "Site built successfully"
date
