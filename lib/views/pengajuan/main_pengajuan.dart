import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  String? _statusFilter;
  String _searchDate = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopNavbarFitur(
        appPage: 'Pengajuan Cuti',
        leading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form-pengajuan');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), // Warna teks tombol
              ),
              child: const Text(
                'Form Pengajuan',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cari berdasarkan Tanggal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          // Implementasikan date picker
                        },
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      setState(() {
                        _searchDate = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _statusFilter,
                    decoration: InputDecoration(
                      labelText: 'Cari berdasarkan Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: <String>['Pending', 'Disetujui', 'Ditolak']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _statusFilter = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: SingleChildScrollView(
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
                        rows: List<DataRow>.generate(
                          5, // Jumlah contoh data
                          (index) => DataRow(
                            color: index.isEven
                                ? MaterialStateColor.resolveWith(
                                    (states) => Colors.grey.shade200,
                                  )
                                : MaterialStateColor.resolveWith(
                                    (states) => Colors.white,
                                  ),
                            cells: [
                              DataCell(Text('Nama $index')),
                              DataCell(Text('NIP $index')),
                              DataCell(Text('2024-08-${index + 1}')),
                              const DataCell(
                                  Text('Pending')), // Ubah sesuai data aktual
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.search),
                                      tooltip: 'Lihat Detail',
                                      onPressed: () {
                                        // Arahkan ke halaman detail pengajuan
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      tooltip: 'Edit Pengajuan',
                                      onPressed: () {
                                        // Arahkan ke halaman detail pengajuan
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      tooltip: 'Hapus Pengajuan',
                                      onPressed: () {
                                        // Arahkan ke halaman detail pengajuan
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        columns: [
                          DataColumn(
                            label: Container(
                              width: 160,
                              child: const Text(
                                'Nama',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80,
                              child: const Text('NIP'),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80,
                              child: const Text('Tanggal'),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 40,
                              child: const Text('Status'),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 80,
                              child: const Text('Detail'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
