import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/widgets/component_form.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _masaKerjaController = TextEditingController();
  final TextEditingController _unitKerjaController = TextEditingController();
  final TextEditingController _lamaCutiController = TextEditingController();
  final TextEditingController _alamatCutiController = TextEditingController();
  final TextEditingController _alasanCutiController = TextEditingController();

  String? _selectedJabatan;
  String? _selectedJenisCuti;
  DateTime? _startDate;
  DateTime? _endDate;

  List<String> jabatanOptions = ['Manager', 'Staff', 'Admin'];
  List<String> jenisCutiOptions = ['Tahunan', 'Sakit', 'Cuti Bersama'];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          // Set end date minimum to be the start date
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = picked;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _showSnackbarAndNavigate() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Data telah tersimpan"),
        duration: Duration(seconds: 3),
      ),
    );

    // Navigasi ke halaman pengajuan setelah Snackbar selesai
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/pengajuan');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(appPage: 'Form Pengajuan Cuti'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: _namaController,
                label: 'Nama Pengajuan',
                keyboardType: TextInputType.text,
              ),
              _buildTextField(
                controller: _nipController,
                label: 'NIP',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              _buildDropdownField(
                value: _selectedJabatan,
                label: 'Jabatan',
                items: jabatanOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedJabatan = newValue;
                  });
                },
              ),
              _buildTextField(
                controller: _masaKerjaController,
                label: 'Masa Kerja',
                keyboardType: TextInputType.text,
              ),
              _buildTextField(
                controller: _unitKerjaController,
                label: 'Unit Kerja',
                keyboardType: TextInputType.text,
              ),
              _buildJenisCutiCheckboxes(),
              _buildTextField(
                controller: _lamaCutiController,
                label: 'Lama Cuti',
                keyboardType: TextInputType.text,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: AbsorbPointer(
                        child: _buildTextField(
                          controller: TextEditingController(
                            text: _startDate != null
                                ? _startDate!.toLocal().toString().split(' ')[0]
                                : '',
                          ),
                          label: 'Tanggal Mulai Cuti',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: AbsorbPointer(
                        child: _buildTextField(
                          controller: TextEditingController(
                            text: _endDate != null
                                ? _endDate!.toLocal().toString().split(' ')[0]
                                : '',
                          ),
                          label: 'Tanggal Akhir Cuti',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _buildTextField(
                controller: _alamatCutiController,
                label: 'Alamat Cuti',
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              _buildTextField(
                controller: _alasanCutiController,
                label: 'Alasan Cuti',
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Proses data form jika valid
                        _showSnackbarAndNavigate();
                      }
                    },
                    child: Text('Konfirmasi'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman pengajuan
                    },
                    child: Text('Batal'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.grey, // Warna background tombol batal
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
        items: items.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return '$label harus dipilih';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildJenisCutiCheckboxes() {
    return Column(
      children: jenisCutiOptions.map((String jenisCuti) {
        return CheckboxListTile(
          title: Text(jenisCuti),
          value: _selectedJenisCuti == jenisCuti,
          onChanged: (bool? checked) {
            setState(() {
              _selectedJenisCuti = checked == true ? jenisCuti : null;
            });
          },
        );
      }).toList(),
    );
  }
}
