void main() {
  _List();
}

/// 列表类型
_List() {
  /// 第一种初始化方式
  List list1 = [1, 2, 3, '4', '5', '6'];
  print(list1);

  /// 第二种初始化方式
  List list2 = [];
  list2.add("list2");
  list2.addAll(list1);
  print(list2);

  /// 第三种初始化方式
  List list3 = List.generate(3, (index) => index * 2);
  print(list3);

  /// 遍历
  for (var i = 0; i < list1.length; i++) {
    print(list1[i]);
  }

  for (var item in list1) {
    print(item);
  }

  list1.forEach((element) {
    print(element);
  });
}

sum(var1, var2, {bool flag = false}) {}
