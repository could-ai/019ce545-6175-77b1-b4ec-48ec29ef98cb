import 'package:flutter/material.dart';
import '../models/tip.dart';
import '../localization/app_localizations.dart';

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
          .where((tip) => tip.getTitle(context).toLowerCase().contains(query.toLowerCase()) ||
                          tip.getDescription(context).toLowerCase().contains(query.toLowerCase()) ||
                          tip.getCategory(context).toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.searchTips),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _search,
              decoration: InputDecoration(
                labelText: localizations.searchPlaceholder,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTips.length,
              itemBuilder: (context, index) {
                final tip = filteredTips[index];
                return ListTile(
                  title: Text(tip.getTitle(context), style: const TextStyle(color: Color(0xFF00FFFF))),
                  subtitle: Text('${tip.getCategory(context)}\n${tip.getDescription(context)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
