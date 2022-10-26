import 'package:flutter/src/painting/text_style.dart';

String cutString(String s, {required TextStyle style}) {
  if (s.length > 18) {
    return s.replaceRange(18, s.length, '...');
  } else {
    return s;
  }
}
