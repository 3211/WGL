#!/usr/bin/env sh
# World Gump Licence v1.0 — verify the canonical text.
# Copyright (c) 2026 The Open Gump Foundation and the Gumpworks contributors.
# Licensed under the World Gump Licence v1.0. See LICENSE.
set -eu

cd "$(dirname "$0")"

if ! command -v gpg >/dev/null 2>&1; then
    echo "verify.sh: gpg is required" >&2
    exit 1
fi

if ! command -v sha256sum >/dev/null 2>&1; then
    echo "verify.sh: sha256sum is required" >&2
    exit 1
fi

gpg --import ogf-signing-key.asc
gpg --verify LICENSE.sig LICENSE
sha256sum -c SHA256SUMS

echo "WGL v$(cat VERSION): signature and digest verified."
