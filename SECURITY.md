# Kebijakan Keamanan

## Pelaporan kerentanan

Jangan membuka issue publik. Laporkan melalui **Security Advisory** repository ini
atau hubungi security champion tim Platform Engineering. Kami menindaklanjuti
dalam 2 hari kerja.

## Praktik wajib

1. **Secret tidak boleh ada di repository.** Pemindaian otomatis:
   - `gitleaks` pada setiap PR dan push ke `main`
   - GitHub secret scanning + push protection (dikonfigurasi via `platform-ci`)
2. **Rilis tanpa token.** Publikasi npm memakai Trusted Publishing (OIDC +
   provenance). Bila token registry benar-benar diperlukan, simpan di GitHub
   Environment, bukan di file.
3. **Dependensi.** Dependabot mingguan + `bun audit` di CI. Temuan tingkat
   `critical` memblokir merge; tingkat lain ditriase melalui PR Dependabot.
4. **Kode.** CodeQL berjalan pada push dan PR.

## Versi yang didukung

Hanya rilis mayor saat ini yang menerima patch keamanan. Detail kebijakan versi:
[docs/VERSIONING.md](docs/VERSIONING.md).
