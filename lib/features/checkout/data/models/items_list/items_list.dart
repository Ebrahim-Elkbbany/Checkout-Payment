import 'item.dart';

class OrdersList {
  List<Item>? orders;

  OrdersList({this.orders});

  factory OrdersList.fromJson(Map<String, dynamic> json) => OrdersList(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
