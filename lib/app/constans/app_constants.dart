library app_constants;

import 'package:flutter/material.dart';

part 'api_path.dart';
part 'assets_path.dart';

 const String endpoint = "http://localhost/v1";
 const String projectId = "62f23ece8c93f1fb7b4e";

const kFontColorPallets = [
  Color.fromRGBO(26, 31, 56, 1),
  Color.fromRGBO(72, 76, 99, 1),
  Color.fromRGBO(149, 149, 163, 1),
];
const kBorderRadius = 10.0;
const kSpacing = 20.0;

SizedBox kSizedBoxSpaceH10() {
  return SizedBox(
    height: 10,
  );
}

SizedBox kSizedBoxSpaceH15() {
  return SizedBox(
    height: 15,
  );
}

SizedBox kSizedBoxSpaceH20() {
  return SizedBox(
    height: 15,
  );
}

SizedBox kSizedBoxSpaceW10() {
  return SizedBox(
    width: 10,
  );
}

SizedBox kSizedBoxSpaceW15() {
  return SizedBox(
    width: 15,
  );
}

SizedBox kSizedBoxSpaceW20() {
  return SizedBox(
    width: 20,
  );
}
