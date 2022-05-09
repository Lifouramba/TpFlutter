import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tpflutter/models/films.dart';

class FilmsServices {
  //recuperer les users
  static Future<dynamic> getCover() async {
    Uri url = Uri.parse(
        'https://api.reelgood.com/v3.0/content/random?sources=netflix');
    http.Response response = await http.get(url);
    Map data = jsonDecode(response.body);
    inspect(Films.fromJSON(data));
    return Films.fromJSON(data);
  }
}
