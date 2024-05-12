import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

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
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text("Criar Conta", style: TextStyle(color: Colors.white))),
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
                  controller: _nameController,
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
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: largura - 32,
                height: 48,
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    label: const Text("Telefone"),
                    hintText: "Digite seu telefone",
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
                onPressed: () async {},
                child: Text(
                  "Criar Conta e Entrar",
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
