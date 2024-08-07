import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class PersetujuanPage extends StatelessWidget {
  const PersetujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopNavbarFitur(
        appPage: 'Persetujuan Cuti',
        leading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchField(),
            const SizedBox(height: 20),
            Expanded(child: _buildResponsiveTable(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.blue),
        labelText: 'Cari Data',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: (value) {
        // Implementasi logika pencarian
      },
    );
  }

  Widget _buildResponsiveTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16.0,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.blue.shade50,
        ),
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade900,
        ),
        dataRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.grey.shade100,
        ),
        // dataRowColor: MaterialStateColor.resolveWith(
        //   (states) => Colors.grey.shade50,
        // ),
        border: TableBorder.all(
          color: Colors.transparent, // Menghilangkan border
        ),
        columns: const [
          DataColumn(label: Text('Nama')),
          DataColumn(label: Text('Jenis Cuti')),
          DataColumn(label: Text('Tanggal Cuti')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Detail')),
        ],
        rows: _buildApprovalRows(context),
      ),
    );
  }

  List<DataRow> _buildApprovalRows(BuildContext context) {
    // Data dummy untuk contoh
    final List<Map<String, dynamic>> data = [
      {
        'nama': 'John Doe',
        'jenisCuti': 'Tahunan',
        'tanggalCuti': '01-05-2024',
        'status': 'Disetujui',
      },
      {
        'nama': 'Jane Smith',
        'jenisCuti': 'Sakit',
        'tanggalCuti': '12-05-2024',
        'status': 'Ditolak',
      },
    ];

    return data.map((item) {
      return DataRow(cells: [
        DataCell(Text(item['nama'])),
        DataCell(Text(item['jenisCuti'])),
        DataCell(Text(item['tanggalCuti'])),
        DataCell(Text(item['status'])),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.blue),
                onPressed: () {
                  // Aksi untuk melihat detail
                  _viewDetails(context, item);
                },
              ),
              IconButton(
                icon: Icon(Icons.print, color: Colors.blue),
                onPressed: () {
                  // Aksi untuk mencetak
                  _printDetails(item);
                },
              ),
            ],
          ),
        ),
      ]);
    }).toList();
  }

  void _viewDetails(BuildContext context, Map<String, dynamic> item) {
    // Implementasi logika untuk melihat detail
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Cuti'),
          content: Text('Nama: ${item['nama']}\n'
              'Jenis Cuti: ${item['jenisCuti']}\n'
              'Tanggal Cuti: ${item['tanggalCuti']}\n'
              'Status: ${item['status']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void _printDetails(Map<String, dynamic> item) {
    // Implementasi logika untuk mencetak detail
    print('Mencetak detail untuk: ${item['nama']}');
  }
}
