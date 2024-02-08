import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.name,
    required this.value,
  });
  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: Style.font24SemiBoldBlack,
        ),
        const Spacer(),
        Text(
          '\$$value',
          textAlign: TextAlign.center,
          style: Style.font24SemiBoldBlack,
        ),
      ],
    );
  }
}
