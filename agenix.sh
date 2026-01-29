#!/usr/bin/env bash
# Helper script for agenix secret management

set -e

RULES_FILE="modules/home-manager/secrets/secrets.nix"

case "$1" in
  edit)
    shift
    RULES=$RULES_FILE nix run github:ryantm/agenix -- -e "$@"
    ;;
  decrypt)
    shift
    RULES=$RULES_FILE nix run github:ryantm/agenix -- -d "$@"
    ;;
  *)
    echo "Usage: $0 {edit|decrypt} [file]"
    echo ""
    echo "Examples:"
    echo "  $0 edit modules/home-manager/secrets/CONTEXT7_API_KEY.age"
    echo "  $0 decrypt modules/home-manager/secrets/CONTEXT7_API_KEY.age"
    exit 1
    ;;
esac
