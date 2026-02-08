import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Icon(Icons.shopping_basket, size: 80, color: Colors.green),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Grocery List',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Center(child: Text('Version 2.0.0')),
          const SizedBox(height: 32),
          const Text(
            'Attributions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _buildAttributionTile(
            context,
            'Upgraded By',
            'AntiGravity on Gemini 3 Pro',
          ),
          _buildAttributionTile(
            context,
            'Flutter',
            'Google\'s UI toolkit for building beautiful, natively compiled applications.',
          ),
          _buildAttributionTile(
            context,
            'Flutter Bloc',
            'State management library that helps separate presentation from business logic.',
          ),
          _buildAttributionTile(
            context,
            'Google Fonts',
            'Library of free open source fonts.',
          ),
          _buildAttributionTile(
            context,
            'Cached Network Image',
            'Flutter library to load and cache network images.',
          ),
          _buildAttributionTile(
            context,
            'Images',
            'All product images are sourced from Wikimedia Commons and are either Public Domain or licensed under Creative Commons.',
          ),
        ],
      ),
    );
  }

  Widget _buildAttributionTile(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
