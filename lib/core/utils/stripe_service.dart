import 'package:checkout_payment/core/utils/network/api_keys.dart';
import 'package:checkout_payment/core/utils/network/dio.dart';
import 'package:checkout_payment/features/checkout/data/models/create_ephemeral_key/create_ephemeral_key.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_sheet_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

//Stripe service
class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
      body: paymentIntentInputModel.toJson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<CreateEphemeralKey> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16',
      },
      body: {'customer': customerId},
    );
    var ephemeralKey = CreateEphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Ebrahim Elkbbany',
        paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
        customerId: initPaymentSheetModel.customerId,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKeySecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKey = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetModel = InitPaymentSheetModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKey.secret!);
    await initPaymentSheet(initPaymentSheetModel: initPaymentSheetModel);
    await displayPaymentSheet();
  }
}
