import 'package:flutter/material.dart';
import '../models/tip.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<Tip> filteredTips = Tip.sampleTips;

  void _search(String value) {
    setState(() {
      query = value;
      filteredTips = Tip.sampleTips
          .where((tip) => tip.title.toLowerCase().contains(query.toLowerCase()) ||
                          tip.description.toLowerCase().contains(query.toLowerCase()) ||
                          tip.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Tips'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _search,
              decoration: const InputDecoration(
                labelText: 'Search by title, description, or category',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTips.length,
              itemBuilder: (context, index) {
                final tip = filteredTips[index];
                return ListTile(
                  title: Text(tip.title, style: const TextStyle(color: Color(0xFF00FFFF))),
                  subtitle: Text('${tip.category}\n${tip.description}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}