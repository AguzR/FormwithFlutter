import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Form DataDiri",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // private (_) variabel dari jeniskelamin (jk)
  String _jk = "";

  // membuat list string untuk menampilkan data pada combobox
  List<String> agama = [
    "Islam",
    "Kristen Katholik",
    "Kristen Protestan",
    "Hindu",
    "Budha",
    "Konghuchu"
  ];

  // membuat private (_) variabel untuk agama
  String _agama = "Islam";

  // membuat controller untuk input text
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerQuote = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void _kirimData() {
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("Nama Lengkap : ${controllerName.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Quotes : ${controllerQuote.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            RaisedButton(
              child: Text("OK"),
              color: Colors.red,
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Form DataDiri"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  // memanggil controller textedit
                  controller: controllerName,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Masukan nama lengkap kamu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  // memanggil controller textedit
                  controller: controllerPass,
                  // agar text menjadi bintang2 gunakan obscureText TRUE
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Masukan password kamu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  // memanggil controller textedit
                  controller: controllerQuote,
                  // agar text menjadi lebih dari 1 line gunakan maxline
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "Quotes",
                      labelText: "Masukan quotes kamu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  "Pilih Jenis Kelamin",
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                RadioListTile(
                  value: "Laki-laki",
                  title: Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  subtitle: Text("Pilih jika anda sorang lelaki"),
                  activeColor: Colors.blue,
                ),
                RadioListTile(
                  value: "Perempuan",
                  title: Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  subtitle: Text("Pilih jika anda sorang perempuan"),
                  activeColor: Colors.purple,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Text(
                  "Pilih Agama",
                  style: TextStyle(fontSize: 16.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Agama",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                    ),
                    DropdownButton(
                      onChanged: (String value) {
                        _pilihAgama(value);
                      },
                      value: _agama,
                      // map digunakan untuk memecah string agama
                      items: agama.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    _kirimData();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
