import 'package:equatable/equatable.dart';
import 'package:grocery_list/models/grocery_item.dart';

abstract class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class LoadGroceries extends GroceryEvent {}

class AddItem extends GroceryEvent {
  final GroceryItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItem extends GroceryEvent {
  final GroceryItem item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleItem extends GroceryEvent {
    final GroceryItem item;

    const ToggleItem(this.item);

    @override
    List<Object> get props => [item];
}
