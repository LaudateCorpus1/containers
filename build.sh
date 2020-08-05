#!/bin/bash -x

name=$1
builder=${2:-/usr/bin/podman}
directory="containers/$name"

[ -d "$directory" ] || exit 1

mkdir -p logs

$builder build \
  --rm \
  -t container \
  -f "$directory/Dockerfile" \
  "$directory" 2>&1 \
  | tee logs/build.log \
|| exit 1

$builder run \
  -it \
  --rm=true \
  --interactive=false \
  --tty=false \
  container specs.sh \
  | tee logs/specs.log \
|| exit 1

$builder images container --format "{{.CreatedAt}}|{{.Size}}" | tee logs/size.log
