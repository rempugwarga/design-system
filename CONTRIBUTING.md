# Contributing

1. Buat branch dari `main`, lalu buka Pull Request.
2. Jalankan pemeriksaan lokal sebelum push:

   ```sh
   bun run typecheck && bun run test && bun run build
   ```

3. Perubahan kontrak publik wajib menambahkan changeset: `bun run changeset`.
   CI **menolak PR** yang menyentuh `src/`/`package.json`/konfigurasi build
   tanpa changeset (job *Changeset Required*); jalankan lokal dengan
   `bun run check:changeset`.
4. Satu PR fokus pada satu perubahan. Owner review otomatis diminta melalui
   `.github/CODEOWNERS`.
5. Jangan pernah menambahkan secret/kredensial. CI akan menolak.

Kontrak kerja sama antar tim mengikuti panduan Platform Engineering:
templat PR tersedia di `.github/pull_request_template.md`.
