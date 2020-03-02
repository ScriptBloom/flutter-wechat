import 'package:flutter/cupertino.dart';

wrapCallback(Widget child, void Function() callback) {
  return GestureDetector(
    onTap: () {
      if (callback != null) callback();
    },
    child: child,
  );
}