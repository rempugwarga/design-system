# @rempugwarga/design-system

Semua perubahan penting pada paket ini didokumentasikan di file ini.
Format mengikuti [Keep a Changelog](https://keepachangelog.com/) dan
[Semantic Versioning](https://semver.org/), dihasilkan otomatis oleh Changesets.

## 0.1.1

### Patch Changes

- [#6](https://github.com/rempugwarga/design-system/pull/6) [`63a4340`](https://github.com/rempugwarga/design-system/commit/63a4340a40c4b8d036a35865fb2d8388a64099fd) Thanks [@ruangbercerita182-tech](https://github.com/ruangbercerita182-tech)! - Perbaiki pipeline build: publint hanya dijalankan untuk build paket npm, bukan saat storybook-addon-rslib membangun Storybook tanpa `dist/` library.

## 0.1.0

### Added

- Paket versi awal: komponen `Provider` (kontrak MF remote `design-system`)
- Build multi-format: ESM, CJS, dan Module Federation (`dist/mf`)
- Storybook untuk preview dan dokumentasi komponen
