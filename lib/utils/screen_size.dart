import 'package:flutter/widgets.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }

DeviceScreenType deviceScreenType(double width) {
  if (width > 1950) {
    //TODO:was 950
    return DeviceScreenType.Desktop;
  }
  if (width > 600) {
    return DeviceScreenType.Tablet;
  }
  return DeviceScreenType.Mobile;
}