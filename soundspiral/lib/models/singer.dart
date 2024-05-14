import 'music.dart';

class Singer {
  final String nome;
  final List<Music> musicas;
  final String perfilImg;

  Singer (
    {
      required this.nome,
      required this.musicas,
      required this.perfilImg
    }
  );
}