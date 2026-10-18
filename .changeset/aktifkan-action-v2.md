---
"@rempugwarga/design-system": patch
---

Aktifkan `changesets/action@v2` yang sebenarnya: perubahan workflow pada PR migrasi sebelumnya tidak ikut ter-commit, sehingga rilis 0.1.3 masih memakai action v1 tanpa push git tag/GitHub Release. Kini git tag dan GitHub Release dibuat otomatis saat publish.
