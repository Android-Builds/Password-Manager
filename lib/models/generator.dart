import 'dart:math';

import 'package:PassManager/utils/constants.dart';

class Generator {
  String password = '';

  int n;

  Random _random = new Random();

  List<Function> functions = [];

  int nextInt(int min, int max) => min + _random.nextInt((max + 1) - min);

  String getUpperCase() {
    n = nextInt(65, 90);
    return String.fromCharCode(n);
  }

  String getLowerCase() {
    n = nextInt(97, 122);
    return String.fromCharCode(n);
  }

  String getSpecialChars() {
    n = nextInt(33, 47);
    return String.fromCharCode(n);
  }

  String getNumbers() {
    n = nextInt(48, 57);
    return String.fromCharCode(n);
  }

  String generate(int length) {
    for (int i = 0; i < length; i++) {
      password += functions[_random.nextInt(functions.length)]();
    }
    return password;
  }

  addFunctions() {
    functions.add(getLowerCase);
    if (uppercase) {
      functions.add(getUpperCase);
    }
    if (specialchars) {
      functions.add(getSpecialChars);
    }
    if (numbers) {
      functions.add(getNumbers);
    }
    return 1;
  }
}
