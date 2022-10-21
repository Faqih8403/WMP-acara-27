import 'dart:js_util';

import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget{
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  List<String> agama =[
    "Islam",
    "Kristen Protestan",
    "Kristen Katolik",
    "Hindu",
    "Budha"
  ];

  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllelNama = new TextEditingController();
  TextEditingController controllelPass = new TextEditingController();
  TextEditingController controllelMoto = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value){
    setState(() {
      _agama = value;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllelNama.text}"),
            new Text("Password : ${controllelPass.text}"),
            new Text("Moto Hidup : ${controllelMoto.text}"),
            new Text("Jenis Kelamin : ${_jk}"),
            new Text("Agama : ${_agama}"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Data diri"),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllelNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0)),
                  new TextField(
                    controller: controllelPass,
                    obscureText: true,
                    decoration: new InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllelMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Moto Hidup",
                    labelText: "Moto Hidup",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                  value: "Laki-Laku", 
                  title: new Text("Laki-Laki"), 
                  groupValue: _jk, 
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: new Text("pilih ini jika anda laki-laki"),
                ),
                new RadioListTile(
                  value: "Perempuan", 
                  title: new Text("Perempuan"), 
                  groupValue: _jk, 
                  onChanged: (String? value){
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: new Text("pilih ini jika anda perempuan"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text("Agama",
                    style: new TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 15.0),
                    ),
                    DropdownButton(
                      onChanged: (String? value){
                        pilihAgama(value!);
                      },
                      value: _agama,
                      items: agama.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.blue,
                  onPressed: (){
                    kirimdata();
                  })
              ],
            ),
          )
        ],
      ),
    );
  }
}

