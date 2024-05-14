import 'package:flutter/material.dart';
import 'package:soundspiral/pages/adele_album_page.dart';
import 'package:soundspiral/pages/future_nostalgia_album.dart';
import 'package:soundspiral/pages/igor_album_page.dart';
import 'package:soundspiral/pages/login_page.dart';
import 'package:soundspiral/shared/tema.dart';

class MyAlbums extends StatefulWidget {
  const MyAlbums({Key? key}) : super(key: key);

  @override
  State<MyAlbums> createState() => _MyAlbumsState();
}

class _MyAlbumsState extends State<MyAlbums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Meus Albuns",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocButton(
              image: AssetImage(Tema().igor),
              title: "IGOR",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IgorAlbum()),
                );
              },
            ),
            BlocButton(
              image: AssetImage(Tema().adele21),
              title: "21",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdeleAlbum()),
                );
              },
            ),
            BlocButton(
              image: AssetImage(Tema().nostalgia),
              title: "Future Nostalgia",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FutureNostalgia()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BlocButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final AssetImage image;

  const BlocButton({
    required this.title,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
