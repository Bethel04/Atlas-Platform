# Atlas Platform

Atlas Platform is a Linux and infrastructure monorepo for the Atlas project. This repository is structured to store current platform materials and preserve legacy Linux lab artifacts in a dedicated historical archive.

## Repository structure

- `Cheatsdheets/` — quick reference cheat sheets.
- `Labs/` — practical lab instructions and exercises.
- `Theory/` — Linux and networking theory documentation.
- `infra/` — infrastructure and archive content.
  - `infra/legacy/` — historical record of legacy Linux lab scripts and screenshots.

## Legacy historical record

The `infra/legacy/` directory is reserved for legacy Linux lab scripts and screenshots. It is intentionally preserved as a documented archive of historical assets.

### Notes

- `infra/legacy/scripts/` is the archive location for shell scripts and automation associated with legacy labs.
- `infra/legacy/screenshots/` is the archive location for historical screenshots or diagrams.
- `infra/legacy/README.md` explains the role of this archive and how to use it.

If additional historical assets are identified, add them under the appropriate `infra/legacy/*` subdirectory with a short description in `infra/legacy/README.md`.
