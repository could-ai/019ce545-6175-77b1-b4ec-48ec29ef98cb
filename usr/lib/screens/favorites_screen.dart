import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/skill_card.dart';
import '../localization/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.favorites),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(localizations.noFavorites, style: const TextStyle(color: Colors.white70)),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return SkillCard(tip: favorites[index], showHeart: false);
              },
            ),
    );
  }
}
