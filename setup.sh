#!/usr/bin/env bash
set -euxo pipefail

# Install OpenJDK 17.
brew install openjdk@17

# Download and extract DuckDB.
wget https://github.com/duckdb/duckdb/releases/download/v1.1.3/duckdb_cli-osx-universal.zip
unzip duckdb_cli-osx-universal.zip
rm duckdb_cli-osx-universal.zip

# Download the workload.
# Note: currently hosted on Wan's Google Drive, link may be subject to change.
wget --no-check-certificate -r 'https://drive.usercontent.google.com/download?export=download&id=1f4HtlX6Y363VpmKJUmAhkdoXcfpUx_OP&confirm=yes' -O workload.tgz
