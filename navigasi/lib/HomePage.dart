import 'package:flutter/material.dart';
import 'package:navigasi/detailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, dynamic>> foods = const [
      {
        'nama': 'Nasi Goreng Spesial',
        'harga': 25000,
        'deskripsi':
            'Nasi goreng dengan telur mata sapi, ayam suwir, dan kerupuk. Pedasnya pas, cocok buat sarapan maupun makan malam.',
        'gambar':
            'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&auto=format&fit=crop&q=60',
      },
      {
        'nama': 'Sate Ayam Madura',
        'harga': 30000,
        'deskripsi':
            'Sepuluh tusuk sate ayam bakar dengan bumbu kacang kental dan kecap manis, disajikan bersama lontong.',
        'gambar':
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&auto=format&fit=crop&q=60',
      },
      {
        'nama': 'Beef Cheese Burger',
        'harga': 45000,
        'deskripsi':
            'Roti brioche empuk, patty daging sapi juicy, keju leleh, selada, dan tomat segar. Kentang goreng sudah termasuk.',
        'gambar':
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800&auto=format&fit=crop&q=60',
      },
      {
        'nama': 'Pizza Margherita',
        'harga': 55000,
        'deskripsi':
            'Adonan tipis renyah dengan saus tomat, mozzarella, dan daun basil. Dipanggang sampai pinggirannya sedikit gosong.',
        'gambar':
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800&auto=format&fit=crop&q=60',
      },
      {
        'nama': 'Pancake Berry',
        'harga': 35000,
        'deskripsi':
            'Tumpukan pancake lembut dengan buah beri segar dan siraman sirup maple. Pas untuk teman ngopi sore.',
        'gambar':
            'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800&auto=format&fit=crop&q=60',
      },
      {
        'nama': 'Salad Sehat',
        'harga': 28000,
        'deskripsi':
            'Sayuran segar, tomat ceri, alpukat, dan dressing lemon. Ringan, segar, dan mengenyangkan.',
        'gambar':
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&auto=format&fit=crop&q=60',
      },
    ];

    return Scaffold(
      backgroundColor: kLatar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            backgroundColor: kHijau,
            foregroundColor: Colors.white,
            leading: const Icon(Icons.restaurant_menu),
            title: const Text(
              'Warung Makan',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mau makan apa\nhari ini?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${foods.length} menu siap dipesan',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _kartuMakanan(context, foods[index]),
                childCount: foods.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kartuMakanan(BuildContext context, Map<String, dynamic> food) {
    final String nama = food['nama'];
    final int harga = food['harga'];
    final String deskripsi = food['deskripsi'];
    final String gambar = food['gambar'];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  nama: nama,
                  harga: harga,
                  deskripsi: deskripsi,
                  gambar: gambar,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: nama,
                    child: FoodImage(
                      url: gambar,
                      width: double.infinity,
                      height: 190,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: kSambal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        formatRupiah(harga),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: kTeks,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            deskripsi,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13.5,
                              height: 1.4,
                              color: kTeksRedup,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: kLatar,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: kHijau,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}