import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Buat Akun", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Nama Lengkap *"),
                onSaved: (val) => fullName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Alamat Email *"),
                onSaved: (val) => email = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "No. Telepon *"),
                keyboardType: TextInputType.phone,
                onSaved: (val) => phone = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password *"),
                obscureText: true,
                onSaved: (val) => password = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Konfirmasi Password *"),
                obscureText: true,
                onSaved: (val) => confirmPassword = val ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VerificationScreen()),
                  );
                },
                child: Text("Buat Akun"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Masukkan Kode Verifikasi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("4 digit kode verifikasi sudah dikirim ke email"),
            SizedBox(height: 30),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpSuccessScreen()),
                );
              },
              child: Text("Verifikasi"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text("Akun berhasil dibuat!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Selamat! Kini Anda siap menjelajahi semua fitur dan peluang yang tersedia."),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BusinessProfileScreen()),
                );
              },
              child: Text("Lanjut Buat Profil Bisnis"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text("Skip"),
            )
          ],
        ),
      ),
    );
  }
}

class BusinessProfileScreen extends StatefulWidget {
  @override
  _BusinessProfileScreenState createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String businessName = '';
  String businessEmail = '';
  String businessPhone = '';
  String industry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Buat Profile Bisnis", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Nama Bisnis *"),
                onSaved: (val) => businessName = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Alamat Email Bisnis (opsional)"),
                onSaved: (val) => businessEmail = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "No. Telepon (opsional)"),
                onSaved: (val) => businessPhone = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Industri Bisnis *"),
                onSaved: (val) => industry = val ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text("Selesai"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
