import 'package:flutter/material.dart';
import 'package:soundspiral/pages/create_account_page.dart';
import 'package:soundspiral/pages/home_page.dart';
import 'package:soundspiral/shared/tema.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

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
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
              ),
              // imagem
              Image.asset(
                Tema().logo,
                width: 200,
                height: 200,
              ),
              //
              const SizedBox(
                height: 48,
              ),
              // campo de texto para email
              SizedBox(
                width: largura - 32,
                height: 48,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.alternate_email),
                    label: const Text("E-mail"),
                    hintText: "Digite seu e-mail",
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
              // campo de texto para senha
              SizedBox(
                width: largura - 32,
                height: 48,
                child: TextField(
                  controller: _senhaController,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Entrar",
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
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text("Ou",
                      style: TextStyle(fontSize: 15, color: Colors.white))),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountPage()));
                  },
                  child: Text(
                    "Criar Conta",
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
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
