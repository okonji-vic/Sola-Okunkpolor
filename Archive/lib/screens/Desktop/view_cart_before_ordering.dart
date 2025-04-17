import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../footer.dart';

class ViewCartBeforeOrdering extends StatefulWidget {
  const ViewCartBeforeOrdering({super.key});

  @override
  State<ViewCartBeforeOrdering> createState() => _ViewCartBeforeOrderingState();
}

class _ViewCartBeforeOrderingState extends State<ViewCartBeforeOrdering> {
  String selection = "desc";
  @override
  Widget build(BuildContext context) {
    total = cartList.fold(
        0, (sum, item) => sum + (item['price'] * item['unit']) as int);
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        myWidgets.title(width: screen.width, tab: "blog"),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screen.width * 0.22,
            vertical: 60,
          ),
          color: Color.fromRGBO(244, 245, 248, 1),
          child: Column(
            children: [
              Text(
                "CART",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constants.fontsize26,
                  fontFamily: constants.w700,
                  // fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                "HOME / CART",
                style: TextStyle(
                  fontFamily: constants.w400,
                ),
              )
            ],
          ),
        ),
        build_main_area(screen),
        Column(
          children: [
            Text(
              "AUTHORS OTHER BOOKS",
              style: TextStyle(
                fontSize: 32,
                fontFamily: constants.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 3.5,
              color: Color.fromRGBO(182, 5, 5, 1),
              width: 150,
            ),
          ],
        ),
        const SizedBox(height: 50),
        LayoutBuilder(builder: (context, constraints) {
          int columns = (constraints.maxWidth / 400)
              .floor(); // Adjust 300 based on your item width
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                mainAxisExtent: 700
                // childAspectRatio: 0.9,
                ),
            itemBuilder: (BuildContext context, int index) {
              return myWidgets.buildShop(resp: db.shopList["shop"][index]);
            },
          );
        }),
        myWidgets.mailingList(width: screen.width),
        Footer(),
      ],
    ));
  }

  int loadingState = 0;
  String comment = '';
  Widget buildButtonChild() {
    if (loadingState == 0) {
      return Text(
        "Submit",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      return SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: Colors.white));
    }
  }

  final InputDecoration _myDecoration = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(18, 5, 18, 5),
    border: OutlineInputBorder(),
  );

  String selected_image = "book";

  Widget build_main_area(Size screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.6,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(2, (index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              color: Colors.grey[300],
                              child: const Center(child: FlutterLogo()),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'CENTERING YOUR MIND',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    'Dr Sola',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                  // myWidgets.buildRatingWidgets(4),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 25,
                                    padding: const EdgeInsets.all(3),
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Text(
                                        'N${cartList[index]["price"]}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const Icon(Icons.close),
                                const SizedBox(height: 30),
                                Container(
                                  height: 36,
                                  // width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            subtractUnit(index);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(left: 6.0),
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        GestureDetector(
                                          onTap: () {
                                            // showInputDialog(
                                            //     "Introduction to a new world");
                                          },
                                          child: Text(
                                            "${cartList[index]["unit"]}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        // Text("${functions.moneyFormat(unit.toString())}",style: TextStyle( fontWeight: //FontWeight.w400, color: Colors.black, fontSize: 14)),
                                        const SizedBox(width: 15),
                                        GestureDetector(
                                          onTap: () {
                                            addUnit(index);
                                          },
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.only(right: 6.0),
                                            child: Icon(Icons.add,
                                                size: 24, color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            flex: 4,
            child: orderSummaryWidget(),
          ),
        ],
      ),
    );
  }

  Widget orderSummaryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Summary',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              'N$total',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Discount(20%)',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              'N${total * discount}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery Fee',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              'N$deliveryFee',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              'N${(total - (total * discount)) + deliveryFee}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  bool callFunctionAgain = false;

  subtractUnit(int index) async {
    if (cartList[index]['unit'] > 1) {
      setState(() {
        cartList[index]['unit'] -= 1;
      });
    }
  }

  addUnit(int index) async {
    setState(() {
      cartList[index]['unit'] += 1;
    });
  }

  List<dynamic> cartList = [
    {
      'item_name': 'Centering your mind',
      'unit': 1,
      'price': 2000,
    },
    {
      'item_name': 'Centering your soul',
      'unit': 1,
      'price': 4000,
    },
  ];

  int total = 0;
  double discount = 0.2;
  int deliveryFee = 800;
}
