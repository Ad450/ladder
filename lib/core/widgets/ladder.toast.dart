import 'package:fluttertoast/fluttertoast.dart';
import 'package:ladder/gen/colors.gen.dart';

void showToast(String message) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: ColorName.onBackground,
      textColor: ColorName.white,
      fontSize: 16.0);
}
