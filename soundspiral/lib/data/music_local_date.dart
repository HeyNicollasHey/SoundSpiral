import 'package:shared_preferences/shared_preferences.dart';

import '../models/music.dart';

class MusicLocalDate {
  static String _gerarNovoID (Set<String> listaMusicas) {
    int qtdeMusicas = listaMusicas.length;
    String musicID = 'music$qtdeMusicas';

    while (listaMusicas.contains(musicID)) {
      qtdeMusicas++;
      musicID = 'music$qtdeMusicas';
    }

    return musicID;
  }

  static Future<bool> create (Music musica) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaMusicas = shared.getKeys();

    if (await recuperarMusicaID(musica.nome, musica.letra.join('\n\n')) != null) return false;

    String musicaID = _gerarNovoID(listaMusicas);

    shared.setStringList
      (
        musicaID,
        [
          musica.nome,
          musica.letra.join('\n\n'),
          musica.cantorNome
        ]
    );

    return true;
  }

  static Future<String?> read (int campo, String? musicaID) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if (campo < 0 || campo > 2) return null;

    if (musicaID != null) {
      return shared.getStringList(musicaID)![campo];
    } else {
      return null;
    }
  }

  static Future<String?> recuperarMusicaID (String nomeMusica, String letraMusica) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaMusicas = shared.getKeys();

    for (String key in listaMusicas) {
      if (
        shared.getStringList(key)![0] == nomeMusica
        && shared.getStringList(key)![1] == letraMusica
      ) return key;
    }

    return null;
  }
}