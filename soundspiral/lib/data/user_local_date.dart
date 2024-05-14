import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserLocalDate {
  static String _gerarNovoID (Set<String> listaUsuarios) {
    int qtdeUsuarios = listaUsuarios.length;
    String userID = 'user$qtdeUsuarios';

    while (listaUsuarios.contains(userID)) {
      qtdeUsuarios++;
      userID = 'user$qtdeUsuarios';
    }

    return userID;
  }

  static Future<bool> create (User usuario) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaUsuarios = shared.getKeys();

    if (await recuperarUserID(usuario.email) != null) return false;

    String userID = _gerarNovoID(listaUsuarios);

    shared.setStringList
    (
      userID,
      [
        usuario.userName,
        usuario.email,
        usuario.password
      ]
    );

    return true;
  }

  static Future<String?> read (int campo, String? userID) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if (campo < 0 || campo > 2) return null;

    if (userID != null) {
      return shared.getStringList(userID)![campo];
    } else {
      return null;
    }
  }

  static Future<bool> update (int campo, String userID, String novoValor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if (campo < 0 || campo > 2 && campo == 1) return false;

    if (userID != null) {
      List<String> usuarioValues = shared.getStringList(userID)!;
      usuarioValues[campo] = novoValor;
      shared.setStringList(userID, usuarioValues);

      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> delete (String userID) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    if ((userID != null) && shared.getKeys().isNotEmpty) {
      shared.remove(userID);
      return true;
    }
    else {
      return false;
    }
  }

  static Future<String?> recuperarUserID (String actualEmail) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    Set<String> listaUsuarios = shared.getKeys();

    for (String key in listaUsuarios) {
      if (shared.getStringList(key)![1] == actualEmail) return key;
    }

    return null;
  }
}
