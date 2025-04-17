import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';

class HelperWidget{
  showToast(String message, {Widget leading = const SizedBox()}) {
    // toast('Hello world!');

    return showSimpleNotification(
      Text(
        message,
        textAlign: TextAlign.center,
      ),
      position: NotificationPosition.bottom,
      duration: const Duration(seconds: 4),
      leading: leading,

      // slideDismissDirection: DismissDirection.up,
      // background: Colors.green,
      // trailing: Builder(
      //   builder: (context) => TextButton(
      //     // textColor: Colors.white,
      //     onPressed: () {
      //       OverlaySupportEntry.of(context)?.dismiss();
      //     },
      //     child: Text('Dismiss',),
      //   ),
      // ),
    );
  }

    build_cached_image(
    String url, {
    double? height = 150,
    double? width = 150,
  }) {
    return FastCachedImage(
      height: height,
      width: width,
      url: url,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(seconds: 1),
      errorBuilder: (context, exception, stacktrace) {
        return const Icon(Icons.error);
      },
      loadingBuilder: (context, progress) {
        return const CircularProgressIndicator();
      },
    );
  }
}