#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$script_dir/bats-core/bin/bats $script_dir/test/