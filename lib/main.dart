import 'package:flutter/material.dart';
import 'dart:async';

import 'db_model.dart';
import 'db_list.dart';
import 'new_db_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dragon Ball',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'We Rate Dragon Ball',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Chrs> initialChrs = []
    ..add(Chrs('Son Goku', 'Planeta Tierra, Universo 7',
        'Sayian criado en el planeta Tierra.', 
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSaS3cZRhge0rdTbce2201tiaI8J85Ru2XVpg&usqp=CAU'))
    ..add(Chrs('Vegeta', 'Planeta Tierra, Universo 7', 'Principe orgulloso de los Sayian.', 
        'https://depor.com/resizer/M0Wu9oK1w7cAtFDZU8RJmcQbPZA=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/4HFH2SWZ35E3BE6VXIRA6X2EZA.jpg'))
    ..add(Chrs('Son Gohan', 'Planeta Tierra, Universo 7',
        'Hijo de Son Goku con sangre de terrícola y Sayian.', 
        'https://i.pinimg.com/originals/2b/50/22/2b502282faf8ee5ce20ae3b814a5991d.jpg'))
    ..add(Chrs('Freezer', 'Universo 7,', 'Emperador del Mal. Tiene un ejercito a su cargo.', 
        'https://www.guiltybit.com/wp-content/uploads/2017/05/Freezer-volvera-a-Dragon-Ball-Super.jpg'))
    ..add(Chrs('Majin Buu', 'Planeta Tierra, Universo 7', 'Monstruo supuestamente creado por el mago maligno Bibidi.', 
              'https://i1.sndcdn.com/artworks-000423317784-xc6vap-t500x500.jpg'));

  Future _showNewDogForm() async {
    Chrs newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddChrsFormPage();
    }));
    if (newDog != null) {
      initialChrs.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                .1,
                .5,
                .7,
                .9
              ],
                  colors: [
                Colors.blue[300],
                Colors.blue[300],
                Colors.blue[300],
                Colors.blue[300]
              ])),
          child: new Center(
            child: new ChrsList(initialChrs),
          )),
    );
  }
}
