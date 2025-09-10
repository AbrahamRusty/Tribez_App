import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Tribez",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // TODO: tambahkan navigasi ke halaman notifikasi
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Header
            const Text(
              "Halo, Meli,",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              "Selamat datang di Tribez!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Bagian Insight
            _buildInsightCard(context),
            const SizedBox(height: 20),

            // Bagian Paket Anda
            _buildSectionTitle("Paket Anda", () {
              // TODO: navigasi ke semua paket
            }),
            _buildPackageItem(
              title: "Sebulan Menyala",
              description: "Promosi produk terbaru untuk flash sale 12.12",
              status: "Dalam Pembuatan Konten",
            ),
            _buildPackageItem(
              title: "200% Boost brand profile",
              description: "Menambah engangment brand lebih banyak",
              status: "Belum Memilih Influencer",
            ),
            const SizedBox(height: 20),

            // Bagian Rekomendasi
            _buildSectionTitle("Rekomendasi", () {
              // TODO: navigasi ke semua rekomendasi/berita
            }),
            _buildNewsList(context),
          ],
        ),
      ),
    );
  }

  // --- Widget Pembantu ---

  Widget _buildInsightCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Insight",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {
                    // TODO: navigasi ke halaman insight
                  },
                ),
              ],
            ),
            const Divider(),
            const Text(
              "Reach",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Placeholder untuk grafik, ganti dengan library grafik
            Image.asset(
              'assets/images/graph_placeholder.png', // Ganti dengan aset gambar yang sesuai
              height: 80,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "1.563",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Chip(
                  label: Row(
                    children: const [
                      Icon(Icons.arrow_upward, size: 16, color: Colors.green),
                      Text("16.3%"),
                    ],
                  ),
                  backgroundColor: Colors.green[50],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: onTap, child: const Text("Expand")),
      ],
    );
  }

  Widget _buildPackageItem({
    required String title,
    required String description,
    required String status,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.star, color: Colors.amber),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(description),
            const SizedBox(height: 4),
            Chip(label: Text(status), backgroundColor: Colors.grey[200]),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList(BuildContext context) {
    // Data dummy untuk daftar berita
    final List<Map<String, String>> newsItems = [
      {
        "title": "Peluang dan Tantangan UMKM di Era Digital!",
        "image": "assets/images/news1.png",
      },
      {
        "title": "Strategi UMKM Bertahan di Tengah Persaingan!",
        "image": "assets/images/news2.png",
      },
      {
        "title": "Tips Sukses UMKM Naik Kelas!",
        "image": "assets/images/news3.png",
      },
      {
        "title": "Digital Marketing untuk UMKM, Perlu atau Tidak?",
        "image": "assets/images/news4.png",
      },
      {
        "title": "Dukungan Pemerintah untuk UMKM di 2024!",
        "image": "assets/images/news5.png",
      },
      {
        "title": "Modal Kecil, Omzet Besar? Ini Rahasianya!",
        "image": "assets/images/news6.png",
      },
    ];

    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Menonaktifkan scroll di dalam list
      shrinkWrap: true,
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final item = newsItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: InkWell(
            onTap: () {
              // Navigasi ke NewScreen.dart dengan data
              Navigator.pushNamed(context, '/news', arguments: item);
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
