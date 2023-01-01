import 'package:jdm_salon/auctions/auction_tile.dart';
import 'package:flutter/material.dart';
import 'package:jdm_salon/bmw-m5.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:jdm_salon/honda-civic-ep3.dart';
import 'package:jdm_salon/honda-prelude.dart';
import 'package:jdm_salon/lancia-delta.dart';
import 'package:jdm_salon/lexus-is350.dart';
import 'package:jdm_salon/mercedes-190e.dart';
import 'package:jdm_salon/porsche-911-turbo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          splashColor: Colors.blueGrey,
          primarySwatch: Colors.deepOrange,
          cardTheme: CardTheme(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey),
        ),
        home: HelloWorld(name: "michal"));
  }
}

class HelloWorld extends StatelessWidget {
  final String name;

  const HelloWorld({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("JDM Auctions"),
      body: ListView(
        children: [
          spacer(),
          spacer(),
          Container(
            height: 80.0,
            width: 80.0,
            child: Image(
                image: AssetImage('lib/assets/images/logo/jdm-auctions.png')),
          ),
          spacer(),
          spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "We have specialised in exporting Japanese cars from the domestic market for more than 30 years. "
              "We only deal in the sale of reliable cars that we vouch for! "
              "We also carry out customised orders for individual customers",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
          ),
          spacer(),
          AuctionTile(
            title: "Honda Prelude SiR Type S",
            subtitle: "1997",
            asset: "prelude-type-s-1997/prelude1.png",
            logo: "honda.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Prelude()));
            },
          ),
          AuctionTile(
            title: "Honda Civic Type R EP3",
            subtitle: "2001",
            asset: "civic-type-r-ep3/ep3-1.jpg",
            logo: "honda.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CivicEP3()));
            },
          ),
          AuctionTile(
            title: "Lexus IS350 Version L",
            subtitle: "2009",
            asset: "lexus-is-350/lexus1.png",
            logo: "lexus.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LexusIS350()));
            },
          ),
          AuctionTile(
            title: "Porsche 911 Turbo 4WD",
            subtitle: "2000",
            asset: "porsche-911-turbo/porsche-911-1.png",
            logo: "porsche.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Porsche911()));
            },
          ),
          AuctionTile(
            title: "BMW M5",
            subtitle: "2005",
            asset: "bmw-m5/bmw-m5-1.png",
            logo: "bmw.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BmwM5()));
            },
          ),
          AuctionTile(
            title: "Mercedes-Benz 190E",
            subtitle: "1992",
            asset: "mercedes-190e/merc-1.png",
            logo: "mercedes.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Mercedes190E()));
            },
          ),
          AuctionTile(
            title: "Lancia Delta",
            subtitle: "1995",
            asset: "lancia-delta/lancia-delta-1.jpg",
            logo: "lancia.png",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LanciaDelta()));
            },
          ),
        ],
      ),
    );
  }
}

SizedBox spacer() => SizedBox(height: 15.0);
