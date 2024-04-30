int hexColorToAARRGGBB(String hexColor) {
  return int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000;
}
