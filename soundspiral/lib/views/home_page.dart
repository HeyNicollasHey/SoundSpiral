import 'package:soundspiral/viewmodels/account_view_model.dart';
import 'package:soundspiral/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:soundspiral/views/config_page.dart';
import 'package:soundspiral/views/my_albuns_page.dart';
import 'package:soundspiral/shared/tema.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    // Lista de álbuns populares
    List<Map<String, String>> albunsPopulares = [
      {
        'nome': "Lady Gaga",
        'cantor': "POP",
        'foto': Tema().gaga,
      },
      {
        'nome': "Lana Del Rey",
        'cantor': "Indie",
        'foto': Tema().lana,
      },
      {
        'nome': "Tyler, The Creator",
        'cantor': "Rapper - Indie",
        'foto': Tema().tyler,
      },
      {
        'nome': "Dua Lipa",
        'cantor': "POP",
        'foto': Tema().dualipa,
      },
      {
        'nome': "Adele",
        'cantor': "Soul",
        'foto': Tema().adele,
      },
      {'nome': "Doja Cat", 'cantor': "POP - Rapper", 'foto': Tema().doja}
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            AccountViewModel.logout();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.border_all_rounded,
                color: Colors.white), // Ícone do menu
            onSelected: (String choice) {
              if (choice == 'Meus Albuns') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAlbums()),
                );
              } else if (choice == 'Configurações\nde usuario') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Meus Albuns', 'Configurações\nde usuario']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "O que você quer ouvir?",
              style: TextStyle(
                color: const Color.fromARGB(255, 200, 200, 200),
                fontSize: 17,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 48,
              width: largura - 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.find_replace_outlined,
                      color: Colors.black,
                    ),
                    labelText: "Buscar",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Artistas Populares",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16), // Adiciona espaçamento de 16 pixels
            Expanded(
              child: ListView.builder(
                itemCount: (albunsPopulares.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int firstIndex = index * 2;
                  int secondIndex = firstIndex + 1;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AlbumPopular(
                        nome: albunsPopulares[firstIndex]['nome']!,
                        cantor: albunsPopulares[firstIndex]['cantor']!,
                        foto: albunsPopulares[firstIndex]['foto']!,
                      ),
                      if (secondIndex < albunsPopulares.length)
                        AlbumPopular(
                          nome: albunsPopulares[secondIndex]['nome']!,
                          cantor: albunsPopulares[secondIndex]['cantor']!,
                          foto: albunsPopulares[secondIndex]['foto']!,
                        )
                      else
                        Spacer(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumPopular extends StatelessWidget {
  final String nome;
  final String cantor;
  final String foto; // Caminho do recurso da imagem

  const AlbumPopular({
    Key? key,
    required this.nome,
    required this.cantor,
    required this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        height: 176,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                foto,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cantor,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
