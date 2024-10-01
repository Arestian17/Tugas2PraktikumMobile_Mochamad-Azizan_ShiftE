import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Import ini tidak diperlukan karena sudah termasuk dalam material.dart

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  // Tambahkan controller untuk field baru
  final _fakultasController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunController.dispose();
    _fakultasController.dispose();
    _alamatController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
      ),
      body: SingleChildScrollView( // Wrap dengan SingleChildScrollView untuk menghindari overflow
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              _textboxNama(),
              _textboxNIM(),
              _textboxTahun(),
              _textboxFakultas(),
              _textboxAlamat(),
              _textboxEmail(),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaController,
    );
  }

  Widget _textboxNIM() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIM"),
      controller: _nimController,
    );
  }

  Widget _textboxTahun() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tahun Lahir"),
      controller: _tahunController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _textboxFakultas() {
    return TextField(
      decoration: const InputDecoration(labelText: "Fakultas"),
      controller: _fakultasController,
    );
  }

  Widget _textboxAlamat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatController,
    );
  }

  Widget _textboxEmail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int? tahun = int.tryParse(_tahunController.text);
          String fakultas = _fakultasController.text;
          String alamat = _alamatController.text;
          String email = _emailController.text;

          if (nama.isEmpty || nim.isEmpty || tahun == null || fakultas.isEmpty || alamat.isEmpty || email.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Semua field harus diisi dengan benar')),
            );
            return;
          }

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TampilData(
                    nama: nama,
                    nim: nim,
                    tahun: tahun,
                    fakultas: fakultas,
                    alamat: alamat,
                    email: email,
                  )));
        },
        child: const Text('Simpan'));
  }
}
