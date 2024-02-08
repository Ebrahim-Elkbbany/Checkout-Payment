import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customPaymentAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: Style.font25mediumBlack,
    ),
  );
}
