import 'package:flutter/material.dart';


const Color kHijau = Color(0xFF1B4332); // hijau daun pisang
const Color kSambal = Color(0xFFE4572E); // merah sambal
const Color kLatar = Color(0xFFF2F4F0); // latar halaman
const Color kTeks = Color(0xFF1C2B22);
const Color kTeksRedup = Color(0xFF5F6B63);


String formatRupiah(int angka) {
  final digit = angka.toString();
  final hasil = StringBuffer();
  for (int i = 0; i < digit.length; i++) {
    if (i > 0 && (digit.length - i) % 3 == 0) hasil.write('.');
    hasil.write(digit[i]);
  }
  return 'Rp $hasil';
}


class FoodImage extends StatelessWidget {
  final String url;
  final double? width, height;

  const FoodImage({super.key, required this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          color: const Color(0xFFE3E8E4),
          child: const Center(
            child: CircularProgressIndicator(color: kHijau, strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: const Color(0xFFE3E8E4),
          child: const Icon(Icons.restaurant, color: kHijau, size: 40),
        );
      },
    );
  }
}


class DetailPage extends StatefulWidget {
  final String nama, deskripsi, gambar;
  final int harga;

  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _jumlah = 1;

  Widget _tombolBulat(IconData icon, VoidCallback? onPressed) {
    return Material(
      color: onPressed == null ? const Color(0xFFB7C0BA) : kHijau,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int total = widget.harga * _jumlah;

    return Scaffold(
      backgroundColor: kLatar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            backgroundColor: kHijau,
            foregroundColor: Colors.white,
            title: Text(
              widget.nama,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.nama,
                    child: FoodImage(url: widget.gambar),
                  ),
                  // Bayangan tipis di atas supaya tombol back tetap terbaca
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [Color(0x99000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nama,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      color: kTeks,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatRupiah(widget.harga),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kSambal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: kTeksRedup,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Jumlah porsi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kTeks,
                          ),
                        ),
                      ),
                      _tombolBulat(
                        Icons.remove,
                        _jumlah > 1 ? () => setState(() => _jumlah--) : null,
                      ),
                      SizedBox(
                        width: 44,
                        child: Text(
                          '$_jumlah',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kTeks,
                          ),
                        ),
                      ),
                      _tombolBulat(
                        Icons.add,
                        _jumlah < 99 ? () => setState(() => _jumlah++) : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 12, color: kTeksRedup),
                  ),
                  Text(
                    formatRupiah(total),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: kTeks,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: kSambal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kHijau,
                        content: Text('Pesanan dibuat: $_jumlah × ${widget.nama}'),
                      ),
                    );
                  },
                  child: const Text(
                    'Pesan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}