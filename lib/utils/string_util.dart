/// 判断字符串是否不为空
bool isNotEmpty(String? text) {
  return text?.isNotEmpty ?? false;
}

/// 判断字符串是否为空
bool isEmpty(String? text) {
  return text?.isEmpty ?? true;
}
