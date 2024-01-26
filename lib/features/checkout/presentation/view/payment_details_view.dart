import 'package:checkout_payment/core/widgets/custom_payment_app_bar.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPaymentAppBar(
        title: 'Payment Details',
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
