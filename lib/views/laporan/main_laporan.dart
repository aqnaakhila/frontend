import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class LaporanCutiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(appPage: 'Laporan Cuti', leading: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Distribusi Jenis Cuti',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            _buildPieChart(),
            SizedBox(height: 20),
            Text(
              'Detail Cuti',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: _buildLeaveList()),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PieChart(
            PieChartData(
              sections: _getPieChartSections(),
              borderData: FlBorderData(show: false),
              sectionsSpace: 4,
              centerSpaceRadius: 40,
              pieTouchData: PieTouchData(
                touchCallback: (touchEvent, pieTouchResponse) {
                  // Implementasi tooltip atau interaksi lainnya
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _getPieChartSections() {
    final data = [
      {'label': 'Cuti Tahunan', 'value': 30, 'color': Colors.blue},
      {'label': 'Cuti Sakit', 'value': 20, 'color': Colors.red},
      {'label': 'Cuti Melahirkan', 'value': 10, 'color': Colors.green},
      {'label': 'Cuti Penting', 'value': 15, 'color': Colors.orange},
      {'label': 'Cuti Besar', 'value': 25, 'color': Colors.purple},
    ];

    return data.map((item) {
      final int percentage = item['value'] as int;
      final color = item['color'] as Color;

      return PieChartSectionData(
        color: color.withOpacity(0.8),
        value: percentage.toDouble(),
        title: '$percentage%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: _buildBadge(item['label'] as String),
        badgePositionPercentageOffset: 1.5,
      );
    }).toList();
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildLeaveList() {
    final data = [
      {'label': 'Cuti Tahunan', 'value': 30, 'color': Colors.blue},
      {'label': 'Cuti Sakit', 'value': 20, 'color': Colors.red},
      {'label': 'Cuti Melahirkan', 'value': 10, 'color': Colors.green},
      {'label': 'Cuti Penting', 'value': 15, 'color': Colors.orange},
      {'label': 'Cuti Besar', 'value': 25, 'color': Colors.purple},
    ];

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 3),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (item['color'] as Color).withOpacity(0.8),
            ),
            title: Text(
              item['label'] as String,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '${item['value']}%',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
