#!/bin/bash

if [ ! -x "$(command -v devicon-lookup)" ]; then
    cargo install devicon-lookup
fi
