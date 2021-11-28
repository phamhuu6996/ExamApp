bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return true;
  }
  return false;
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
