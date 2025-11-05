# 🗳️ VotingSederhana — Smart Contract Voting Dasar

**VotingSederhana** adalah smart contract sederhana untuk melakukan proses voting berbasis blockchain menggunakan Solidity.  
Kontrak ini mendukung penambahan kandidat oleh **owner** dan memastikan setiap alamat wallet hanya dapat memberikan suara **satu kali**.

## ✨ Fitur Utama

- **Kepemilikan Kontrak** - Alamat yang melakukan deploy otomatis menjadi `owner`
- **Tambah Kandidat (Hanya Owner)** - Hanya owner yang berhak menambahkan kandidat baru
- **Satu Suara per Alamat** - Sistem memastikan 1 alamat hanya bisa voting sekali
- **Transparansi Hasil** - Semua kandidat dan perolehan suara bersifat publik
- **Event Logging** - Tersedia event saat kandidat ditambahkan dan saat voting dilakukan

## 🛠️ Persyaratan

- Solidity Compiler **^0.8.0**
- Lingkungan pengembangan smart contract:
    - Remix IDE (disarankan untuk pemula)
    - Hardhat / Truffle / Foundry (opsional)

## 🧱 Struktur Data

### Struct Kandidat

| Field   | Tipe     | Deskripsi                               |
|---------|----------|----------------------------------------|
| `id`    | `uint`   | ID kandidat (urutan indeks dalam array) |
| `nama`  | `string` | Nama kandidat                           |
| `suara` | `uint`   | Jumlah suara yang diterima             |

### Variabel Penting

| Variabel         | Tipe                       | Deskripsi                           |
|-----------------|----------------------------|-------------------------------------|
| `owner`          | `address public`           | Pemilik kontrak                     |
| `sudahVoting`    | `mapping(address => bool)` | Menandai apakah alamat sudah voting |
| `daftarKandidat` | `Kandidat[]`              | Array daftar kandidat               |

## 🚀 Cara Menggunakan

### 1. Deploy Kontrak

Saat deploy, `owner = msg.sender` otomatis bernilai alamat wallet yang men-deploy.

### 2. Menambahkan Kandidat (Hanya Owner)

```solidity
tambahKandidat(string memory _nama)
```

Contoh:
```solidity
tambahKandidat("Alice");
```

### 3. Melakukan Voting

```solidity
voting(uint _kandidatId)
```

Contoh:
```solidity
voting(0); // Vote kandidat dengan ID 0
```

**Catatan:**
- Tidak bisa voting lebih dari satu kali
- `_kandidatId` harus valid

### 4. Melihat Total Suara Kandidat

```solidity
getSuaraKandidat(uint _kandidatId)
```
