# @rempugwarga/design-system

Design system organisasi **rempugwarga**. Paket ini adalah produk platform untuk
tim-tim aplikasi (stream-aligned): komponen UI React yang dikonsumsi sebagai paket
npm berversi atau sebagai Module Federation remote saat runtime.

> **Pemilik (owner):** Design System Team (`@rempugwarga/design-system-team`)
> **Kontak / on-call:** lihat `REPOS.yaml` (service catalog) · **Mode interaksi:** X-as-a-Service

## Cara konsumsi

### 1. Paket npm (paling umum)

```sh
bun add @rempugwarga/design-system
```

```tsx
import Provider from '@rempugwarga/design-system';
```

Versi mengikuti [Semantic Versioning](https://semver.org/) — pin ke rentang caret
(`^0.1.0`) dan tinjau CHANGELOG pada setiap rilis. Kebijakan lengkap:
[docs/VERSIONING.md](docs/VERSIONING.md).

### 2. Module Federation remote

Untuk aplikasi yang ingin berbagi komponen lintas-deploy tanpa rebuild:

```
remote name : design-system
manifest    : <STORYBOOK_OR_CDN_URL>/mf-manifest.json
```

URL manifest per environment didokumentasikan di portal platform
(`platform-docs`: *Environment & Remote URLs*). Detail kontrak:
[docs/INTEGRATION.md](docs/INTEGRATION.md).

## Pengembangan lokal

```sh
bun install
bun run storybook        # preview komponen di http://localhost:6006
bun run mf-dev           # serve MF remote di http://localhost:3001
bun run typecheck
bun run test
bun run build            # ESM + CJS + MF (publint dijalankan saat build)
```

## Rilis & versioning

- Setiap perubahan kontrak publik wajib menyertakan changeset: `bun run changeset`.
- CI membuat *release PR* otomatis; merge ke `main` akan mempublikasikan paket
  dengan **provenance** (npm Trusted Publishing — tanpa token yang disimpan).
- Riwayat perubahan: [CHANGELOG.md](CHANGELOG.md).

## CI/CD & keamanan

| Pipeline | Isi |
| --- | --- |
| `ci.yml` | typecheck, test, build (publint), Storybook build, gitleaks, dependency audit, CodeQL |
| `release.yml` | changesets → release PR → publish + git tag + GitHub Release |
| `deploy-storybook.yml` | Storybook statis ke GitHub Pages |

Secret **tidak pernah** disimpan di repository. Provenance npm memakai OIDC,
bukan token. Lihat [SECURITY.md](SECURITY.md).

## Struktur

```
src/            komponen & ekspor publik
stories/        Storybook stories
docs/           kebijakan versioning & kontrak integrasi
.changeset/     changeset untuk rilis
.github/        CI/CD, CODEOWNERS, Dependabot
```
