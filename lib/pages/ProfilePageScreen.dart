import 'package:ebook/model/ProfileModel.dart';
import 'package:ebook/widget/DaftarNilai.dart';
import 'package:flutter/material.dart';

import 'dart:io';

class ProfilePage extends StatefulWidget {
  final ProfileService service;

  ProfilePage({required this.service});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final institutionController = TextEditingController();
  File? profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    var profileData = await widget.service.getProfileData();
    nameController.text = profileData['name'] ?? '';
    emailController.text = profileData['email'] ?? '';
    institutionController.text = profileData['institution'] ?? '';
    profileImage = await widget.service.readProfilePhoto();
    setState(() {}); // Update the UI
  }

  Future<void> _saveProfileData() async {
    await widget.service.saveProfileData(
      nameController.text,
      emailController.text,
      institutionController.text,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Berhasil Disimpan'),
          content: Text('Data profil berhasil disimpan.'),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    profileImage = await widget.service.pickImage();
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFIL'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  profileImage != null ? FileImage(profileImage!) : null,
              child: profileImage == null ? Icon(Icons.person) : null,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: institutionController,
            decoration: InputDecoration(
              labelText: 'Instansi/Sekolah',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Alamat E-mail',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('SIMPAN PERUBAHAN'),
            onPressed: _saveProfileData,
          ),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text('Daftar Nilai'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarNilaiWidget()),
              );
            },
          ),
          ElevatedButton(
            child: Text('Keluar'),
            onPressed: () {
              // Log out or exit
            },
          ),
        ],
      ),
    );
  }
}
