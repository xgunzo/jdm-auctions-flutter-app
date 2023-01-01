import 'package:flutter/material.dart';

class AuctionTile extends StatelessWidget {
  final String title;
  final String asset;
  final String subtitle;
  final String logo;
  final Function()? onTap;

  const AuctionTile(
      {Key? key,
      required this.title,
      required this.asset,
      required this.subtitle,
      required this.logo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          child: InkWell(
        onTap: onTap,
        child: Container(
          height: 350.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 230.0,
                width: 350.0,
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("lib/assets/images/$asset")),
              ),
              ListTile(
                leading: Container(
                  height: 80.0,
                  width: 80.0,
                  child: Image(image: AssetImage("lib/assets/images/logos/$logo")),
                ),
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2, fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

SizedBox spacer() => SizedBox(height: 15.0);
