import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tip.dart';
import '../providers/favorites_provider.dart';
import '../localization/app_localizations.dart';

class SkillCard extends StatelessWidget {
  final Tip tip;
  final bool showHeart;

  const SkillCard({super.key, required this.tip, this.showHeart = true);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(tip);

    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        child: [
            Text(
              tip.getCategory(context),
              style: const TextStyle(color: Color(0xFF9D4EDD), fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              tip.getTitle(context),
              style: const TextStyle(color: Color(0xFF00FFFF), fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              tip.getDescription(context),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            if (showHeart) ...[
              const SizedBox(height: 20),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white70,
                ),
                onPressed: () {
                  if (isFavorite) {
                    favoritesProvider.removeFavorite(tip);
                  } else {
                    favoritesProvider.addFavorite(tip);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
