import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/bloc/grocery_bloc.dart';
import 'package:grocery_list/bloc/grocery_event.dart';
import 'package:grocery_list/bloc/grocery_state.dart';
import 'package:grocery_list/widgets/grocery_item_card.dart';

import 'package:flutter/services.dart';
import 'package:grocery_list/screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<GroceryBloc>().add(LoadGroceries());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          tooltip: 'Exit App',
          onPressed: () => SystemNavigator.pop(),
        ),
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(icon: Icon(Icons.list), text: 'My List'),
            Tab(icon: Icon(Icons.store), text: 'Catalog'),
          ],
        ),
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state.status == GroceryStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == GroceryStatus.failure) {
            return const Center(child: Text('Failed to load groceries'));
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildCartList(state),
              _buildCatalogList(state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartList(GroceryState state) {
    if (state.cartItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Your list is empty!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey),
            ),
             const SizedBox(height: 8),
            Text('Go to Catalog to add items.', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final item = state.cartItems[index];
              return GroceryItemCard(
                item: item,
                isInCart: true,
                onToggle: () {
                  context.read<GroceryBloc>().add(RemoveItem(item));
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCatalogList(GroceryState state) {
    return ListView.builder(
      itemCount: state.catalog.length,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      itemBuilder: (context, index) {
        final item = state.catalog[index];
        final isInCart = state.cartItems.contains(item);
        return GroceryItemCard(
          item: item,
          isInCart: isInCart,
          onToggle: () {
            if (isInCart) {
              context.read<GroceryBloc>().add(RemoveItem(item));
            } else {
              context.read<GroceryBloc>().add(AddItem(item));
            }
          },
        );
      },
    );
  }
}
