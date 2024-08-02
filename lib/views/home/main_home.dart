import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/widgets/custom_top_navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.linearFirstColor,
            AppColors.linearSecondColor,
          ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomTopNavbar(appName: 'Cuti Online'),
          body: Column(
            children: <Widget>[
              Builder(builder: (context) {
                return Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: <Widget>[
                          _buildPanelButton(
                            context,
                            Icons.send,
                            'Pengajuan',
                            '/pengajuan',
                          ),
                          // _buildPanelButton(
                          //   context,
                          //   Icons.approval,
                          //   'Persetujuan',
                          //   '/persetujuan',
                          // ),
                          _buildPanelButton(
                            context,
                            Icons.list,
                            'Laporan Cuti',
                            '/laporan',
                          ),
                          _buildPanelButton(
                            context,
                            Icons.calendar_today,
                            'Kalender Cuti',
                            '/kalender',
                          ),
                          _buildPanelButton(
                            context,
                            Icons.security,
                            'Hak Cuti',
                            '/hak-cuti',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Container(
                color: AppColors.contentColorWhite,
                child: const TabBar(
                  tabs: [
                    Tab(text: 'Aktif'),
                    Tab(text: 'Disetujui'),
                    Tab(text: 'Ditolak'),
                  ],
                  labelColor: AppColors.contentColorBlue,
                ),
              ),
              Container(
                child: Expanded(
                  child: TabBarView(
                    children: [
                      _buildListView('Aktif'),
                      _buildListView('Disetujui'),
                      _buildListView('Ditolak'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanelButton(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(String status) {
    // Data dummy untuk contoh
    List<Map<String, String>> cutiData = [
      {'title': 'Cuti 1', 'status': 'Aktif'},
      {'title': 'Cuti 2', 'status': 'Disetujui'},
      {'title': 'Cuti 3', 'status': 'Ditolak'},
      {'title': 'Cuti 4', 'status': 'Aktif'},
      {'title': 'Cuti 5', 'status': 'Disetujui'},
    ];

    // Filter data berdasarkan status
    List<Map<String, String>> filteredData =
        cutiData.where((item) => item['status'] == status).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.check_circle),
            title: Text(filteredData[index]['title']!),
            subtitle: Text('Status: ${filteredData[index]['status']}'),
          ),
        );
      },
    );
  }
}
