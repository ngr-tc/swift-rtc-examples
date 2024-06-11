#!/bin/bash
swift-format --in-place --recursive ./Sources/ && swift-format lint --recursive ./Sources/
