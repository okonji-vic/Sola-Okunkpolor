import 'package:flutter/material.dart';

import '../../../api_service/help_feedback_api.dart';
import '../../../main.dart';

import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart' as dio;
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../utils/global.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Customer Support',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: constants.fontsize32,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // emptyState()
          const ChatPage(),

          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    _streamController.add([]);

    checkIfNewConversation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _socket!.disconnect();
  }

  // bool isNewConv = false;
  bool checkingIfUsersHavePreviousConversation = true;

  IO.Socket? _socket;

  _connectSocket() {
    _socket = IO.io(
        '$dioBaseUrl/',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    _socket!.connect();
    _socket!.onConnect((data) {
      print("Connection established:$data");
    });
    _socket!.onConnectError((err) => print("Connection Errr:$err"));
    _socket!.onDisconnect((_) => print('Connection Disconnection'));
    //rec

    _socket!.on("receive-message-$conversationID", (data) {
      print("msg:$data");
      List updatedMessageList = myMessages + [data['message']];
      _streamController.add(updatedMessageList);
      scrollToEnd();
    });

    _socket!.onError((err) => print(err));
  }

  checkIfNewConversation() {
    checkConversations().then((response) {
      print(response);
      if (response != null) {
        if (response['msg'] == "Success") {
          // isNewConv = false;
          conversationID = response['conversation_id'];
          print(
              '>>>>>>>>>>>>>>>>>>>>>>> convID: ${response['conversation_id']} ');
          _connectSocket();
          _getPreviousMessages();
        } else if (response['msg'] == "new conversation initialized") {
          print('new conversation initialized');
          // isNewConv = true;
          conversationID = response['conversation_id'];
          _connectSocket();
          _streamController.add([]);
          setState(() => checkingIfUsersHavePreviousConversation = false);
        } else {
          helperWidgets.showToast('Something went wrong. Try again later');
        }
      } else {
        helperWidgets
            .showToast("Check your internet connection and try again.");
      }
    }).catchError((e) {
      if (e is SocketException) {
        helperWidgets.showToast(
          "Check your internet connection",
        );
        print('>>>>>>>>>>>>>>>>>>>>>>> NO INTERNET CONNECTION ');
      } else {
        print('>>>>>>>>>>>>>>>>>>>>>>> $e ');
      }
    });
  }

  _getPreviousMessages() {
    getMessages(conversationID).then((response) {
      print(response);
      if (response['msg'].toLowerCase() == "success") {
        print("gotten previous messages");
        _streamController.add(response["messages"]);
        setState(() => checkingIfUsersHavePreviousConversation = false);
        Future.delayed(const Duration(milliseconds: 700), () {
          scrollToEnd();
        });
        // _connectSocket();
      } else if (response['msg'].toLowerCase() == "messages not found") {
        print("messages not found");
        _streamController.add([]);
        setState(() => checkingIfUsersHavePreviousConversation = false);
      } else {
        helperWidgets
            .showToast("Check your internet connection and try again.");
      }
    }).catchError((e) {
      if (e is SocketException) {
        helperWidgets.showToast(
          "Check your internet connection",
        );
      } else {
        print('>>>>>>>>>>>>>>>>>>>>>>> $e ');
      }
    });
  }

//0 means loading
//1 means okay and good
//2 means error
// int checkingConversations = 0;

//if its empty, it will throw error. So use 'a' by default
  String conversationID = 'a';

  TextEditingController messageController = TextEditingController();

  final ScrollController _controller =
      ScrollController(); //attached this _controller to a scrollable widget to help auto scroll when a new message is sent
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>();

  // CollectionReference message_collection =
  //     FirebaseFirestore.instance.collection(db.MESSAGES_COLLECTION);

  @override
  build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Container(
      child: checkingIfUsersHavePreviousConversation == true
          ? const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: <Widget>[
                  sendingImage
                      ? const LinearProgressIndicator()
                      : const SizedBox(),

                  // WHEN DOWNLOADING A FILE
                  downloading
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('$downloadingFileName: $totalFileSize',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: _percentage,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          constants.lightPurple),
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(progress,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: constants.lightPurple))
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: StreamBuilder<dynamic>(
                      stream: _streamController.stream,
                      builder:
                          (BuildContext context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.data == null) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: constants.lightPurple));
                        }
                        if (asyncSnapshot.hasError) {
                          return const Center(
                              child: Text('Error fetching messages'));
                        }

                        myMessages = asyncSnapshot.data;

                        if (!asyncSnapshot.hasData) {
                          return const Center(child: Text('Loading...'));
                        } else if (myMessages.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "You have not initiated any conversation with customer support",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                            // reverse: true,
                            shrinkWrap: true,
                            controller: _controller,
                            itemCount: myMessages.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  if (displayChatDate(index))
                                    Row(
                                      children: [
                                        const Expanded(child: Divider()),
                                        const SizedBox(width: 5),
                                        Text(
                                          timeManager.get_chat_date(
                                              myMessages[index][v.TIMESTAMP]),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
                                        ),
                                        const SizedBox(width: 5),
                                        const Expanded(child: Divider())
                                      ],
                                    ),
                                  if (index < myMessages.length)
                                    buildMessageOrImage(
                                        screen, myMessages[index])
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),

                  //*BUTTON BELOW

                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromRGBO(218, 218, 218, 0.6)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(
                                  child: TextField(
                                    controller: messageController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: ' Type your message...',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                    ),
                                    minLines: 1,
                                    maxLines: 4,
                                    onChanged: (String val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        buildAttachButton(),
                        GestureDetector(
                          onTap: () async {
                            if (messageController.text.isNotEmpty) {
                              // print(messageController.text);
                              // await FlutterRingtonePlayer.play(fromAsset: './assets/audio/beep2.wav', looping: false);
                              _sendMessage();
                            } else {
                              print('empty');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(180)),
                                  color: messageController.text.isNotEmpty
                                      ? constants.lightPurple
                                      : Colors.grey),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.send_outlined,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  bool displayChatDate(int index) {
    // one message
    if (myMessages.length == 1) {
      return true;
    }
    //first message
    if (index == 0) {
      return true;
    }
    //if message date the same as previous message date don't display
    if (timeManager.get_chat_date(myMessages[index][v.TIMESTAMP]) ==
        timeManager.get_chat_date(myMessages[index - 1][v.TIMESTAMP])) {
      return false;
    }
    return true;
  }

  buildMessageOrImage(screen, dynamic messageDocument) {
    bool isOwnMessage;

    if (messageDocument[v.SENDER_ID] == getX.read(v.USER_ID)) {
      isOwnMessage = true;
    } else {
      isOwnMessage = false;
    }

    if (messageDocument[v.MESSAGE_TYPE] == 'msg') {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 15),
        child: Row(
          mainAxisAlignment:
              isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              // elevation: 5,
              color: isOwnMessage ? constants.lightPurple : Colors.grey[300],
              borderRadius: BorderRadius.circular(13.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: screen.width - 150,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(messageDocument[v.CONTENT],
                              style: TextStyle(
                                color:
                                    isOwnMessage ? Colors.white : Colors.black,
                                fontSize: 16,
                              )),
                          const SizedBox(height: 7),
                          messageDocument[v.TIMESTAMP] == null
                              ? const Text(
                                  "...",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              : Text(
                                  timeManager.time_from_timestamp(
                                      messageDocument[v.TIMESTAMP]),
                                  style: TextStyle(
                                    color: isOwnMessage
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      //an image
      // return FlutterLogo();
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 15),
        child: Row(
          mainAxisAlignment:
              isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: isOwnMessage ? constants.lightPurple : Colors.grey[200],
              borderRadius: BorderRadius.circular(13.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: screen.width / 2,
                      ),
                      child: Column(
                        children: [
                          Image.network(
                              '${messageDocument[v.MESSAGE_IMAGE][0]}'),
                          const SizedBox(height: 7),
                          messageDocument[v.TIMESTAMP] == null
                              ? const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "...",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    timeManager.time_from_timestamp(
                                        messageDocument[v.TIMESTAMP]),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
          ],
        ),
      );
    }
  }

  // void beepAdmin({required bool isNewConv}) {
  //   //responsible for triggering sound for new message for the admin
  //   hf_messages_count.update({
  //     db.MESSAGES_COUNT: FieldValue.increment(1)
  //   });

  //   //responsible for increasing the unread messages count in the admin side
  //   if (isNewConv == true) {
  //     conversations_collection.doc(conversationID).update({
  //       db.UNREAD_USER_MESSAGE_COUNT: 1,
  //     });
  //   } else {
  //     conversations_collection.doc(conversationID).update({
  //       // db.IS_ADMIN_IN_CHAT: true,
  //       db.UNREAD_USER_MESSAGE_COUNT: FieldValue.increment(1),
  //     });
  //   }
  // }

  // Future<dynamic> _sendMessage() async {
  //   messageController.text = '';
  //   String contentToDB = content;
  //   setState(() {
  //     content = '';
  // });

  //   print(contentToDB);
  //   var formData = {
  //     "token": getX.read(v.TOKEN),
  //     "owner_name": getX.read(v.FULLNAME),
  //     "owner_img": getX.read(v.USER_IMAGE),
  //     "new_conv": isNewConv,
  //     "conv_id": conversationID,
  //     "message": contentToDB,
  //     "msg_type": "msg",
  //     "who_sent": "user",
  //     "which_user": "admin",
  //   };
  //   try {
  //     var response = await sendMessage(formData);
  //     print("ffff$response");

  //     if (response['msg'] == "Message sent") {
  //       print('>>>>>>>>>>>>>>>>>>>>>>> $response ');
  //       isNewConv = false;
  //       conversationID = response["conversation_id"];
  //       scrollToEnd();
  //     } else {
  //       helperWidgets.showToast("Oops an error occured please resend message");
  //     }
  //   } on dio.DioError catch (e) {
  //     print('-----------------> ${e.error}');
  //     myHttpErrorHandler(e);
  //   }
  // }

  _sendMessage() {
    setState(() {
      _socket!.emit('help-feedback', {
        "token": getX.read(v.TOKEN),
        "conversation_id": conversationID,
        "sender_name": getX.read(v.FULLNAME),
        "sender_id": getX.read(v.USER_ID),
        "message": messageController.text.trim(),
        "msg_type": "msg",
        "sender_img":
            getX.read(v.USER_IMAGE).isEmpty ? "a" : getX.read(v.USER_IMAGE),
        "receiver_id": "admin",
        "to": "admin",
      });
    });
    messageController.clear();
    // if (isNewConvo) {
    //   setState(() {
    //     loadingState = 1;
    //   });
    // }
  }

//function to scroll page automatically after sending a new message
  scrollToEnd() {
    if (myMessages.length > 5) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        // 0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  List<dynamic> myMessages = <dynamic>[];

//the reason I am causing this restriction is because I dont want the user to be able to send
//an image as the first file when a conversationID has not been created considering it is from mongo we get the conv_id first from
  buildAttachButton() {
    if (messageController.text.isEmpty) {
      // print('>>>>>>>>>>>>>>>>>>>>>>> NO TEXT IN THE TEXTFIELD YET ');

      return IconButton(
        icon: const Icon(Icons.attach_file_sharp),
        onPressed: () {
          if (myMessages.isEmpty) {
            // helperWidgets.showToast("Send a message first");
          } else {
            // showModalToSelectImage();
          }
        },
      );
    } else {
      return const SizedBox();
    }
  }

  Future<bool> checkIfImageIsDownloaded(String fileName) async {
    String fileDownloadPath = "$downloadDirectory/$fileName";

    bool isfileExist = await File(fileDownloadPath).exists();

    return Future<bool>.value(isfileExist);
  }

  String? downloadDirectory;
  getDownloadDirectory() async {
    Directory? directory;

    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');

      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }

    downloadDirectory = directory!.path;
  }

//
  File? pickedImage;
  bool sendingImage = false;
  // late ImageSource picTypeSelection;

  String downloadingFileName = '';

  var progress = '';
  bool downloading = false;
  String totalFileSize = '';
  final double _percentage = 0;

  // //METHOD TO CONVERT THE FILE FROM BYTES TO MB
  String formatBytes(int bytes) {
    if (bytes <= 0) return "0 KB";
    const suffixes = ['b', 'kb', 'mb', 'gb', 'tb', 'pb', 'eb', 'zb', 'yb'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(0)) + suffixes[i];
  }

  // // On IOS it create a folder with the name of your app and put the file inside it. Users can easily find the folder, it's intuitive.
  // // On Android, I test if the default download folder exist (it work most of the time), else I put inside the external storage directory (in this case, it's hard for the user to manually find the file...).
  downloadOrOpenFile(String fileName, String fileUrl) async {
    try {
      //this will be the location path of the file downloading/downloaded
      String fileDownloadPath = "$downloadDirectory/$fileName";

      if (await File(fileDownloadPath).exists()) {
        // helperWidgets.showToast("File already downloaded");
        // OpenFilex.open(fileDownloadPath);
        // helperWidgets.showToast("File already downloaded. View through your gallery app");
      } else {
        setState(() {
          downloading = true;
        });
        //THIS WILL SHOW THE CUSTOMIZED SNACKBAR (FLUSHBAR)
        // showFlushBar2(context, 'Please do not leave this screen while download is in progress');

        //DOWNLOAD BEGINS HERE
        await dio.Dio().download(fileUrl, fileDownloadPath,
            onReceiveProgress: (rec, total) {
          print('Received: $rec, Total: $total');

          var percentage = rec / total * 100;

          // _percentage = percentage / 100;

          setState(() {
            downloadingFileName = fileName;
            totalFileSize = formatBytes(total);
            progress = ("${percentage.floor()}%");
          });
        }).then((val) {
          // helperWidgets.showToast("Download complete");

          setState(() {
            downloading = false;
          });
        }).catchError((e) {
          if (e is SocketException) {
            // helperWidgets.showToast("Check your internet connection & try again");
          } else {
            print(e);
            // helperWidgets.showToast("Download failed");
          }
          setState(() {
            downloading = false;
          });
        });
      }
    } catch (e) {
      print("dfff$e");
    }
  }

  // showModalToSelectImage() {
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return SizedBox(
  //         height: 150,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             const Padding(
  //               padding: EdgeInsets.symmetric(vertical: 5.0),
  //               child: Align(
  //                   alignment: Alignment.center,
  //                   child: Text("Choose from:",
  //                       style: TextStyle(
  //                           fontSize: 16, fontWeight: FontWeight.w400))),
  //             ),
  //             const SizedBox(height: 5),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     Navigator.pop(context);
  //                     picTypeSelection = ImageSource.camera;
  //                     chooseFile(picTypeSelection);
  //                   },
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       CircleAvatar(
  //                           radius: 25,
  //                           backgroundColor: constants.lightPurple,
  //                           child: const Icon(
  //                             Icons.camera,
  //                             color: Colors.white,
  //                           )),
  //                       const SizedBox(height: 5),
  //                       const Text("Camera",
  //                           style: TextStyle(
  //                               fontSize: 14, fontWeight: FontWeight.w400)),
  //                     ],
  //                   ),
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     Navigator.pop(context);
  //                     picTypeSelection = ImageSource.gallery;
  //                     chooseFile(picTypeSelection);
  //                   },
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 25,
  //                         backgroundColor: constants.lightPurple,
  //                         child: const Icon(Icons.image, color: Colors.white),
  //                       ),
  //                       const SizedBox(height: 5),
  //                       const Text("Gallery",
  //                           style: TextStyle(
  //                               fontSize: 14, fontWeight: FontWeight.w400)),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // chooseFile(ImageSource imageSource) {
  //   ImagePicker().pickImage(source: imageSource).then((tempImage) async {
  //     if (tempImage != null) {
  //       setState(() {
  //         sendingImage = true;
  //       });

  //       pickedImage = File(tempImage.path);

  //       String fileName = "IMG_${DateTime.now().millisecondsSinceEpoch}.jpg";

  //       var formData = dio.FormData.fromMap({
  //         "token": getX.read(v.TOKEN),
  //         "conversation_id": conversationID,
  //         "sender_name": getX.read(v.FULLNAME),
  //         "sender_id": getX.read(v.USER_ID),
  //         "message": "a",
  //         "msg_type": "img",
  //         "sender_img": getX.read(v.USER_IMAGE),
  //         "receiver_id": widget.targetID,
  //         "to": widget.target,
  //         "new_conv": false,
  //         "conv_id": conversationID,
  //         "other_username": widget.targetName,
  //         "other_user_img": widget.targetImage,
  //         "chat_init_user_id": "a",
  //         "msg_file_ext": "png",
  //         "msg_file_name": fileName,
  //         "resource_type": "image",
  //       });

  //       // print(formData.fields);

  //       var file = await dio.MultipartFile.fromFile(
  //         pickedImage!.path,
  //         filename: fileName,
  //         contentType: MediaType("image", "jpeg"),
  //       );
  //       formData.files.add(MapEntry('images', file));

  //       try {
  //         var response = await sendMessageWithImage(formData);

  //         if (response['msg'] == "Message sent") {
  //           print('>>>>>>>>>>>>>>>>>>>>>>> $response ');
  //           // isNewConv = false;
  //           scrollToEnd();
  //         } else {
  //           helperWidgets.showToast("Oops an error occured please resend image");
  //         }
  //       } on dio.DioError catch (e) {
  //         print('-----------------> ${e.response}');
  //         myDioErrorHandler(e);
  //       } finally {
  //         setState(() {
  //           sendingImage = false;
  //         });
  //       }
  //     } else {
  //       print("didnt select image");
  //     }
  //   });
  // }
}
