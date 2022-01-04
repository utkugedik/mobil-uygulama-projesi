import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobil_programlama_odev/ui/pages/main_page/tabs/home_tab_pages/widgets/home_tab_main_app_bar.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';

class HomeTabMainPage extends StatefulHookWidget {
  @override
  _HomeTabMainPageState createState() => _HomeTabMainPageState();
}

final firebase = FirebaseFirestore.instance;

class _HomeTabMainPageState extends State<HomeTabMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _marketStream = firebase.collection('market').snapshots();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: HomeTabMainAppBar(),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _marketStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return context.showSnackBar(message: "Bir şeyler yanlış gitti! Lütfen tekrar deneyin.");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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
            )
          ],
        ),
      ),
    );
  }
}
