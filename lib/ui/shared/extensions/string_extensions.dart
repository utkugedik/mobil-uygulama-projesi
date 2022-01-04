import 'package:mobil_programlama_odev/ui/shared/enums/regex_type.dart';

extension ValidationExtensions on String {
  String? hasMinLengthOf(int minLength) => length >= minLength ? null : "Bu bölüm en az {$minLength} karakter içermelidir.";

  String? get isValidMail => RegexType.eMail.regex.hasMatch(this) ? null : "Lütfen geçerli bir e-posta adresi giriniz.";

  String? get isValidPassword => RegexType.password.regex.hasMatch(this) ? null : "Lütfen geçerli bir şifre giriniz.";

  String? isConfirmPasswordMatch(String password) => compareTo(password) == 0 ? null : "Şifreler uyuşmuyor.";

  String? hasExactLengthOf(int exactLength) => length == exactLength ? null : "Bu bölüm tam olarak {$exactLength} karakterden oluşmalıdır";

  String? get hasData => isNotEmpty ? null : "Bu bölüm boş bırakılamaz.";

  String? isInList(List<String> stringList, String? errorText) => stringList.contains(this) ? null : errorText ?? "Seçeneklerden birini seçin.";
}
