import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tpflutter/models/films.dart';
import 'package:tpflutter/services/films_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 67, 66, 66),
          title: const Text('Netflix Roulette'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: FutureBuilder(
            future: FilmsServices.getCover(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // recuperer les données triées
                Films data = snapshot.data as Films;
                // return SizedBox();

                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.network(data.getCover(data.cover)!, width: 500),
                      Image.network(data.getCover(data.cover)!, scale: 1.0),
                      Text(
                        '${data.title}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Dancing',
                            color: Colors.blueAccent),
                      ),
                      Text(
                        '${data.overview}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dancing',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text(
                          'Spin',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                //un objet circulaire pour attendre le chargement des données
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
