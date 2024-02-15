import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
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
          style: Style.font18RegularBlack,
        ),
        const Spacer(),
        Text(
          '\$$value',
          textAlign: TextAlign.center,
          style: Style.font18RegularBlack,
        ),
      ],
    );
  }
}
