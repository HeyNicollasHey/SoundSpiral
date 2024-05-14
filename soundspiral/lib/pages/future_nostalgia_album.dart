import 'package:flutter/material.dart';
import 'package:soundspiral/shared/tema.dart';

class FutureNostalgia extends StatefulWidget {
  const FutureNostalgia({super.key});

  @override
  State<FutureNostalgia> createState() => _FutureNostalgiaState();
}

class _FutureNostalgiaState extends State<FutureNostalgia> {
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
              Tema().nostalgia,
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
                Text('Dua Lipa',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text('Future Nostalgia • 11 songs, 37min 23s',
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
      'Future Nostalgia',
      'Cool',
      'Love Again',
      'Physical',
      'Levitating',
      'Break My Heart'
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
