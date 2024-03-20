#!/bin/bash
if [ "$1" == "-h" ]; then
    echo "useage: ./build.sh [test]"
    exit 0
fi
if [ "$1" == "test" ]; then
    echo "Building package (testnet3)..."
    echo "NEXT_PUBLIC_BASE_PATH=/testnet3" > .env.production
    echo "NEXT_PUBLIC_API_URL=https://timelord.depinc.org/testnet3" >> .env.production
    npm run build
    docker build . -t depinc/timelord-monitor-testnet3 && docker push depinc/timelord-monitor-testnet3
else
    echo "Building package (mainnet)..."
    echo "NEXT_PUBLIC_BASE_PATH=" > .env.production
    echo "NEXT_PUBLIC_API_URL=https://timelord.depinc.org" >> .env.production
    npm run build
    docker build . -t depinc/timelord-monitor && docker push depinc/timelord-monitor
fi
