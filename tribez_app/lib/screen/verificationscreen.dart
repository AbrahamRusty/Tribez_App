import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> codeControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/verification.png", // ganti sesuai aset kamu
                height: 150,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Masukkan Kode Verifikasi",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              "4 digit kode verifikasi sudah dikirim ke email kamu",
            ),
            const SizedBox(height: 30),

            // Input Kode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: codeControllers[index],
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Resend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Kode verifikasi belum masuk?"),
                TextButton(
                  onPressed: () {
                    // TODO: kirim ulang kode
                  },
                  child: const Text(
                    "Kirim Ulang",
                    style: TextStyle(color: Colors.amber),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            // Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigasi langsung ke halaman sukses tanpa validasi
                  Navigator.pushNamed(context, '/signup-success');
                },
                child: const Text(
                  "Verifikasi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}