import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/core/widgets/custom_snackbar.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/view/thank_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  PaymentIntentInputModel paymentIntentInputModel =PaymentIntentInputModel(amount:'100', currency: 'USD',customerId: 'cus_PWVvAx3NcrJFAP');
                  BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
                },
                buttonName: 'Continue',
                isLoading: state is PaymentLoading ? true : false,
              );
            },
            listener: (BuildContext context, Object? state) {
              if(state is PaymentSuccess){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const ThankYouView();
                }));
              }

              if(state is PaymentFailure){
                Navigator.pop(context);
                customSnackBar(context, state.errorMessage);
              }
            },
          ),
        ],
      ),
    );
  }
}
