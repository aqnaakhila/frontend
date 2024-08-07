import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class HakCutiPage extends StatelessWidget {
  final int totalCutiDilaksanakan = 10; // Contoh nilai cuti dilaksanakan
  final int sisaCuti = 5; // Contoh nilai sisa cuti

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(appPage: 'Hak Cuti', leading: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildInfoContainer(
                      'Total Cuti Dilaksanakan', totalCutiDilaksanakan),
                ),
                SizedBox(width: 10), // Jarak antara dua container
                Expanded(
                  child:
                      _buildInfoContainer('Sisa Cuti yang Didapat', sisaCuti),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildLeaveGraph(),
            SizedBox(height: 20),
            Expanded(child: _buildLeaveHistoryList()),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String label, int value) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '$value',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveGraph() {
    // Contoh grafik batang sederhana
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grafik Penggunaan Cuti',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildBar(value: totalCutiDilaksanakan, label: 'Dilaksanakan'),
              _buildBar(value: sisaCuti, label: 'Sisa'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar({required int value, required String label}) {
    return Expanded(
      child: Column(
        children: [
          Text('$value'),
          SizedBox(height: 5),
          Container(
            height: 100,
            width: 20,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildLeaveHistoryList() {
    // Data dummy untuk contoh
    final List<Map<String, dynamic>> leaveHistory = [
      {
        'jenisCuti': 'Cuti Tahunan',
        'tanggal': '01-05-2024',
        'status': 'Disetujui',
      },
      {
        'jenisCuti': 'Cuti Sakit',
        'tanggal': '12-05-2024',
        'status': 'Ditolak',
      },
      {
        'jenisCuti': 'Cuti Besar',
        'tanggal': '15-06-2024',
        'status': 'Menunggu',
      },
    ];

    return ListView.builder(
      itemCount: leaveHistory.length,
      itemBuilder: (context, index) {
        final item = leaveHistory[index];
        Color statusColor;

        switch (item['status']) {
          case 'Disetujui':
            statusColor = Colors.green;
            break;
          case 'Ditolak':
            statusColor = Colors.red;
            break;
          case 'Menunggu':
          default:
            statusColor = Colors.orange;
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(item['jenisCuti']),
            subtitle: Text('Tanggal: ${item['tanggal']}'),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                item['status'],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
