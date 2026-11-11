#!/bin/bash

dotnet tool list --global csharp-ls > /dev/null || dotnet tool install --global csharp-ls
