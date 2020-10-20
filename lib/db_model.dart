import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Chrs {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  String bryanurl;
  int rating = 10;

  Chrs(this.name, this.location, this.description, this.bryanurl);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {


      imageUrl = bryanurl;
    } catch (exception) {
      print(exception);
    }
  }
}
