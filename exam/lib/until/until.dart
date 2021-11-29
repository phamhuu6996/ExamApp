bool validateMobile(String value) {
  final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  return regExp.hasMatch(value);
}

String convertPhone(String phone) {
  if (phone.isNotEmpty) {
    if (phone[0] == '0') {
      phone = phone.replaceFirst('0', '+84');
    } else {
      phone = '+84' + phone;
    }
  }
  return phone;
}
