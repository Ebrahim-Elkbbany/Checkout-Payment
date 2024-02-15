import 'package:checkout_payment/core/utils/styles.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/card_info_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/payment_info_item.dart';
import 'package:checkout_payment/features/checkout/presentation/view/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 60.h + 16.h, left: 22.w, right: 22.w),
        child: Column(
          children: [
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Style.font25mediumBlack,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Style.font20RegularBlackOpacity,
            ),
            SizedBox(
              height: 42.h,
            ),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            SizedBox(
              height: 20.h,
            ),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            SizedBox(
              height: 20.h,
            ),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            Divider(
              height: 60.h,
              thickness: 2,
            ),
            const TotalPrice(name: 'Total', value: r'$50.97'),
            SizedBox(
              height: 30.h,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 64.w,
                ),
                Container(
                  width: 113.w,
                  height: 58.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Style.font24SemiBoldBlack
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
