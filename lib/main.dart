import 'package:bilgi_yarismasi/TestVeri.dart';
import 'package:bilgi_yarismasi/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Bilgi Yarışması",
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {



  List<Widget> secimler=[];

  TestVeri testVeri1 = TestVeri();

  @override
  Widget build(BuildContext context) {





    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
            child: Expanded(flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('SKOR: '+testVeri1.getSkor().toString(),style: TextStyle(fontSize: 35,color: Colors.white),),
              ),
            )
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testVeri1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap( // Row kullanmadım çünkü Wrap'te icon satırda dolunca aşağı geçebiliyor
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            bool dogruCevaplar = testVeri1.getSoruYaniti();
                            setState(() {
                              if(testVeri1.soruBitti==false){
                                if(dogruCevaplar==false){
                                  secimler.add(dogruIcon);
                                  testVeri1.setSkor();
                                }else{
                                  secimler.add(yanlisIcon);
                                }
                                testVeri1.sonrakiSoru();
                              }else{
                                _showDialog();
                              }
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              if(testVeri1.soruBitti==false){
                                bool dogruCevaplar = testVeri1.getSoruYaniti();
                                  if(dogruCevaplar==true){
                                    secimler.add(dogruIcon);
                                    testVeri1.setSkor();
                                  }else{
                                    secimler.add(yanlisIcon);
                                  }
                                  testVeri1.sonrakiSoru();
                              }else{
                              _showDialog();
                            }
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Skorun: "+testVeri1.getSkor().toString()),
          content: new Text("Tekrar oynamak istiyor musun?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Evet"),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => (BilgiTesti())));

              },
            )
          ],
        );
      },
    );
  }




}