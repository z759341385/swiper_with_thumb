/*
 * @Author: your name
 * @Date: 2020-11-08 00:59:01
 * @LastEditTime: 2020-11-08 01:06:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /swiper_with_thumb/test/swiper_with_thumb_test.dart
 */
import 'package:flutter_test/flutter_test.dart';

import 'package:swiper_with_thumb/swiper_with_thumb.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
