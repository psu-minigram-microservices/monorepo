#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"

echo "Initializing submodules..."
git submodule update --init --recursive

echo "Creating services directory..."
mkdir -p services

link() {
  name="$1"
  target="$2"

  if [ -e "services/$name" ]; then
    echo "  [skip] services/$name already exists"
    return
  fi

  if [ ! -d "$target" ]; then
    echo "  [warn] target $target does not exist, skipping $name"
    return
  fi

  ln -s "../$target" "services/$name"
  echo "  [ok] services/$name -> $target"
}

echo "Linking services..."
link "chats-service"   "sources/chats-service"
link "auth-service"    "sources/minigram/backend/Minigram/Minigram.Auth"
link "profile-service" "sources/minigram/backend/Minigram/Minigram.Profile"

echo "Done!"