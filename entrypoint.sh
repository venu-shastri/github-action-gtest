#!/usr/bin/env bash
POSITIONAL=()

DIRECTORY="."
EXEC="tests"

while [[ $# -gt 0 ]]
do
    key="$1"
    case ${key} in
        -d|--directory)
        DIRECTORY="$2"
        shift
        shift
        ;;
        -e|--exec)
        EXEC="$2"
        shift
        shift
        ;;
        *)
        POSITIONAL+=("$1")
        shift
        ;;
    esac
done
set -- "${POSITIONAL[@]}"

cd ${DIRECTORY}
mkdir -p build && cd build
cmake .. && make
./${EXEC}
