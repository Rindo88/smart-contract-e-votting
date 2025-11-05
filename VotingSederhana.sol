// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSederhana {
    // Pemilik kontrak (hanya pemilik yang bisa tambah kandidat)
    address public owner;
    // Struct untuk menyimpan data kandidat
    struct Kandidat {
        uint id;
        string nama;
        uint suara;
    }
    // Mapping untuk melacak apakah alamat sudah voting
    mapping(address => bool) public sudahVoting;
    // Array untuk menyimpan daftar kandidat
    Kandidat[] public daftarKandidat;

    // Event untuk logging
    event KandidatDitambah(uint id, string nama);
    event SudahVoting(address voter, uint kandidatId);

    // Constructor: set owner saat deploy
    constructor() {
        owner = msg.sender;
    }

    // Modifier: hanya owner yang bisa panggil fungsi ini
    modifier hanyaOwner() {
        require(msg.sender == owner, "Hanya owner yang bisa melakukannya");
        _;
    }
    // Fungsi untuk menambah kandidat (hanya owner)
    function tambahKandidat(string memory _nama) public hanyaOwner {
        uint newId = daftarKandidat.length;
        daftarKandidat.push(Kandidat(newId, _nama, 0));
        emit KandidatDitambah(newId, _nama);
    }

    // Fungsi untuk voting
    function voting(uint _kandidatId) public {
        require(!sudahVoting[msg.sender], "Anda sudah voting!");
        require(_kandidatId < daftarKandidat.length, "ID kandidat tidak valid");

        sudahVoting[msg.sender] = true;
        daftarKandidat[_kandidatId].suara += 1;
        emit SudahVoting(msg.sender, _kandidatId);
    }

    // Fungsi untuk melihat total suara kandidat
    function getSuaraKandidat(uint _kandidatId) public view returns (uint) {
        require(_kandidatId < daftarKandidat.length, "ID kandidat tidak valid");
        return daftarKandidat[_kandidatId].suara;
    }
}