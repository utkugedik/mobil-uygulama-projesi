import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_snackar.dart';
import 'package:supercharged/supercharged.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}

extension SnackbarExtension on BuildContext {
  showSnackBar({
    String? message,
    dynamic error,
    SnackBarType snackBarType = SnackBarType.error,
    Duration? duration,
    String? actionLabel,
    VoidCallback? action,
  }) {
    var snackMessage = message ?? "";
    if (error != null) {
      if (error is DioError) {
        if (error.response!.statusCode == 500) {
          debugPrint("ERROR 2 --> " + error.toString());
          snackMessage = "Bir hata oluştu. Lütfen uygulamayı kapatıp tekrar açınız.";
        } else {
          snackMessage = error.response?.data?["message"] ?? "Bir hata oluştu. Lütfen uygulamayı kapatıp tekrar açınız.";
        }
      } else {
        debugPrint("ERROR --> " + error.toString());
        snackMessage = "Bir hata oluştu. Lütfen uygulamayı kapatıp tekrar açınız.";
      }
    }
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      CustomSnackBar.show(
        message: snackMessage,
        snackBarType: snackBarType,
        duration: duration ?? 2.5.seconds,
        actionLabel: actionLabel,
        action: action,
      ),
    );
  }
}

extension ShowModalBottomSheetExtension on BuildContext {
  Future<void> showBottomSheet({required Widget child, bool useRootNavigator = true}) async {
    await showModalBottomSheet(
        context: this,
        isScrollControlled: true,
        useRootNavigator: useRootNavigator,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        builder: (BuildContext context) => child);
  }
}
