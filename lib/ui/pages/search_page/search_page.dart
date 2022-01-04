import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/focus_escape.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/search_textfield.dart';
import 'package:auto_route/auto_route.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

Map<String, dynamic>? searchResult;
final CollectionReference _market = FirebaseFirestore.instance.collection('market');

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return FocusEscape(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(title: 'Bir ürün ara'),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          children: [
            SearchTextField(
              onChanged: (value) {
                FirebaseFirestore.instance.collection('market').where('urun_adi', isGreaterThanOrEqualTo: value).get().then(
                  (value) {
                    searchResult = value.docs[0].data();

                    setState(() {});
                  },
                );
              },
            ),
            const SizedBox(height: 50),
            searchResult!.length > 4
                ? Card(
                    color: AppColors.gray4,
                    child: ListTile(
                      leading: Image.network(searchResult!['urun_fotosu']),
                      title: Text(
                        "Ürünün ismi: ${searchResult!['urun_adi']} / Marketin adi: ${searchResult!['market_ismi']}",
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        "Ürünün fiyatı: ${searchResult!['urun_fiyat'].toString()} / Eklendiği tarih: ${searchResult!['fiyat_tarihi']}",
                      ),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 250),
                      child: TextButton(
                        onPressed: () async {
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
                        },
                        child: const Text(
                          'Ürün Ekle',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
