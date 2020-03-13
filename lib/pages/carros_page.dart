import 'package:desktop/pages/carros/carros.dart';
import 'package:desktop/utils/web_utils.dart';
import 'package:flutter/material.dart';

import 'carros/carros_api.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Carro>>(
        future: CarrosApi.getCarros(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Carro> carros = snapshot.data;
          return _ListView(carros);
        },
      ),
    );
  }

  _ListView(List<Carro> carros) {
    return GridView.builder(
      itemCount: carros.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = size(constraints.maxWidth * 0.1);
            Carro carro = carros[index];

            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(carro.urlFoto ??
                      "http://www.livroandroid.com.br/livro/carros/esportivos/Porsche_Panamera.png"),
                  Text(
                    carro.nome ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
