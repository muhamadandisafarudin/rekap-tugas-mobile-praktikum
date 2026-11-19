import 'package:flutter/material.dart';
import 'package:tugasp_6/detail_page.dart';

final List<Map<String, String>> travelData = [
  {
    'nama': 'Raja Ampat',
    'gambar': 'https://images.unsplash.com/photo-1703769605297-cc74106244d9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi': 'Papua',
    // BARU
    'deskripsi':
        'Raja Ampat terkenal sebagai surga bawah laut dengan keanekaragaman hayati laut yang sangat kaya. Gugusan pulau karangnya cocok untuk menyelam, snorkeling, dan menikmati pemandangan pulau-pulau kecil yang indah.',
  },
  {
    'nama': 'Candi Borobudur',
    'gambar': 'https://images.unsplash.com/photo-1620549146396-9024d914cd99?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi': 'Jawa Tengah',
    // BARU
    'deskripsi':
        'Candi Borobudur adalah candi Buddha dari abad ke-9 peninggalan Dinasti Syailendra. Candi ini ditetapkan sebagai Situs Warisan Dunia UNESCO dan menjadi salah satu destinasi wisata sejarah paling populer di Indonesia.',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog Wisata'),
          bottom: TabBar(
            indicatorSize: .label,
            tabs: [
              Tab(icon: Icon(Icons.view_agenda), text: 'List View'),
              Tab(icon: Icon(Icons.grid_view_rounded), text: 'Grid View'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            buildListView(),
            buildGridView()
          ]
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: travelData.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final item = travelData[index];
        final heroTag = 'list-${item['nama']}'; // BARU

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            // BARU: pindah ke halaman detail saat diklik
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: item, heroTag: heroTag),
                ),
              );
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero( // BARU
                tag: heroTag,
                child: Image.network(
                  item['gambar']!,
                  width: 80,
                  height: 80,
                  fit: .cover,
                ),
              ),
            ),
            title: Text(item['nama']!),
            subtitle: Text(item['lokasi']!),
            trailing: Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: travelData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //mengatur kolom
        crossAxisSpacing: 16, //mengatur jarak horizontal
        mainAxisSpacing: 16, //mengatur jarak vertical
        childAspectRatio: 1, //mengatur rasio kolum
      ),
      itemBuilder: (context, index) {
        final item = travelData[index];
        final heroTag = 'grid-${item['nama']}'; // BARU

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          clipBehavior: .antiAlias,

          child: Stack(
            fit: .expand,
            children: [
              Hero( // BARU
                tag: heroTag,
                child: Image.network(
                  item['gambar']!,
                  fit: .cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: .topCenter,
                    colors: [
                      Colors.black87,
                      Colors.transparent
                    ]
                  )
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(item['nama']!,
                    style: TextStyle(color: Colors.white),
                    ),
                    Text(item['lokasi']!,
                    style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),
              // BARU: lapisan transparan paling atas supaya seluruh kartu bisa diklik (ada efek ripple)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(item: item, heroTag: heroTag),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}