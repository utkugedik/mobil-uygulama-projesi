import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:auto_route/auto_route.dart';

class HomeTabMainAppBar extends HookWidget with PreferredSizeWidget {
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference _market = firebase.collection('market');

    return AppBar(
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      // ignore: deprecated_member_use
      brightness: Brightness.dark,
      actions: [
        IconButton(
          onPressed: () {
            context.navigateTo(const SearchRoute());
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.blackColor,
          ),
        ),
        IconButton(
          onPressed: () async {
            try {
              String scanResult = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Vazgec", true, ScanMode.BARCODE);
              _market.doc(scanResult).get().then(
                (DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists.toString() == "true") {
                    context.navigateTo(OldInformationsRoute(scanResult: scanResult));
                  } else {
                    context.navigateTo(AddNewProductRoute(scanResult: scanResult));
                  }
                },
              );
            } on PlatformException catch (e) {
              context.showSnackBar(message: e.message);
            }
          },
          icon: const Icon(Icons.qr_code_scanner, color: AppColors.blackColor),
        ),
        IconButton(
          onPressed: () => context.navigateTo(const ProfileRoute()),
          icon: Icon(Icons.portrait_rounded),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
