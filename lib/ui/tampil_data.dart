import 'package:flutter/material.dart';
// Import flutter_svg tidak digunakan, jadi bisa dihapus
// import 'package:flutter_svg/flutter_svg.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;
  // Tambahkan field untuk informasi tambahan
  final String fakultas;
  final String alamat;
  final String email;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
    // Tambahkan parameter untuk informasi tambahan
    required this.fakultas,
    required this.alamat,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Profil Mahasiswa"),
              background: Image.network(
                'https://source.unsplash.com/random/?university',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildProfileCard(nama, nim, umur),
                  SizedBox(height: 20),
                  _buildAdditionalInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementasi untuk berbagi profil
          // Tambahkan implementasi di sini
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fitur berbagi belum diimplementasikan')),
          );
        },
        child: Icon(Icons.share),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  Widget _buildProfileCard(String nama, String nim, int umur) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.indigo,
              child: Text(
                nama.isNotEmpty ? nama.substring(0, 1).toUpperCase() : '',
                style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              nama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            SizedBox(height: 10),
            _buildInfoChip(Icons.credit_card, nim),
            SizedBox(height: 5),
            _buildInfoChip(Icons.cake, "$umur tahun"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, color: Colors.indigo, size: 18),
      label: Text(label, style: TextStyle(color: Colors.indigo)),
      backgroundColor: Colors.indigo.withOpacity(0.1),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.school, color: Colors.indigo),
          title: Text("Fakultas"),
          subtitle: Text(fakultas),
        ),
        ListTile(
          leading: Icon(Icons.location_on, color: Colors.indigo),
          title: Text("Alamat"),
          subtitle: Text(alamat),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Colors.indigo),
          title: Text("Email"),
          subtitle: Text(email),
        ),
      ],
    );
  }
}
