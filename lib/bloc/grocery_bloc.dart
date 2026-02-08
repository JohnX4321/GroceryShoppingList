import 'package:bloc/bloc.dart';
import 'package:grocery_list/data/grocery_data.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'grocery_event.dart';
import 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(const GroceryState()) {
    on<LoadGroceries>(_onLoadGroceries);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
  }

  void _onLoadGroceries(LoadGroceries event, Emitter<GroceryState> emit) async {
    emit(state.copyWith(status: GroceryStatus.loading));
    try {
      // Simulating a short delay for "loading" effect
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(
        status: GroceryStatus.success,
        catalog: GroceryData.groceryItems,
        cartItems: [],
      ));
    } catch (_) {
      emit(state.copyWith(status: GroceryStatus.failure));
    }
  }

  void _onAddItem(AddItem event, Emitter<GroceryState> emit) {
    final updatedCart = List<GroceryItem>.from(state.cartItems)..add(event.item);
    emit(state.copyWith(
      cartItems: updatedCart,
    ));
  }

  void _onRemoveItem(RemoveItem event, Emitter<GroceryState> emit) {
    final updatedCart = List<GroceryItem>.from(state.cartItems)..remove(event.item);
    emit(state.copyWith(
      cartItems: updatedCart,
    ));
  }
}
