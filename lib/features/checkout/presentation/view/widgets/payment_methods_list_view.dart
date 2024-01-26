
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_item_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> methodsImages =const[
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];
  int selectedIndex =0;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 62.h,
        width: 226.w,
        child: Align(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: methodsImages.length,
            itemBuilder: (context, index) => PaymentItemMethod(
              onTap: () {
                selectedIndex = index;
                setState(() {

                });
              },
              isSelected: selectedIndex ==index,
              image: methodsImages[index],
            ), separatorBuilder: (context, index) => SizedBox(
            width: 20.w,
          ),),
        ),
      ),
    );
  }
}