import 'package:flutter/material.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item.dart';
import 'package:mobil_programlama_odev/ui/shared/widgets/bottom_model_sheet/modal_bottom_sheet_item_widget.dart';

class BottomSheetMenu extends StatelessWidget {
  final List<ModalBottomSheetModel> menuItems;
  final bool centerMenu;
  final String? title;
  final List<VoidCallback>? onPressList;

  const BottomSheetMenu({required this.menuItems, this.onPressList, this.centerMenu = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 9, bottom: 36, right: 21, left: 21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
              _buildDragHandler(),
              if (title != null)
                Container(
                  margin: const EdgeInsets.only(top: 18),
                  child: Text(
                    title!,
                    style: AppTextStyles.p2ExtraBold,
                    textAlign: TextAlign.center,
                  ),
                )
            ] +
            List.generate(
              menuItems.length,
              (index) {
                final menuItem = menuItems[index];
                return ModalBottomSheetItemWidget(
                  title: menuItem.title,
                  icon: menuItem.icon,
                  centerTitle: centerMenu,
                  textColor: menuItem.textColor,
                  route: menuItem.route,
                  onPressed: onPressList?[index] != null ? onPressList![index] : menuItem.onPressedFunction,
                );
              },
            ),
      ),
    );
  }

  Container _buildDragHandler() {
    return Container(
      width: 42,
      height: 4,
      margin: const EdgeInsets.only(top: 10, bottom: 42),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
