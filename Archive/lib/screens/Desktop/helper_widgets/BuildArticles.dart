import 'package:flutter/material.dart';

import '../../../main.dart';

class BuildArticles extends StatelessWidget {
  BuildArticles(this.resp, {super.key});

  var resp;
  
  @override
  Widget build(BuildContext context) {

    return Container(
      // width: 250,
      // height: 650,
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(resp["image"],
              fit: BoxFit.cover, height: 350, width: double.maxFinite,),
          SizedBox(height: 10),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:4.0),
            child: Text(
              resp["title"],
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize20,
                fontWeight: FontWeight.w600,
                // fontFamily: constants.openSans,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:4.0),
            
            child: Text(
              resp["body"],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: constants.fontsize18,
                // fontFamily: constants.openSans,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

}