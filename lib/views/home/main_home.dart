import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/widgets/custom_top_navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomTopNavbar(appName: 'Cuti Online'),
        body: Column(
          children: <Widget>[
            // Mengatur tinggi container panel
            Container(
              height: 430, // Tinggi spesifik untuk container panel
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.linearFirstColor,
                    AppColors.linearSecondColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: <Widget>[
                    _buildPanelButton(
                      context,
                      Icons.send,
                      'Pengajuan',
                      '/pengajuan',
                      Colors.blue,
                    ),
                    _buildPanelButton(
                      context,
                      Icons.approval_rounded,
                      'Persetujuan',
                      '/persetujuan',
                      Colors
                          .purple, // Anda bisa memilih warna lain sesuai preferensi
                    ),
                    _buildPanelButton(
                      context,
                      Icons.list,
                      'Laporan Cuti',
                      '/laporan',
                      Colors.green,
                    ),
                    _buildPanelButton(
                      context,
                      Icons.calendar_today,
                      'Kalender Cuti',
                      '/kalender',
                      Colors.orange,
                    ),
                    _buildPanelButton(
                      context,
                      Icons.security,
                      'Hak Cuti',
                      '/hak-cuti',
                      Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Tab(text: 'Aktif'),
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Tab(text: 'Disetujui'),
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Tab(text: 'Ditolak'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildListView('Aktif'),
                  _buildListView('Disetujui'),
                  _buildListView('Ditolak'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanelButton(BuildContext context, IconData icon, String label,
      String route, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: color.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(label, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(String status) {
    List<Map<String, String>> cutiData = [
      {'title': 'Cuti 1', 'status': 'Aktif'},
      {'title': 'Cuti 2', 'status': 'Disetujui'},
      {'title': 'Cuti 3', 'status': 'Ditolak'},
      {'title': 'Cuti 4', 'status': 'Aktif'},
      {'title': 'Cuti 5', 'status': 'Disetujui'},
    ];

    List<Map<String, String>> filteredData =
        cutiData.where((item) => item['status'] == status).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(Icons.check_circle,
                color: Theme.of(context).colorScheme.primary),
            title: Text(filteredData[index]['title']!,
                style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text('Status: ${filteredData[index]['status']}'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
            onTap: () {
              // Aksi ketika item di tap
            },
          ),
        );
      },
    );
  }
}
