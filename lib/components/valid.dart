// ignore_for_file: unnecessary_string_interpolations

import 'package:nijad_app/constant/message.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputMax $max";
  }
  if (val.isEmpty) {
    return "$messageInputEmpy";
  }
  if (val.length < min) {
    return "$messageInputMin $min";
  }
}
