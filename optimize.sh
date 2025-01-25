#!/usr/bin/env bash
set -euo pipefail

# Extract arguments
WORKLOAD=$1
OUTPUT_DIR=$2

# Make a temporary directory for intermediate results
TEMP_DIR=$(mktemp -d -p .)

echo "Invoking optimize.sh."
echo -e "\tWorkload: ${WORKLOAD}"
echo -e "\tOutput Dir: ${OUTPUT_DIR}"

mkdir -p "${OUTPUT_DIR}"

# Extract the workload.
tar xzf "${WORKLOAD}" --directory $TEMP_DIR/

# Feel free to add more steps here.

# Build and run the Calcite app.
cd calcite_app/
./gradlew build
./gradlew shadowJar
./gradlew --stop
java -Xmx4096m -jar build/libs/calcite_app-1.0-SNAPSHOT-all.jar "../${TEMP_DIR}/queries" "../${OUTPUT_DIR}"
cd -

# Clean up temporary data
rm -rf $TEMP_DIR
