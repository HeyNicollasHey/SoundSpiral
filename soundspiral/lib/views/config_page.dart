import 'package:soundspiral/viewmodels/account_view_model.dart';
import 'package:soundspiral/views/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();

  bool ocultarSenha = true;

  IconData exibirIcon = Icons.visibility;
  IconData ocultar = Icons.visibility_off;

  void exibir() {
    setState(() {
      ocultarSenha = !ocultarSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text("Configurações de usuário",
                style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: largura - 32,
                height: 48,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.abc),
                    label: const Text("Nome"),
                    hintText: "Digite seu nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // campo de texto para senha
              SizedBox(
                width: largura - 32,
                height: 48,
                child: TextField(
                  controller: _passswordController,
                  obscureText: ocultarSenha,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(ocultarSenha ? exibirIcon : ocultar),
                      onPressed: exibir,
                    ),
                    label: const Text("Senha"),
                    hintText: "Digite sua senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 24,
              ),
              //
              // botao
              ElevatedButton(
                onPressed: () async {
                  bool atualizar = await AccountViewModel.atualizarDados(
                      _usernameController.text, _passswordController.text
                  );

                  if (atualizar) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro ao atualizar cadastro: Dado invalido detectado.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  "Salvar Alterações",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(largura - 32, 48),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
              ),
              const SizedBox(
                height: 24,
              ),
              //
              // botao
              ElevatedButton(
                onPressed: () async {
                  bool deletar = await AccountViewModel.deletar();

                  if (deletar) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Impossível deletar conta.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  "Apagar minha conta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(largura - 32, 48),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.red,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
