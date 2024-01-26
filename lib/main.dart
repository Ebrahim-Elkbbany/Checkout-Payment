import 'package:checkout_payment/features/checkout/presentation/view/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
       return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const MyCartView(),
    );
  }
}

