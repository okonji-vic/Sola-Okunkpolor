import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
// import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

import '../../../api_service/profile_api.dart';
import '../../../main.dart';
import '../../../utils/global.dart';

class UserProfile extends StatefulWidget {
  Function(dynamic) navigateTo;

  UserProfile({super.key, required this.navigateTo});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool is_updating = false;
  TextEditingController nameController =
      TextEditingController(text: getX.read(v.FULLNAME));
  TextEditingController emailController =
      TextEditingController(text: getX.read(v.EMAIL));
  TextEditingController phoneController =
      TextEditingController(text: getX.read(v.PHONE));
  // TextEditingController addressController =
  //     TextEditingController(text: getX.read(v.ADDRESS));
  // TextEditingController roleController =
  //     TextEditingController(text: "${getX.read(v.ROLE)}");

  // @override
  // initState() {
  //   super.initState();
  //   if (getX.read(v.USER_IMAGE).isNotEmpty) {
  //     readNetworkImage(getX.read(v.USER_IMAGE));
  //   }
  // }

  // readNetworkImage(String imageUrl) async {
  //   http.Response response = await http.get(
  //     Uri.parse(imageUrl),
  //   );
  //   selectedProfileImage = response.bodyBytes;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'My Profile',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: constants.fontsize32,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(right: screen.width / 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          selectedProfileImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.memory(
                                    selectedProfileImage,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: helperWidgets.build_cached_image(
                                    getX.read(
                                      v.USER_IMAGE,
                                    ),
                                    height: 200,
                                    width: 200,
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            child: const Text(
                              'Change Profile Picture',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              selectImage();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              constants.lightPurple,
                            ),
                            // side: MaterialStateProperty.all(
                            //   BorderSide(
                            //     color: constants.lightPurple,
                            //   ),
                            // ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                          onPressed: is_updating
                              ? null
                              : () {
                                  if (nameController.text.isEmpty) {
                                    helperWidgets.showToast("Enter full name");
                                    return;
                                  }
                                  if (emailController.text.isEmpty) {
                                    helperWidgets.showToast("Enter email");
                                    return;
                                  }
                                  if (phoneController.text.isEmpty) {
                                    helperWidgets
                                        .showToast("Enter phone number");
                                    return;
                                  }
                                  // if(addressController.text.isEmpty){
                                  //   widgets_d.showToast("Enter address");
                                  //   return;
                                  // }
                                  update_profile();
                                },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: is_updating
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "SAVE & UPDATE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constants.fontsize18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.grey,
                      labelText: "Full name",
                      labelStyle: const TextStyle(fontSize: 18),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(fontSize: 18),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: phoneController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      labelStyle: const TextStyle(fontSize: 18),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ));
  }

  var selectedProfileImage;

  void selectImage() async {
    await ImagePickerWeb.getImageAsBytes().then((value) {
      if (value == null) {
        print('Nothing picked');
      } else if (value.isNotEmpty) {
        selectedProfileImage = value;
        setState(() {});
      } else {
        print('NOTHING PICKED');
      }
    });
  }

//   showChangePassword(BuildContext context) {
//     bool is_loading = false;
//     String old_password = "";
//     String new_password = "";
//     String confirm_new_password = "";
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (context, setCustomState) {
//           return AlertDialog(
//             // backgroundColor: Colors.white,
//             surfaceTintColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             // contentPadding: const EdgeInsets.only(right: 180.0),
//             content: SizedBox(
//               width: 450,
//               child: Padding(
//                 padding: const EdgeInsets.all(30),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Change Password",
//                       style: TextStyle(
//                         fontSize: constants.fontsize18,
//                         fontFamily: constants.w500,
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     TextField(
//                       onChanged:(val){
//                         old_password = val;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Old password",
//                         labelStyle: TextStyle(fontSize: 18),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         contentPadding:
//                             const EdgeInsets.fromLTRB(15, 10, 0, 10),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           borderSide: const BorderSide(),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     TextField(
//                        onChanged:(val){
//                         new_password = val;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "New password",
//                         labelStyle: TextStyle(fontSize: 18),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         contentPadding:
//                             const EdgeInsets.fromLTRB(15, 10, 0, 10),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           borderSide: const BorderSide(),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     TextField(
//                        onChanged:(val){
//                         confirm_new_password = val;
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Confirm New password",
//                         labelStyle: TextStyle(fontSize: 18),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         contentPadding:
//                             const EdgeInsets.fromLTRB(15, 10, 0, 10),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           borderSide: const BorderSide(),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(constants.lightPurple),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.0),

//                           ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 6,
//                           horizontal: 2,
//                         ),
//                         child:is_loading?SizedBox(height: 20,width: 20,child: CircularProgressIndicator(color: Colors.white,)): Text(
//                           "Save & Update",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: constants.fontsize14),
//                         ),
//                       ),
//                       onPressed:is_loading?null: () async{
//                        if(old_password.isEmpty){
//                         widgets_d.showToast("Enter old password");
//                         return;
//                        }
//                        if(new_password.isEmpty){
//                         widgets_d.showToast("Enter new password");
//                         return;
//                        }
//                        if(confirm_new_password.isEmpty){
//                         widgets_d.showToast("Enter confirm new password");
//                         return;
//                        }
//                         if(new_password != confirm_new_password){

//                           widgets_d.showToast("Mismatch password");
//                           return;
//                         }

//                        setCustomState((){
//                         is_loading = true;
//                        });

//                        try{

//                        var response = await change_password(old_password, new_password);
//                        print(response);
//                        if(response['msg']=='success'){
//                         Navigator.pop(context);
//                        }else if(response['msg']=='incorrect password'){
// widgets_d.showToast("Incorrect password");
//                        }else{
// widgets_d.showToast("Oops something went wrong.Try again");

//                        }
//                        }catch (e){
//                         print(e);
//                         myHttpErrorHandler(e);

//                        }finally{
//                            setCustomState((){
//                         is_loading = false;
//                        });
//                        }

//                       },
//                     ),
//                     // SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }

  update_profile() async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      is_updating = true;
    });

    try {
      var formData = dio.FormData.fromMap({
        v.TOKEN: getX.read(v.TOKEN),
        "fullname": nameController.text.trim(),
        "email": emailController.text.trim(),
        "phone_no": phoneController.text.trim(),
        // "address": addressController.text.trim(),
      });

      if (selectedProfileImage != null) {
        // print('-----------------> image not null');
        // String fileName = selectedProfileImage!.split("/").last;

        var file = dio.MultipartFile.fromBytes(
          selectedProfileImage,
          filename: 'image.jpg',
          contentType: MediaType("image", "jpg"),
        );
        formData.files.add(MapEntry('image', file));
      }

      var response = await editProfile(formData);
      print('----------------->$response ');
      // print('--------runtimeType--------->${response.runtimeType} ');
      if (response["msg"] == "success") {
        var data = response["admin"];
        getX.write(v.FULLNAME, data[v.FULLNAME]);
        getX.write(v.EMAIL, data[v.EMAIL]);
        getX.write(v.USER_IMAGE, data[v.USER_IMAGE]);
        getX.write(v.PHONE, data[v.PHONE]);
        // getX.write(v.ADDRESS, data[v.ADDRESS]);
        helperWidgets.showToast("Account updated successfully");

        widget.navigateTo({
          'page': 'courses',
        });
      } else {
        helperWidgets.showToast(
            "oOps! Looks like something went wrong. Please try again.");
      }
    } catch (e) {
      print('-----------------> $e');

      myDioErrorHandler(e);
    } finally {
      setState(() {
        is_updating = false;
      });
    }
  }
}
