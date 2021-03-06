import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:auto_route/auto_route.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Hemen ürünleri okutmaya başla",
            body: "Takip etmek istediğin ürünleri sisteme ekle!",
            image: Image.asset('assets/svg/barcode.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Marketteki ürünlerin takibini yap",
            body: "Aldığın ürünlerin fiyat geçmişini gör",
            image: Image.asset('assets/svg/market.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Ürünlerin fiyatlarını takip et",
            body: "Sisteme kayıt edilen ürünlerin fiyat geçmişini gör",
            image: Image.asset('assets/svg/grafik.png'),
            decoration: getPageDecoration(),
          ),
        ],
        next: Text('Sonraki'),
        showNextButton: true,
        done: Text('Ana sayfaya git'),
        onDone: () => context.replaceRoute(const LogInRoute()),
      ),
    );
  }
}

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
      imagePadding: EdgeInsets.all(24),
      pageColor: AppColors.whiteColor,
    );
