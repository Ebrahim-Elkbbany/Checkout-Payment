import 'dart:developer';

import 'package:checkout_payment/core/utils/network/api_keys.dart';
import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/core/widgets/custom_snackbar.dart';
import 'package:checkout_payment/features/checkout/data/models/items_list/item.dart';
import 'package:checkout_payment/features/checkout/data/models/items_list/items_list.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal_amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal_amount_model/paypal_amount_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/view/thank_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const PaymentMethodsListView(),
          SizedBox(
            height: 32.h,
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            builder: (BuildContext context, state) {
              return CustomButton(
                onPressed: () {
                  //>>>>>>>>>>>>>>>>>>>>>> Stripe Payment
                  // PaymentIntentInputModel paymentIntentInputModel =
                  //     PaymentIntentInputModel(
                  //         amount: '100',
                  //         currency: 'USD',
                  //         customerId: 'cus_PWVvAx3NcrJFAP');
                  // BlocProvider.of<PaymentCubit>(context).makePayment(
                  //     paymentIntentInputModel: paymentIntentInputModel);


                  //>>>>>>>>>>>>>>>>>> paypal payment

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckoutView(
                      sandboxMode: true,
                      clientId: ApiKeys.clientId,
                      secretKey: ApiKeys.paypalSecretKey,
                      transactions: [
                        {
                          "amount": paypalData().amount,
                          "description": "The payment transaction description.",
                          "item_list":  paypalData().ordersList,
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        log("onSuccess: $params");
                        Navigator.pop(context);
                      },
                      onError: (error) {
                        log("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                        Navigator.pop(context);
                      },
                    ),
                  ));
                },
                buttonName: 'Continue',
                isLoading: state is PaymentLoading ? true : false,
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is PaymentSuccess) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ThankYouView();
                }));
              }

              if (state is PaymentFailure) {
                Navigator.pop(context);
                customSnackBar(context, state.errorMessage);
              }
            },
          ),
        ],
      ),
    );
  }

  ({PaypalAmountModel amount, OrdersList ordersList}) paypalData() {
    var details = Details(
      shipping: '0',
      shippingDiscount: 0,
      subtotal: '100',
    );
    var amount =
    PaypalAmountModel(currency: 'USD', details: details, total: '100');
    List<Item>? orders = [
      Item(
        currency: "USD",
        name: "Apple",
        quantity: 4,
        price: '10',
      ),
      Item(
        currency: "USD",
        name: "Pineapple",
        quantity: 5,
        price: '12',
      ),
    ];
    var ordersList = OrdersList(orders: orders);
    return (amount: amount, ordersList: ordersList);
  }
}
