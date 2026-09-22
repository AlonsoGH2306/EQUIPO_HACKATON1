#!/bin/sh
set -e
MVN_VERSION=3.9.9
BASE="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
HOME_MVN="$BASE/.mvn/apache-maven-$MVN_VERSION"
if [ ! -x "$HOME_MVN/bin/mvn" ]; then
  ZIP="$BASE/.mvn/apache-maven-$MVN_VERSION-bin.zip"
  URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$MVN_VERSION/apache-maven-$MVN_VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then curl -fsSL "$URL" -o "$ZIP"; else wget -q "$URL" -O "$ZIP"; fi
  (cd "$BASE/.mvn" && unzip -q -o "$ZIP")
fi
exec "$HOME_MVN/bin/mvn" "$@"
