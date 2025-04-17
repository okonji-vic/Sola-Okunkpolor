import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sola_web/utils/functions.dart';

class MobileShopPage extends StatefulWidget {
  const MobileShopPage({super.key});

  @override
  State<MobileShopPage> createState() => _MobileShopPageState();
}

class _MobileShopPageState extends State<MobileShopPage> {
  MobileWidgets myWidgets = MobileWidgets();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            myWidgets.title(width: width, tab: "shop"),
          ],
        ),
      )
    );
  }
}