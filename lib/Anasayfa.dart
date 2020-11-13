import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Anasayfa",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)),
        ),
        endDrawer: Drawer(

          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            color: Colors.grey[700],
            child: ListView(

              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset("images/menulogo.png"),


                ),
                ListTile(
                  leading: Icon(CupertinoIcons.envelope,color: Colors.white,),
                  title: Text('İletişim',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.question_circle_fill,color: Colors.white,),
                  title: Text('Hakkımızda',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),ListTile(
                  leading: Icon(CupertinoIcons.info_circle_fill,color: Colors.white,),
                  title: Text('Kısaltmalar',style: TextStyle(color: Colors.white),),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            controller: new ScrollController(keepScrollOffset: false),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: [
              _Cards("ÖĞRENMEYE\nBAŞLA", "26 Harf - 10.000 Kelime", "31% İlerleme", "images/ogrenmeyebasla.png",1),
              _Cards("BÖLGELER", "26 Harf - 10.000 Kelime", "31% İlerleme", "images/bolgeler.png",2),
              _Cards("KELİMEYE\nGİT", "10.000 Kelime", "31% İlerleme", "images/kelimeyegit.png",3),
              _Cards("RASTGELE", "10.000 Kelime", "31% İlerleme", "images/rastgele.png",4),
              _Cards("QUİZ", "1000 quiz", "31% İlerleme", "images/quiz.png",5),
              _Cards("KELİME\nTAMAMLA", "10.000 Kelime", "31% İlerleme", "images/kelimetamamla.png",6),
            ],
          ),
        ),
      ),
    );
  }
}
int sayfa = 0;
  _Cards(String baslik, String aciklama, String ilerleme, String resimurl,int i) {
  return GestureDetector(
    onTap: () {
      sayfa = i;
    },
    child: Card(
        color: Colors.blue,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      baslik,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(children: [
                  Text(
                    aciklama,
                    style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: 0.2,
                          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffFF4500)),
                          backgroundColor: Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ilerleme,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Image.asset(resimurl),
                  ],
                )
              ],
            ),
          ),
        )),
  );
}
