---
"@rempugwarga/design-system": patch
---

Pemeliharaan tooling: migrasi Storybook 8 → 10 (`storybook@10.6.2`, `storybook-react-rsbuild` & `storybook-addon-rslib` v3.6.1), hapus paket yang di-SB9/10 dijadikan bawaan (`addon-essentials`, `addon-interactions`, `blocks`, `test`), dan tulis ulang `.storybook/main.ts` menjadi ESM murni (tanpa `require`/`getAbsolutePath`). Tidak ada perubahan API publik maupun isi `dist`.
