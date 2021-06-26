import 'package:flutter/material.dart';

double getProportionateHeight(BuildContext context, double inputHeight) {
  return MediaQuery.of(context).size.height * inputHeight;
}

double getProportionateWidth(BuildContext context, double inputWidth) {
  return MediaQuery.of(context).size.width * inputWidth;
}
