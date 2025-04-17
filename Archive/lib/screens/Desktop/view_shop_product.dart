import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sola_web/screens/Desktop/view_cart_before_ordering.dart';

import '../../main.dart';
import '../footer.dart';

class ViewShopProduct extends StatefulWidget {
  const ViewShopProduct({super.key});

  @override
  State<ViewShopProduct> createState() => _ViewShopProductState();
}

class _ViewShopProductState extends State<ViewShopProduct> {
  String selection = "desc";
  @override
  Widget build(BuildContext context) {
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
                "BOOKS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constants.fontsize26,
                  fontFamily: constants.w700,
                  // fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                "HOME / SHOP / BOOKS",
                style: TextStyle(
                  fontFamily: constants.w400,
                ),
              )
            ],
          ),
        ),
        build_main_area(screen),
        build_desc_reviews(screen),
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
            padding: const EdgeInsets.all(10.0),
            itemCount: 3,
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

  Widget build_desc_reviews(Size screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.grey.shade300,
                onTap: () {
                  selection = "desc";
                  setState(() {});
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: constants.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    selection == "desc"
                        ? Container(
                            height: 2.5,
                            color: Color.fromRGBO(182, 5, 5, 1),
                            width: 120,
                          )
                        : SizedBox()
                  ],
                ),
              ),
              SizedBox(
                width: screen.width * 0.2,
              ),
              InkWell(
                splashColor: Colors.grey.shade300,
                onTap: () {
                  selection = "reviews";
                  setState(() {});
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: constants.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    selection != "desc"
                        ? Container(
                            height: 2.5,
                            color: Color.fromRGBO(182, 5, 5, 1),
                            width: 120,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          selection == "desc"
              ? Text(
                  "Centering Your Mind by Dr. Sola is a book that provides practical guidance on how to focus and calm the mind in an increasingly chaotic and overstimulated world. Based on Dr. Sola's own experiences as a clinical psychologist, the book offers a variety of techniques, including mindfulness, meditation, and cognitive-behavioral therapy (CBT), to help readers achieve greater mental clarity and well-being. Dr. Sola begins by explaining the importance of having a centered mind. When our minds are scattered and racing, we are more likely to experience stress, anxiety, and depression. We are also less likely to make sound decisions and reach our full potential. A centered mind, on the other hand, is calm, focused, and present. It is a state of mind that allows us to think clearly and live our lives to the fullest. In the following chapters, Dr. Sola provides detailed instructions on how to practice various mind-centering techniques. She covers everything from basic mindfulness exercises to more advanced meditation techniques. She also provides specific advice on how to use CBT to challenge negative thoughts and beliefs.",
                  style: TextStyle(
                    fontSize: constants.fontsize18,
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    height: 1.5,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (val) {
                        comment = val;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      textInputAction: TextInputAction.newline,
                      decoration: _myDecoration,
                      enabled: loadingState == 0 ? true : false,
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        child: buildButtonChild(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              constants.yellow),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  4,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: loadingState == 0 ? () async {} : null,
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Sola",
                                  style: TextStyle(
                                    fontFamily: constants.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text("2 days ago")
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "This is the most exceptional piece ive read in a while, it really transform my life and business, i recommend this. peice, Also i bought a ton of them for my Clients.",
                          style: TextStyle(
                            fontSize: constants.fontsize18,
                            color: Color.fromRGBO(0, 0, 0, 0.8),
                            height: 1.4,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 60),
                    Center(
                      child: TextButton(
                        child: Text(
                          "Show more",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      // color: Colors.red,
                      child: Column(
                          children: List.generate(4, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.amber,
                            ),
                          ),
                          child: Image.asset(
                            "./assets/images/${selected_image}.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      })),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Image.asset(
                        "./assets/images/${selected_image}.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CENTERING YOUR MIND",
                      style: TextStyle(
                          fontSize: constants.fontsize30,
                          fontFamily: constants.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "Dr. Sola Okunkpolor",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: constants.fontsize20),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Out of stock",
                          style: TextStyle(
                            color: Colors.red[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    myWidgets.buildRatingWidgets(4, size: 30),
                    SizedBox(height: 16),
                    Text(
                      "Centering Your Mind by Dr. Sola is a book that provides practical guidance on how to focus and calm the mind in an increasingly chaotic and overstimulated world.",
                      style: TextStyle(
                        fontSize: constants.fontsize18,
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 20),
                    build_details_tile(
                        "Publisher", "Sola Okunkpolor Publishing"),
                    build_details_tile("Published", "August 9th, 2023"),
                    build_details_tile("Print Pages", "102 Pages"),
                    build_details_tile("Reading Age", "16+"),
                    build_details_tile("Format", "PDF"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 3, child: Text("")),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              // style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "₦16,900",
                                  style: TextStyle(
                                    fontFamily: constants.w500,
                                    fontSize: 20,
                                    color: Color.fromRGBO(240, 42, 42, 1),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Text(
                            "₦18,900",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 153, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          height: 36,
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
                                    subtractUnit();
                                  },
                                  onLongPress: () {
                                    callFunctionAgain = true; //because
                                    subtractUnit();
                                  },
                                  onLongPressEnd: (_) {
                                    setState(() {
                                      callFunctionAgain = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    showInputDialog(
                                        "Introduction to a new world");
                                  },
                                  child: Text(
                                    "$unit",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                // Text("${functions.moneyFormat(unit.toString())}",style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14)),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {
                                    addUnit();
                                  },
                                  onLongPress: () {
                                    callFunctionAgain = true;
                                    addUnit();
                                  },
                                  onLongPressEnd: (_) {
                                    setState(() {
                                      callFunctionAgain = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.add,
                                        size: 24, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 6.0),
                            child: Text(
                              "Buy Now",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ViewCartBeforeOrdering()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(255, 153, 0, 1),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Color.fromRGBO(
                                    255, 153, 0, 1), // Amber border color
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 6.0),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(
                                      255, 153, 0, 1)), // Amber text color
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding build_details_tile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontSize: 16,
              fontFamily: constants.w500,
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(0, 0, 0, 0.8),
            ),
          ),
        ],
      ),
    );
  }

  // int counter = 0;
  bool callFunctionAgain = false;

  subtractUnit() async {
    await Future.delayed(Duration(milliseconds: 100));

    if (unit == 1 || unit < 1) {
      // print("Can't go below 10");
    } else {
      setState(() {
        unit -= 1;
      });
    }

    if (callFunctionAgain) {
      subtractUnit();
    }
  }

  addUnit() async {
    await Future.delayed(Duration(milliseconds: 100));

    setState(() {
      unit += 1;
    });

    if (callFunctionAgain) {
      addUnit();
    }
  }

  int type = 1;
  int unit = 1;

  showInputDialog(String book_name) {
    int unitValue = unit;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 250,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text("Enter number of \"${book_name}\" units"),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: "$unitValue",
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (val) {
                      unitValue = int.parse(val);
                    },
                    autofocus: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      unit = unitValue;
                      Navigator.pop(context);
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 153, 0, 1),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
