class Cuti {
  final int id;
  final String nama;
  final String keterangan;
  final String tanggalMulai;
  final String tanggalSelesai;

  Cuti(
      {required this.id,
      required this.nama,
      required this.keterangan,
      required this.tanggalMulai,
      required this.tanggalSelesai});

  factory Cuti.fromJson(Map<String, dynamic> json) {
    return Cuti(
      id: json['id'],
      nama: json['nama'],
      keterangan: json['keterangan'],
      tanggalMulai: json['tanggal_mulai'],
      tanggalSelesai: json['tanggal_selesai'],
    );
  }
}
