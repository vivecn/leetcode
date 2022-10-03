class OrderedStream {
  int ptr = 1;
  final List<String> strArr;
  List<String> res = [];

  OrderedStream(int n) : strArr = List<String>.filled(n + 1, '');

  List<String> insert(int idKey, String value) {
    strArr[idKey] = value;
    if (strArr[ptr] != '') {
      for (var i = ptr; i < strArr.length; i++) {
        if (strArr[i] != '') {
          res.add(strArr[i]);
        } else {
          ptr = i;
          break;
        }
      }
    }
    final tempres = [...res];
    res = [];
    return tempres;
  }
}

/**
 * Your OrderedStream object will be instantiated and called as such:
 * OrderedStream obj = OrderedStream(n);
 * List<String> param1 = obj.insert(idKey,value);
 */