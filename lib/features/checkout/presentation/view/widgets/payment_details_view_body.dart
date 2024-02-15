import 'dart:developer';

import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/presentation/view/thank_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/custom_credit_card.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18.h, top: 22.h),
              child: const PaymentMethodsListView(),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              autoValidateMode: autoValidateMode,
              formKey: formKey,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25.h,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThankYouView();
                        },
                      ),
                      (route) => false,
                    );
                    log('payment');
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                buttonName: 'Pay',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
        ],
      ),
    );
  }
}
