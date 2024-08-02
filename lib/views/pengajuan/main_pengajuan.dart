import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';

import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class PengajuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopNavbarFitur(appPage: 'Pengajuan Cuti'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form-pengajuan');
              },
              child: const Text('Form Pengajuan'),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Cari berdasarkan Tanggal',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      // Implementasikan date picker
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Cari berdasarkan Status',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['Pending', 'Disetujui', 'Ditolak']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Implementasikan filter berdasarkan status
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 16.0,
                  border: TableBorder.all(
                    color: AppColors.contentColorBlack,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  columns: [
                    DataColumn(
                      label: Container(
                        width: 160,
                        child:
                            const Text('Nama', overflow: TextOverflow.ellipsis),
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
                  rows: List<DataRow>.generate(
                    5, // Jumlah contoh data
                    (index) => DataRow(
                      cells: [
                        DataCell(Text('Nama $index')),
                        DataCell(Text('NIP $index')),
                        DataCell(Text('2024-08-${index + 1}')),
                        const DataCell(
                            Text('Pending')), // Ubah sesuai data aktual
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  // Arahkan ke halaman detail pengajuan
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  // Arahkan ke halaman detail pengajuan
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
