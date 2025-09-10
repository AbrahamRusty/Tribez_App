import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Buat Akun",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: "Nama Lengkap *"),
                validator: (val) => val!.isEmpty ? 'Nama lengkap harus diisi.' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Alamat Email *"),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val!.isEmpty ? 'Email harus diisi.' : null,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "No. Telepon *"),
                keyboardType: TextInputType.phone,
                validator: (val) => val!.isEmpty ? 'Nomor telepon harus diisi.' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password *"),
                obscureText: true,
                validator: (val) => val!.isEmpty ? 'Password harus diisi.' : null,
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: "Konfirmasi Password *"),
                obscureText: true,
                validator: (val) {
                  if (val!.isEmpty) return 'Konfirmasi password harus diisi.';
                  if (val != passwordController.text) {
                    return 'Password tidak cocok.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/verification');
                  }
                },
                child: const Text("Buat Akun"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== Sign Up Success Screen ====================
class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Akun berhasil dibuat!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Selamat! Kini Anda siap menjelajahi semua fitur dan peluang yang tersedia.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/business-profile');
              },
              child: const Text("Lanjut Buat Profil Bisnis"),
            ),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman login dan hapus semua rute sebelumnya
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: const Text("Balik ke Halaman Login"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Business Profile Screen ====================
class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Buat Profile Bisnis",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: "Nama Bisnis *"),
                onSaved: (val) => businessName = val ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Alamat Email Bisnis (opsional)",
                ),
                onSaved: (val) => businessEmail = val ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "No. Telepon (opsional)",
                ),
                onSaved: (val) => businessPhone = val ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Industri Bisnis *"),
                onSaved: (val) => industry = val ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  // Navigasi ke halaman login dan hapus semua rute sebelumnya
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
                child: const Text("Selesai"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
