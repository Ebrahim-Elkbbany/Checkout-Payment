import 'dart:developer';

import 'package:checkout_payment/core/utils/network/api_keys.dart';
import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/data/models/items_list/item.dart';
import 'package:checkout_payment/features/checkout/data/models/items_list/items_list.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal_amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal_amount_model/paypal_amount_model.dart';
import 'package:checkout_payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/view/payment_details_view.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/order_details.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/basket.png',
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          const OrderDetails(
            name: 'Order Subtotal',
            value: '42.97',
          ),
          SizedBox(
            height: 3.h,
          ),
          const OrderDetails(
            name: 'Discount',
            value: '0',
          ),
          SizedBox(
            height: 3.h,
          ),
          const OrderDetails(
            name: 'Shipping',
            value: '8',
          ),
          Divider(
            height: 34.h,
            thickness: 2,
            color: const Color(0xFFC6C6C6),
          ),
          const TotalPrice(
            name: 'Total',
            value: '50.97',
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
            buttonName: 'Complete Payment',
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));

              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );

            },
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

}
