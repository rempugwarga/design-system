# Kebijakan Versioning

Paket ini mengikuti **Semantic Versioning (semver)** dengan Changesets sebagai
alat rilis. Versi adalah janji stabilitas kontrak publik untuk konsumen.

## Apa yang termasuk kontrak publik?

| Termasuk kontrak | Tidak termasuk |
| --- | --- |
| Ekspor paket (`exports`), props komponen, CSS class publik | Struktur file internal (`src/`) |
| Nama dan bentuk manifest MF remote (`design-system`) | Isi Storybook (dokumentasi) |
| Token design & variabel tema yang diekspor | Dev dependency, tooling CI |

## Aturan penaikan versi

| Perubahan | Versi |
| --- | --- |
| Menghapus/mengganti props, menghapus ekspor, rename komponen, mengubah default visual yang material | `major` |
| Komponen baru, props opsional baru, token baru, varian baru | `minor` |
| Perbaikan bug, a11y fix, penyesuaian visual minor, dokumentasi | `patch` |

Selama versi `0.x`, perubahan `minor` dapat berisi breaking change (aturan
semver untuk pra-1.0) — tetap wajib changeset dan catatan migrasi di CHANGELOG.

## Alur rilis

```sh
bun run changeset          # 1. deskripsikan perubahan + pilih jenis versi
git push                   # 2. CI membuat "release PR"
```

1. CI membuat **release PR** berisi penjumlahan changeset + update CHANGELOG.
2. Setelah release PR di-merge, `release.yml` mempublikasikan paket, membuat git
   tag, dan GitHub Release.
3. Publikasi memakai **npm Trusted Publishing** (OIDC + provenance) — tanpa
   token yang disimpan di repository.

## Penegakan otomatis (CI)

| Gerbang | Aturan |
| --- | --- |
| Job *Changeset Required* | PR yang menyentuh `src/`, `package.json`, `module-federation.config.ts`, atau `rslib.config.ts` **wajib** menambah `.changeset/*.md` — jika tidak, PR diblokir |
| Job *Build, Typecheck & Test* | `publint` memvalidasi `exports`/`types` paket terhadap semver yang diklaim |
| Required checks (branch protection) | Keempat job di atas wajib hijau sebelum merge (lihat `platform-ci/repos.yaml`) |

## Versioning Module Federation remote

Remote `designSystem` diekspos pada path `.` dan dikonsumsi lewat
`mf-manifest.json` (Storybook Pages / unpkg). Aturannya:

- **Manifest MF mengikuti versi paket yang sama** — satu nomor versi untuk npm
  dan remote, sehingga tim aplikasi dapat mengaitkan keduanya.
- Breaking change pada nama expose/props yang diekspos = `major`, sama seperti
  breaking npm.
- Konsumen MF sebaiknya memuat manifest pada URL yang dipin ke versi/rilis
  (bukan `latest`) agar deploy tidak berubah diam-diam; upgrade terencana seperti
  upgrade npm.

## Jaminan untuk konsumen

- Tidak ada breaking change tanpa perubahan versi `major` (atau catatan migrasi
  eksplisit selama `0.x`).
- CHANGELOG dihasilkan otomatis dari changeset — setiap entri punya PR dan
  penulisnya.
- Paket dipublikasikan dengan provenance yang dapat diverifikasi
  (`npm audit signatures`).
