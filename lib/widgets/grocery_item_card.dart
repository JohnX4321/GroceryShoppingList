import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:grocery_list/widgets/image_detail_screen.dart';

class GroceryItemCard extends StatelessWidget {
  final GroceryItem item;
  final bool isInCart;
  final VoidCallback onToggle;

  const GroceryItemCard({
    Key? key,
    required this.item,
    required this.isInCart,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ImageDetailScreen(
                  imageUrl: item.imageUrl,
                  heroTag: item.id,
                ),
              ),
            );
          },
          child: Hero(
            tag: item.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                memCacheWidth: 200, // Optimize memory usage
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          item.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  item.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
            ]
        ),
        trailing: IconButton(
          icon: Icon(
            isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
            color: isInCart ? Colors.green : Colors.grey,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}
