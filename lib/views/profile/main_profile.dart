import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(appPage: 'Profile', leading: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildProfileInfo(),
            SizedBox(height: 30),
            _buildProfileActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
                'assets/images/profile_placeholder.png'), // Ganti dengan gambar profil pengguna
            backgroundColor: Colors.grey[200],
          ),
          SizedBox(height: 10),
          Text(
            'Aqna Akhila',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Staff | HR',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProfileDetail('NIP:', '1234567890'),
            _buildProfileDetail('Masa Kerja:', '5 Tahun'),
            _buildProfileDetail('Unit Kerja:', 'HR Department'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActions(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildActionTile(
          context,
          Icons.edit,
          'Edit Profil',
          Colors.blue,
          '/editProfile',
        ),
        _buildActionTile(
          context,
          Icons.lock,
          'Ganti Password',
          Colors.orange,
          '/changePassword',
        ),
        _buildActionTile(
          context,
          Icons.logout,
          'Keluar',
          Colors.red,
          '/login', // Mengarah ke halaman login setelah logout
        ),
      ],
    );
  }

  Widget _buildActionTile(BuildContext context, IconData icon, String title,
      Color color, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
        tileColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        visualDensity: VisualDensity(vertical: -4),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
