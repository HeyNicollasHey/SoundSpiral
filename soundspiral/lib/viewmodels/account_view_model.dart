import 'package:soundspiral/data/user_local_date.dart';
import 'package:soundspiral/models/user.dart';

class AccountViewModel {
  static String _actualUserID = '';
  static String _actualUsername = '';

  static String get actualUsername => _actualUsername;

  static void logout() {
    _actualUserID = '';
    _actualUsername = '';
  }

  static Future<bool> criarConta (String userName, String email, String password) async {
    if (userName.isEmpty || email.isEmpty || password.isEmpty) return false;

    User usuario = User(userName: userName, email: email, password: password);
    bool criarContaUsuario = await UserLocalDate.create(usuario);

    return criarContaUsuario;
  }

  static Future<bool> fazerLogin (String email, String password) async {
    if (email.isEmpty || password.isEmpty) return false;

    String? userID = await UserLocalDate.recuperarUserID(email);
    if (userID == null) return false;

    String? username = await UserLocalDate.read(0, userID);
    String? emailUser = await UserLocalDate.read(1, userID);
    String? emailPass = await UserLocalDate.read(2, userID);

    if (emailUser == email && emailPass == password) {
      _actualUserID = userID;
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> atualizarDados(String userName, String password) async {
    if (userName.isEmpty || password.isEmpty) return false;

    bool atualizarUserName = await UserLocalDate.update(0, _actualUserID, userName);
    bool atualizarPass = await UserLocalDate.update(2, _actualUserID, password);

    if (atualizarUserName && atualizarPass) return true;
    else return false;
  }

  static Future<bool> deletar () async {
    bool deletarUsuario = await UserLocalDate.delete(_actualUserID);

    return deletarUsuario;
  }
}