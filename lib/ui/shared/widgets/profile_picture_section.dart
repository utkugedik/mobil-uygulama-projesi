import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/ui/shared/extensions/context_extensions.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_sheet_menu.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/user_avatar.dart';

class ProfilePictureSection extends StatefulWidget {
  const ProfilePictureSection({Key? key}) : super(key: key);

  @override
  _ProfilePictureSectionState createState() => _ProfilePictureSectionState();
}

class _ProfilePictureSectionState extends State<ProfilePictureSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.dynamicHeight(0.05)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.showBottomSheet(
                child: BottomSheetMenu(
                  menuItems: [
                    ModalBottomSheetModel(
                      title: 'Kamera',
                      onPressedFunction: () {},
                    ),
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
                        final fileName = result?.files.single.name;
                        File file = File(path!);
                        FirebaseStorage.instance.ref('files/$fileName').putFile(file);
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
        ],
      ),
    );
  }
}
