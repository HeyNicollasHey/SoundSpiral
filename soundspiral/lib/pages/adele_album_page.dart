import 'package:flutter/material.dart';
import 'package:soundspiral/shared/tema.dart';

class AdeleAlbum extends StatefulWidget {
  const AdeleAlbum({super.key});

  @override
  State<AdeleAlbum> createState() => _AdeleAlbumState();
}

class _AdeleAlbumState extends State<AdeleAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildSongList()),
          _buildMusicPlayer(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Tema().adele21,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Adele',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text('21 • 11 songs, 48min 4s',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongList() {
    List<String> songs = [
      'Rolling in the Deep',
      'Rumour has it',
      'Set fire to the rain',
      'I\'ll be Waiting',
      'Lovesong',
      'Someone like you'
    ];
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            songs[index],
            style: TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildMusicPlayer() {
    return Container(
      color: Colors.black,
      height: 60,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.skip_previous, color: Colors.white),
          Icon(Icons.play_arrow, color: Colors.white, size: 32),
          Icon(Icons.skip_next, color: Colors.white),
        ],
      ),
    );
  }
}
