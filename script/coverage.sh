#!/bin/bash

# Fast fail the script on failures.
set -e

dart pub global activate coverage

dart test test/test_all.dart --coverage="coverage"

format_coverage --lcov --in=coverage --out=coverage.lcov --packages=.packages --report-on=lib