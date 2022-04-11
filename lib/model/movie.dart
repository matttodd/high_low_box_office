import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_low_box_office/movie_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import "dart:math";
import '../api_key.dart';


class Movie {
  final _random = Random();
  late String title;
  Set<String> exemptions;
  String? release;
  String? boxOffice;
  String? synopsis;
  ImageProvider? poster;
  int retries = 0;

  Movie(this.exemptions) {
    title = getNewTitle();
  }

  String getNewTitle() {
    var validList = kMovieList.difference(exemptions);
    var movieTitle = validList.elementAt(_random.nextInt(validList.length));
    exemptions.add(movieTitle);
    return movieTitle;
  }

  int boxOfficeNumeral() {
    return int.parse(boxOffice!.substring(1).replaceAll(",", ""));
  }
  
  Future loadJSONData() async {
    var client = http.Client();
    var formattedTitle = title.replaceAll(" ", "+");
    var response = await client.get(Uri.parse(APIKEY + "&t=$formattedTitle"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      release = data["Released"];
      boxOffice = data["BoxOffice"];
      synopsis = data["Plot"];
      poster = NetworkImage(data["Poster"]);
    } else {
      print(response.statusCode);
      print(response.body);
      if (retries >= 10) {
        throw Error();
      }
      retries += 1;
      title = getNewTitle();
      loadJSONData();
    }
  }
}