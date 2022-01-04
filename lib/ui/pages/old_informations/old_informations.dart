// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';

class OldInformationsPage extends StatefulHookWidget {
  final String scanResult;

  const OldInformationsPage({required this.scanResult});

  @override
  _OldInformationsPageState createState() => _OldInformationsPageState();
}

final firebase = FirebaseFirestore.instance;
final currentUserId = FirebaseAuth.instance.currentUser?.uid;

class _OldInformationsPageState extends State<OldInformationsPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _gecmisBilgiler = firebase.collection('market/${widget.scanResult}/gecmis_bilgiler').snapshots();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppbar(title: "Ürün ile ilgili geçmiş bilgiler"),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _gecmisBilgiler,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return context.showSnackBar(message: "Bir şeyler yanlış gitti! Lütfen tekrar deneyin.");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          return Card(
                            color: AppColors.gray4,
                            child: ListTile(
                              leading: Image.network(data['urun_fotosu']),
                              title: Text(
                                "Ürünün ismi: ${data['urun_adi']} / Marketin adi: ${data['market_ismi']}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                "Ürünün fiyatı: ${data['fiyat_bilgisi'].toString()} / Eklendiği tarih: ${data['fiyat_tarihi']}",
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.gray6,
              child: Center(
                child: TextButton(
                  onPressed: () => context.navigateTo(AddProductRoute(scanResult: widget.scanResult)),
                  child: const Text('Bu ürüne yeni kayıt eklemek için tıkla'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
