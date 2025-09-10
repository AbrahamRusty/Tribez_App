import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data dari argumen rute
    final Map<String, String>? newsData =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final String title = newsData?['title'] ?? 'Judul Berita';
    final String image = newsData?['image'] ?? 'assets/images/news1.png';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita : Expand",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Kamis, 20 Februari 2025, 18.31 WIB",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Text(
              "Penulis : Irwan Setiawan",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            _buildArticleSection(
              title: "1. Peluang Besar bagi UMKM di Era Digital",
              content:
                  "Di era digital, UMKM memiliki peluang besar untuk berkembang lebih cepat dibandingkan sebelumnya. Dengan adanya internet dan media sosial, bisnis kini dapat menjangkau lebih banyak pelanggan tanpa perlu biaya besar. Platform e-commerce dan marketplace juga memudahkan UMKM dalam menjual produk mereka ke berbagai daerah, bahkan hingga ke pasar internasional. Selain itu, digital marketing memungkinkan UMKM mempromosikan produk secara lebih efektif melalui iklan online, media sosial, dan strategi SEO.",
            ),
            _buildArticleSection(
              title: "2. Tantangan yang Harus Dihadapi UMKM",
              content:
                  "Namun, di balik peluang tersebut, ada tantangan yang harus dihadapi. Salah satunya adalah adaptasi teknologi. Tidak semua pelaku UMKM memiliki keterampilan digital yang cukup untuk mengelola bisnis secara online.",
            ),
            _buildArticleSection(
              title: "3. Strategi UMKM untuk Bertahan dan Berkembang",
              content:
                  "Persaingan juga semakin ketat, terutama dengan bisnis yang lebih besar dan sudah memiliki sumber daya lebih. Keamanan data serta perubahan tren pasar yang cepat juga menjadi tantangan bagi UMKM dalam mempertahankan bisnisnya di era digital. Untuk menghadapi tantangan ini, UMKM perlu meningkatkan literasi digital, memanfaatkan teknologi secara maksimal, dan terus berinovasi. Dengan strategi yang tepat, UMKM dapat bertahan dan berkembang di era digital yang penuh peluang ini.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleSection({
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(content),
        const SizedBox(height: 20),
      ],
    );
  }
}