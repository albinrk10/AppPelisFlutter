import 'package:flutter/material.dart';
import 'package:peliculas_albin/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: (() {}),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(),

          //slider de peliculas
          MovieSlider(),
        ],
      )),
    );
  }
}
