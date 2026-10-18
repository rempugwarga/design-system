# @rempugwarga/design-system

Semua perubahan penting pada paket ini didokumentasikan di file ini.
Format mengikuti [Keep a Changelog](https://keepachangelog.com/) dan
[Semantic Versioning](https://semver.org/), dihasilkan otomatis oleh Changesets.

## 0.1.3

### Patch Changes

- [#20](https://github.com/rempugwarga/design-system/pull/20) [`477468d`](https://github.com/rempugwarga/design-system/commit/477468d7fa66a5f1c361358c4592860dbc7008ff) Thanks [@ruangbercerita182-tech](https://github.com/ruangbercerita182-tech)! - Pipeline rilis dimigrasikan ke `changesets/action@v2`. Git tag dan GitHub Release kini dibuat otomatis saat publish (sebelumnya dengan action v1 + changeset CLI v3, tag tidak ter-push dan Release tidak terbentuk).

## 0.1.2

### Patch Changes

- [#9](https://github.com/rempugwarga/design-system/pull/9) [`cf3a24f`](https://github.com/rempugwarga/design-system/commit/cf3a24f1120fd92156f67002c7ed757fadd25f82) Thanks [@ruangbercerita182-tech](https://github.com/ruangbercerita182-tech)! - Sertakan hasil build `dist/` pada paket yang dipublikasikan. Release workflow kini menjalankan build sebelum publish, ditambah guard `prepublishOnly`, sehingga paket terbit lengkap (0.1.1 terbit tanpa `dist/` membuat konsumen gagal resolve module).

## 0.1.1

### Patch Changes

- [#6](https://github.com/rempugwarga/design-system/pull/6) [`63a4340`](https://github.com/rempugwarga/design-system/commit/63a4340a40c4b8d036a35865fb2d8388a64099fd) Thanks [@ruangbercerita182-tech](https://github.com/ruangbercerita182-tech)! - Perbaiki pipeline build: publint hanya dijalankan untuk build paket npm, bukan saat storybook-addon-rslib membangun Storybook tanpa `dist/` library.

## 0.1.0

### Added

- Paket versi awal: komponen `Provider` (kontrak MF remote `design-system`)
- Build multi-format: ESM, CJS, dan Module Federation (`dist/mf`)
- Storybook untuk preview dan dokumentasi komponen
