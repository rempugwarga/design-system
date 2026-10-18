# Pull Request

## Ringkasan

<!-- Apa yang berubah dan mengapa? -->

## Jenis perubahan

- [ ] Perubahan yang merusak kontrak (BREAKING CHANGE) — wajib changeset `major`
- [ ] Fitur baru — changeset `minor`
- [ ] Perbaikan / perubahan kecil — changeset `patch`
- [ ] Perubahan internal (CI, tooling) tanpa dampak konsumen

## Checklist

- [ ] Sudah menjalankan `bun run typecheck`, `bun run test`, `bun run build` lokal
- [ ] Menambahkan changeset (`bun run changeset`) jika kontrak publik berubah
- [ ] Memperbarui dokumentasi (`docs/`) bila perilaku/kontrak berubah
- [ ] Tidak menambahkan secret, token, atau kredensial ke repository
- [ ] Perubahan konfigurasi MF remote diuji melalui Storybook/preview
