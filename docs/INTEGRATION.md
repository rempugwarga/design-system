# Kontrak Integrasi

Dokumen ini adalah kontrak antara Design System Team (penyedia) dan tim aplikasi
(konsumen). Perubahan pada dokumen ini mengikuti review code owner.

## Opsi konsumsi

### A. Paket npm (default)

- Registry: npm (scope `@rempugwarga`)
- Versi: semver; gunakan `^` untuk patch/minor otomatis
- Rekomendasi: dapatkan pembaruan melalui PR Dependabot di repo aplikasi

### B. Module Federation remote (runtime)

Contract untuk aplikasi yang mengonsumsi komponen saat runtime:

| Item | Nilai |
| --- | --- |
| Remote name | `design-system` |
| Expose | `design-system/` → komponen `Provider` |
| Manifest | `mf-manifest.json` |
| Shared | `react`, `react-dom` (singleton) |
| Versi | Tercatat pada manifest (`metaData`); konsumen boleh memilih versi |

URL manifest per environment:

| Environment | Manifest URL | Catatan |
| --- | --- | --- |
| Dev (lokal) | `http://localhost:3001/mf-manifest.json` | `bun run mf-dev` |
| Staging | `https://ds-staging.rempugwarga.example/mf-manifest.json` | placeholder — update saat hosting tersedia |
| Production | `https://ds.rempugwarga.example/mf-manifest.json` | placeholder — update saat hosting tersedia |

Contoh konsumsi (host aplikasi):

```ts
import { init, loadRemote } from '@module-federation/runtime';

init({
  name: 'my-app',
  remotes: [
    {
      name: 'design-system',
      entry: import.meta.env.PUBLIC_DS_MF_MANIFEST_URL,
    },
  ],
});

const { default: Provider } = await loadRemote('design-system/');
```

## Jaminan kompatibilitas

1. `Provider` (atau penggantinya) tetap diekspos pada entry `design-system/`.
2. React tetap menjadi shared singleton — aplikasi bebas memilih versi React.
3. Breaking change pada bentuk remote hanya terjadi pada perubahan `major`
   paket dan diumumkan di CHANGELOG + portal platform.

## Eskalasi

Kendala integrasi → channel `#platform-design-system` atau office hours mingguan
tim Design System. Jika integrasi mandiri gagal, tim aplikasi dapat meminta sesi
*enabling* (time-boxed), bukan ketergantungan permanen.
