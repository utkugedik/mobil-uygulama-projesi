import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobil_programlama_odev/ui/shared/enums/textfield_type.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/colors.dart';
import 'package:mobil_programlama_odev/ui/shared/styles/text_styles.dart';

class CustomTextField extends HookWidget {
  final String hintText;
  final String? prefixText, label, value, headerText;
  final bool isParagraph;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode, nextFocusNode;
  final Function onChange;
  final FormFieldValidator<String>? validate;
  final int? minimumLine;
  final int? maximumLine;
  final int? maxLength;
  final TextFieldType? textFieldType;
  final bool? isAllCharactersUppercase;
  final TextStyle? placeHolderTextStyle;
  final bool displayBorder;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final InputBorder? inputBorder;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField(
      {required this.hintText,
      required this.onChange,
      this.isParagraph = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType,
      this.focusNode,
      this.nextFocusNode,
      this.validate,
      this.value,
      this.prefixText,
      this.label,
      this.headerText,
      this.minimumLine = 1,
      this.maximumLine,
      this.maxLength,
      this.textFieldType = TextFieldType.normal,
      this.isAllCharactersUppercase = false,
      this.placeHolderTextStyle,
      this.displayBorder = true,
      this.obscureText = false,
      this.readOnly = false,
      this.onTap,
      this.suffixIcon,
      this.inputBorder,
      this.textStyle,
      this.contentPadding});

  TextInputType getTextInputType() {
    switch (textFieldType) {
      case TextFieldType.normal:
        return TextInputType.text;
      case TextFieldType.phone:
        return TextInputType.number;
      case TextFieldType.mail:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  Widget _buildTextField(BuildContext context, TextEditingController _controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText != null
            ? Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  headerText!,
                  style: AppTextStyles.p2ExtraBold,
                ),
              )
            : const SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: headerText != null ? 6 : 0),
          child: TextFormField(
            onTap: onTap,
            controller: _controller,
            focusNode: focusNode,
            readOnly: readOnly,
            style: textStyle ?? AppTextStyles.p2Medium,
            cursorColor: AppColors.mainColor,
            minLines: isParagraph ? minimumLine : null,
            maxLines: isParagraph ? maximumLine : 1,
            validator: validate,
            textInputAction: textInputAction,
            keyboardType: textInputType ?? getTextInputType(),
            maxLength: maxLength,
            textCapitalization: isAllCharactersUppercase! ? TextCapitalization.characters : TextCapitalization.none,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              alignLabelWithHint: true,
              labelText: label,
              prefixText: prefixText,
              hintText: hintText,
              hintMaxLines: minimumLine,
              hintStyle: placeHolderTextStyle ?? AppTextStyles.p2Medium.copyWith(color: AppColors.gray4),
              counter: const Offstage(),
              border: _getBorderStyle(
                context,
                displayBorder,
              ),
              enabledBorder: _getBorderStyle(
                context,
                displayBorder,
              ),
              focusedBorder: _getBorderStyle(
                context,
                displayBorder,
                isFocused: true,
              ),
              suffixIcon: suffixIcon,
              errorBorder: _getBorderStyle(
                context,
                displayBorder,
                hasError: true,
              ),
            ),
            onChanged: (value) => onChange(_controller.text),
            onFieldSubmitted: (String value) {
              _nextFocus(nextFocusNode, context);
            },
          ),
        ),
      ],
    );
  }

  _nextFocus(FocusNode? nextFocusNode, BuildContext context) {
    focusNode?.unfocus();
    if (nextFocusNode != null) {
      FocusScope.of(context).requestFocus(nextFocusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _textEditingController = useTextEditingController(text: value ?? "");
    final isFirstTimeRendering = useState(true);

    useEffect(() {
      if (isFirstTimeRendering.value && value != null && value!.isNotEmpty) {
        _textEditingController.text = value ?? "";
      }
      isFirstTimeRendering.value = false;
    }, [value]);

    return _buildTextField(context, _textEditingController);
  }

  InputBorder _getBorderStyle(
    BuildContext context,
    bool displayBorder, {
    bool isFocused = false,
    bool hasError = false,
  }) =>
      displayBorder
          ? inputBorder == null
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: hasError
                        ? AppColors.redColor
                        : isFocused
                            ? AppColors.mainColor
                            : AppColors.gray3,
                  ),
                )
              : inputBorder!
          : InputBorder.none;
}
