import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/core/routing/routing.gr.dart';
import 'package:mobil_programlama_odev/ui/shared/enums/textfield_type.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_sheet_menu.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_appbar.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_button.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/custom_textfield.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/focus_escape.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/string_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/user_avatar.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({Key? key, required this.scanResult}) : super(key: key);
  final String scanResult;

  @override
  _AddNewProductPageState createState() => _AddNewProductPageState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
late String urunAdi;
late String fiyatTarihi;
late String marketIsmi;
late double fiyatBilgisi;
late String imageUrl;

class _AddNewProductPageState extends State<AddNewProductPage> {
  File? file;
  String? fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusEscape(
        child: Scaffold(
          appBar: const CustomAppbar(title: 'Yeni ürün ekle'),
          backgroundColor: AppColors.whiteColor,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: context.dynamicHeight(0.05)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.showBottomSheet(
                                      child: BottomSheetMenu(
                                        menuItems: [
                                          ModalBottomSheetModel(
                                            title: 'Galeri',
                                            onPressedFunction: () async {
                                              final result = await FilePicker.platform.pickFiles(
                                                allowMultiple: false,
                                                type: FileType.custom,
                                                allowedExtensions: ['png', 'jpg'],
                                              );
                                              if (result == null) {
                                                context.showSnackBar(message: 'Dosya secilmeedi');
                                              }
                                              final path = result?.files.single.path;
                                              fileName = result?.files.single.name ?? '';
                                              file = File(path!);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(42, 0, 62, 0.2),
                                        blurRadius: 42,
                                      )
                                    ]),
                                    padding: const EdgeInsets.symmetric(horizontal: 21),
                                    child: const UserAvatar(size: 105),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  fileName ?? '',
                                  style: AppTextStyles.p3ExtraBold.copyWith(
                                    color: AppColors.mainColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          CustomTextField(
                            hintText: 'Ürün adı',
                            textFieldType: TextFieldType.normal,
                            validate: (v) => v!.hasData,
                            onChange: (value) => urunAdi = value,
                          ),
                          CustomTextField(
                            hintText: 'Fiyat tarihi',
                            textFieldType: TextFieldType.normal,
                            validate: (v) => v!.hasData,
                            onChange: (value) => fiyatTarihi = value,
                          ),
                          CustomTextField(
                            hintText: 'Market ismi',
                            textFieldType: TextFieldType.normal,
                            validate: (v) => v!.hasData,
                            onChange: (value) => marketIsmi = value,
                          ),
                          CustomTextField(
                            hintText: 'Fiyati bilgisi',
                            textFieldType: TextFieldType.phone,
                            validate: (v) => v!.hasData,
                            onChange: (value) => fiyatBilgisi = double.parse(value),
                          ),
                          const SizedBox(height: 36),
                          CustomButton(
                            buttonText: 'Kaydet',
                            onPressed: () async {
                              await FirebaseStorage.instance.ref('product/$fileName').putFile(file!);
                              await FirebaseStorage.instance.ref('product/$fileName').getDownloadURL().then((value) => imageUrl = value);

                              await FirebaseFirestore.instance.collection('market').doc(widget.scanResult).set(
                                {
                                  'urun_adi': urunAdi,
                                  'fiyat_tarihi': fiyatTarihi,
                                  'market_ismi': marketIsmi,
                                  'fiyat_bilgisi': fiyatBilgisi,
                                  'urun_fotosu': imageUrl,
                                },
                              );
                              await FirebaseFirestore.instance.collection('market/${widget.scanResult}/gecmis_bilgiler').add(
                                {
                                  'urun_adi': urunAdi,
                                  'fiyat_tarihi': fiyatTarihi,
                                  'market_ismi': marketIsmi,
                                  'fiyat_bilgisi': fiyatBilgisi,
                                  'urun_fotosu': imageUrl,
                                },
                              );

                              context.replaceRoute(const HomeTabMainRoute());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
