import 'package:equatable/equatable.dart';

enum GroceryCategory {
  fruit,
  vegetable,
  other,
}

class GroceryItem extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final GroceryCategory category;
  final double price; // Adding price for realism, though maybe not strictly needed
  final String description;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    this.price = 0.0,
    this.description = '',
  });

  @override
  List<Object> get props => [id, name, imageUrl, category, price, description];
}
