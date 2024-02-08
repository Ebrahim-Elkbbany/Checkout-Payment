import 'package:checkout_payment/core/utils/errors/failures.dart';
import 'package:checkout_payment/core/utils/stripe_service.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CheckoutRepoImpl extends CheckoutRepo{
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel})async {
    try {
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

}