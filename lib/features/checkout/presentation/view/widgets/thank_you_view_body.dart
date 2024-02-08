import 'package:checkout_payment/features/checkout/presentation/view/widgets/custom_check_icon.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/custom_dashed_line.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h, bottom: 20.h),
        child: SizedBox(
          height: 720.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const ThankYouCard(),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                left: 20.w + 8.w,
                right: 20.w + 8.w,
                child: const CustomDashedLine(),
              ),
              Positioned(
                  left: -20.w,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              Positioned(
                  right: -20.w,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              Positioned(
                top: -50.h,
                left: 0,
                right: 0,
                child: const CustomCheckIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
