import 'package:flutter/material.dart';

import '../../main.dart';
import '../footer.dart';

class BookConsultationDesktop extends StatefulWidget {
  const BookConsultationDesktop({super.key});

  @override
  State<BookConsultationDesktop> createState() =>
      _BookConsultationDesktopState();
}

class _BookConsultationDesktopState extends State<BookConsultationDesktop> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    void _handleRadioValueChanged(int? value) {
      if (value != null) setState(() => _radioValue = value);
    }

    var screen = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        myWidgets.title(width: screen.width, tab: "book_consultation"),
        const SizedBox(height: 40),
        Card(
          elevation: 10,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 26, 25),
            child: SizedBox(
              width: 800,
              height: 730,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: Image.asset("assets/images/about2.png"),
                  // ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // height: ,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/form.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          "Name of Organisation",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText:
                                "Enter your organization's name/contact person’s name",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: constants.fontsize16,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "Email",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Enter your email address",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: constants.fontsize16,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Type your Number here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: constants.fontsize16,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          "Select Consultation Type",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: _radioValue,
                                  onChanged: _handleRadioValueChanged,
                                  activeColor: constants.yellow,
                                ),
                                SizedBox(width: 10),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _radioValue = 0;
                                      });
                                    },
                                    child: Text(
                                      "Executive",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: constants.fontsize14,
                                        fontFamily: constants.w300,
                                        color: const Color.fromRGBO(
                                            34, 34, 34, 0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _radioValue,
                                  onChanged: _handleRadioValueChanged,
                                  // onChanged: (val){
                                  //   setS
                                  // },
                                  activeColor: constants.yellow,
                                ),
                                SizedBox(width: 10),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _radioValue = 1;
                                      });
                                    },
                                    child: Text(
                                      "Team",
                                      style: TextStyle(
                                        height: 1.5,
                                        fontSize: constants.fontsize14,
                                        fontFamily: constants.w300,
                                        color: const Color.fromRGBO(
                                            34, 34, 34, 0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "What are the current challenges that you need help with?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Type here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "What are the results you are looking to achieve from your session with Dr. Sola?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Type here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "When is the best time to reach you via call?",
                          style: TextStyle(
                            height: 1.5,
                            fontSize: constants.fontsize16,
                            fontFamily: constants.w400,
                            color: const Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: constants.w300,
                          ),
                          // controller: searchWord,
                          onSubmitted: (value) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(244, 244, 244, 1),
                            hintText: "Type here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(34, 34, 34, 0.5),
                              fontSize: 15,
                              fontFamily: constants.w300,
                            ),
                            border: InputBorder.none,
                            constraints: const BoxConstraints(
                                maxWidth: 400, maxHeight: 40),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 150,
                          child: MaterialButton(
                            onPressed: () {},
                            color: constants.purple,
                            hoverColor: constants.yellow,
                            height: 53,
                            child: Center(
                              child: Text(
                                "Submit Form",
                                style: TextStyle(
                                  fontSize: constants.fontsize18,
                                  fontFamily: constants.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Footer(),
      ],
    ));
  }
}
