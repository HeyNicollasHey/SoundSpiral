import 'package:soundspiral/models/singer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingerLocalDate {
  static String _gerarNovoID (Set<String> listaCantores) {
    int qtdeCantores = listaCantores.length;
    String singerID = 'singer$qtdeCantores';

    while (listaCantores.contains(singerID)) {
      qtdeCantores++;
      singerID = 'singer$qtdeCantores';
    }

    return singerID;
  }
  
  static String _formatarIDsMusicas (Set<String> listaCantores, Singer cantor, SharedPreferences shared) {
    List<String> listaMusicasIDs = [];
    
    for (var key in listaCantores) {
      if (key.substring(0, 5) == 'music' && shared.getStringList(key)![2] == cantor.nome) listaMusicasIDs.add(key);
    }

    String musicasIDs = listaMusicasIDs.join(',');
    
    return musicasIDs;
  }
  
  static Future<bool> create (Singer cantor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaCantores = shared.getKeys();
    String musicasIDs = _formatarIDsMusicas(listaCantores, cantor, shared);
    
    if (await recuperarCantorID(cantor.nome, musicasIDs) != null) return false;
    
    String cantorID = _gerarNovoID(listaCantores);

    shared.setStringList
      (
        cantorID,
        [
          cantor.nome,
          musicasIDs,
          cantor.perfilImg
        ]
    );
    
    return true;
  }

  static Future<String?> read (int campo, String? cantorID) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if (campo < 0 || campo > 2) return null;

    if (cantorID != null) {
      return shared.getStringList(cantorID)![campo];
    } else {
      return null;
    }
  }

  static Future<String?> recuperarCantorID (String nomeCantor, String musicasCantor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaCantores = shared.getKeys();

    for (String key in listaCantores) {
      if (
        shared.getStringList(key)![0] == nomeCantor
        && shared.getStringList(key)![1] == musicasCantor
      ) return key;
    }

    return null;
  }
}