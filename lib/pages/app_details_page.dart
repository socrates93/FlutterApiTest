import 'package:flutter/material.dart';

class AppDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre la app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Esta app se desarrolló con la finalidad de mostrar los conocimientos y destrezas en el framework de Flutter.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              "Prueba tecnica Altice Dominicana, posición Desarrollador de Aplicaciones Moviles",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              "Desarrollada por: Sócrates Jimenez",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
