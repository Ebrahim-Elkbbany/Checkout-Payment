import 'package:checkout_payment/core/widgets/custom_payment_app_bar.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPaymentAppBar(
        title: 'My Cart',
      ),
      body: const MyCartViewBody(),
    );
  }
}
