---
"@rempugwarga/design-system": patch
---

Sertakan hasil build `dist/` pada paket yang dipublikasikan. Release workflow kini menjalankan build sebelum publish, ditambah guard `prepublishOnly`, sehingga paket terbit lengkap (0.1.1 terbit tanpa `dist/` membuat konsumen gagal resolve module).
