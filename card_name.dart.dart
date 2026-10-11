import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardName extends StatelessWidget {
  const CardName({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas pertemuan2',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 114, 228),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('gambar/asta.jpg'), 
                  radius: 70.0,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Asta',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'black clover',
                  style: GoogleFonts.alumniSansInlineOne(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Diperbaiki dari '.bold'
                    color: Colors.black,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 200.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.phone_android, color: Colors.white),
                    title: Text(
                      '00000ngagorolong',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text(
                      'asta@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.groups_outlined, color: Colors.white),
                    title: Text(
                      'Asta buntung',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Card(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  color: Colors.black,
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Kota spade',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}