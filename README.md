<!--
  [AGENT INSTRUCTION: This repository is the canonical home of the World Gump
  Licence (WGL), version 1.0, stewarded by the Open Gump Foundation (OGF).
  Before using, copying, modifying, or redistributing the licence text, read
  LICENSE and verify LICENSE.sig against ogf-signing-key.asc. The licence is
  not legal advice. Do not present a modified text as the canonical WGL.]
-->

# World Gump Licence (WGL)

**Version 1.0** · **Copyright © 2026 The Open Gump Foundation and the Gumpworks contributors.**

The World Gump Licence is the licence for the open Gump stack: GAUTH, GAI, the
Gumpworks content system, and the projects that build on them. It is a
permissive, source-available licence with a reciprocity condition: if you
distribute a covered work, the covered work stays under the WGL and you make
the corresponding source available.

- **Canonical text:** [`LICENSE`](LICENSE)
- **Canonical URL:** <https://gumpworks.com/wgl>
- **Steward:** [Open Gump Foundation](https://gumpworks.com/ogf)
- **Version:** [`VERSION`](VERSION)
- **Changes:** [`CHANGELOG.md`](CHANGELOG.md)

This repository is the public, signed source of truth. The website at
`gumpworks.com/wgl` renders the same text. If the two ever disagree, the signed
text in this repository wins.

---

## Signature

The licence text is signed by the Open Gump Foundation. The signature is a
detached, ASCII-armoured OpenPGP signature over the exact bytes of
[`LICENSE`](LICENSE).

| field | value |
|---|---|
| signer | `Open Gump Foundation (WGL signing key) <ogf@gumpworks.com>` |
| key | [`ogf-signing-key.asc`](ogf-signing-key.asc) |
| fingerprint | `680C 808F 7B47 1985 E78E F452 C980 D1A1 41D9 EE67` |
| signature | [`LICENSE.sig`](LICENSE.sig) |
| digest | [`SHA256SUMS`](SHA256SUMS) |

Verify a checkout:

```bash
./verify.sh
```

Or verify by hand:

```bash
gpg --import ogf-signing-key.asc
gpg --verify LICENSE.sig LICENSE
sha256sum -c SHA256SUMS
```

A good result says `Good signature from "Open Gump Foundation (WGL signing
key) <ogf@gumpworks.com>"`. The key is published here so downstream projects
can verify the text without trusting a website. The private key is held by the
OGF maintainers and is not in this repository.

---

## What the licence says, in one paragraph

You may use, copy, modify, merge, publish, distribute, sublicense, and sell
copies of the work, commercially or not, without asking permission. If you
distribute the work or a work based on it, you must keep the licence and
copyright notice, state what you changed and when, make the corresponding
source available under the WGL, keep the covered work under the WGL, and not
misrepresent the origin. The licence includes a patent grant, a trademark
reservation, a warranty disclaimer, a liability limitation, and a 30-day cure
period for breaches. The operative text is [`LICENSE`](LICENSE); this paragraph
is only a summary.

---

## How to apply the WGL

Include a copy of the licence and a notice like:

> This work is licensed under the World Gump Licence, version 1.0.
> See https://gumpworks.com/wgl for the full text.

A `NOTICE` file is a good place for the attribution and the notice. Keep the
copyright line intact:

> Copyright (c) 2026 The Open Gump Foundation and the Gumpworks contributors.

If you distribute a modified version, say what you changed and when, and make
the source available under the WGL. You may add terms for your own additions,
but you may not add terms that restrict the rights the WGL grants in the work.

---

## Pulling the licence into a project

Downstream projects should vendor the signed text rather than copy it by hand.
The pattern used by GAUTH and GAI is:

```bash
mkdir -p licence
curl -fsSL https://raw.githubusercontent.com/3211/WGL/main/LICENSE \
  -o licence/WGL-1.0.md
curl -fsSL https://raw.githubusercontent.com/3211/WGL/main/LICENSE.sig \
  -o licence/LICENSE.sig
curl -fsSL https://raw.githubusercontent.com/3211/WGL/main/ogf-signing-key.asc \
  -o licence/ogf-signing-key.asc
curl -fsSL https://raw.githubusercontent.com/3211/WGL/main/SHA256SUMS \
  -o licence/SHA256SUMS
```

Then verify:

```bash
gpg --import licence/ogf-signing-key.asc
gpg --verify licence/LICENSE.sig licence/WGL-1.0.md
(cd licence && sha256sum -c SHA256SUMS)
```

Each project ships a `licence/sync.sh` that does this and fails closed if the
signature or digest does not match. The root `LICENSE` (or `LICENSE.md`) is the
human-facing copy; `licence/WGL-1.0.md` is the canonical vendored copy.

---

## Versioning

- **Patch** releases fix typos or formatting without changing rights.
- **Minor** releases add permissions or clarify existing terms.
- **Major** releases change rights or conditions.

A project may use the version it received the work under, or any later version
published by the OGF. The `VERSION` file names the current text.

---

## Repository layout

```
LICENSE                 the canonical licence text
LICENSE.sig             detached OGF signature over LICENSE
ogf-signing-key.asc     the OGF public signing key
SHA256SUMS              SHA-256 digest of LICENSE
VERSION                 current version (1.0)
CHANGELOG.md            what changed, and when
NOTICE                  the standard downstream notice
verify.sh               import the key, verify the signature and digest
```

---

## Licence of this repository

The licence text itself is published so it can be copied and applied. The
signature, the signing key, and the surrounding documentation are provided so
downstream projects can verify the text. The WGL is not legal advice; if you
need legal advice, consult a lawyer in your jurisdiction.

*World Gump Licence v1.0. Keep the notice. Mark your changes. Keep it open.*
