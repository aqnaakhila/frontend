import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan'),
        backgroundColor: Colors.blue, // Ubah warna menjadi biru
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHelpHeader(),
              SizedBox(height: 20),
              _buildFAQSection(),
              SizedBox(height: 20),
              _buildGuideSection(),
              SizedBox(height: 20),
              _buildContactSupportSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Ubah warna menjadi biru
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        'Cara Menggunakan Aplikasi',
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            Colors.blue.shade50, // Ubah warna latar belakang menjadi biru muda
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Frequently Asked Questions (FAQ)',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Colors.blue.shade900), // Ubah warna teks menjadi biru tua
          ),
          SizedBox(height: 10),
          _buildFAQItem('Apa itu aplikasi ini?',
              'Aplikasi ini digunakan untuk mengelola cuti dan persetujuan cuti.'),
          _buildFAQItem('Bagaimana cara mengajukan cuti?',
              'Untuk mengajukan cuti, pergi ke halaman pengajuan dan isi formulir cuti.'),
          _buildFAQItem('Bagaimana cara melihat laporan cuti?',
              'Anda dapat melihat laporan cuti di halaman laporan cuti.'),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            answer,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            Colors.blue.shade50, // Ubah warna latar belakang menjadi biru muda
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Panduan Penggunaan',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Colors.blue.shade900), // Ubah warna teks menjadi biru tua
          ),
          SizedBox(height: 10),
          Text(
            '1. Masuk ke aplikasi dengan akun Anda.',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '2. Pilih menu untuk mengajukan cuti, melihat laporan, atau melakukan tindakan lainnya.',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '3. Ikuti panduan di setiap halaman untuk menyelesaikan tugas yang diinginkan.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSupportSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            Colors.blue.shade50, // Ubah warna latar belakang menjadi biru muda
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Kontak Dukungan',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Colors.blue.shade900), // Ubah warna teks menjadi biru tua
          ),
          SizedBox(height: 10),
          Text(
            'Jika Anda memerlukan bantuan lebih lanjut, Anda dapat menghubungi kami melalui:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Email: support@aplikasi.com',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Telepon: +62 123 456 789',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Jam Kerja: Senin - Jumat, 09:00 - 17:00',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
