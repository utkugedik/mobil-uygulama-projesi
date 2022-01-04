import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

class SearchTextField extends HookWidget {
  final String? hintText, value;
  final void Function(String)? onChanged;

  const SearchTextField({this.hintText, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    final _textEditingController = useTextEditingController(text: value ?? "");
    final isFirstTimeRendering = useState(true);
    final focusNode = useFocusNode();

    useEffect(() {
      if (isFirstTimeRendering.value && value != null && value!.isNotEmpty) {
        _textEditingController.text = value ?? "";
      }
      isFirstTimeRendering.value = false;
    }, [value]);

    return SizedBox(
      height: 46,
      child: TextField(
        controller: _textEditingController,
        cursorColor: AppColors.touchBlack,
        style: AppTextStyles.p2Medium.copyWith(height: 1.5),
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        decoration: InputDecoration(
            filled: true,
            hintText: hintText ?? "Ara...",
            hintStyle: AppTextStyles.p2Medium.copyWith(color: AppColors.gray4),
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.gray4,
            ),
            fillColor: AppColors.gray6,
            focusedBorder: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder()),
        onChanged: onChanged != null ? (value) => onChanged!(_textEditingController.text) : null,
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
