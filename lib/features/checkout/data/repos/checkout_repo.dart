import 'package:checkout_payment/core/utils/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
