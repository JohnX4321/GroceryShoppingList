import 'package:equatable/equatable.dart';
import 'package:grocery_list/models/grocery_item.dart';

enum GroceryStatus { initial, loading, success, failure }

class GroceryState extends Equatable {
  final GroceryStatus status;
  final List<GroceryItem> catalog; // All available items
  final List<GroceryItem> cartItems; // Items added to the list

  const GroceryState({
    this.status = GroceryStatus.initial,
    this.catalog = const [],
    this.cartItems = const [],
  });

  GroceryState copyWith({
    GroceryStatus? status,
    List<GroceryItem>? catalog,
    List<GroceryItem>? cartItems,
  }) {
    return GroceryState(
      status: status ?? this.status,
      catalog: catalog ?? this.catalog,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object> get props => [status, catalog, cartItems];
}
