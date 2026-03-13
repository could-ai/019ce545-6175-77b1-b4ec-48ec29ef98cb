import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/tip.dart';
import '../widgets/skill_card.dart';
import '../localization/app_localizations.dart';
import '../providers/locale_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();
  List<Tip> currentTips = [];
  String selectedCategoryKey = 'all';
  Tip? dailyTip;
  
  // We use a key to force the CardSwiper to rebuild when the list changes
  int _swipeKey = 0;

  @override
  void initState() {
    super.initState();
    currentTips = List.from(Tip.sampleTips);
    dailyTip = currentTips[DateTime.now().day % currentTips.length];
  }

  void _refreshTips() {
    setState(() {
      currentTips.shuffle();
      _swipeKey++; // Incrementing the key forces the swiper to reset
    });
  }

  void _filterByCategory(String categoryKey) {
    setState(() {
      selectedCategoryKey = categoryKey;
      if (categoryKey == 'all') {
        currentTips = List.from(Tip.sampleTips);
      } else {
        currentTips = Tip.sampleTips.where((tip) => tip.categoryKey == categoryKey).toList();
      }
      _swipeKey++; // Incrementing the key forces the swiper to reset with new data
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        actions: [
          // Language Switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<Locale>(
              value: Provider.of<LocaleProvider>(context).locale,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white, fontSize: 14),
              underline: Container(),
              icon: const Icon(Icons.language, color: Color(0xFF00FFFF)),
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('zh'),
                  child: Text('中文'),
                ),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: selectedCategoryKey,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white, fontSize: 14),
              underline: Container(), // Removes the default underline
              icon: const Icon(Icons.filter_list, color: Color(0xFF00FFFF)),
              items: [
                'all',
                'aiVideoProduction',
                'aiContentWriting',
                'seoGeoOptimization',
                'aiImageDesign',
                'shortFormVideoMarketing',
              ].map((key) => DropdownMenuItem(
                    value: key,
                    child: Text(
                      localizations.translate(key),
                      style: TextStyle(
                        color: selectedCategoryKey == key ? const Color(0xFF00FFFF) : Colors.white,
                        fontWeight: selectedCategoryKey == key ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  )).toList(),
              onChanged: (value) {
                if (value != null) _filterByCategory(value);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (dailyTip != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF00FFFF).withOpacity(0.1),
              child: Text(
                localizations.dailyTip(dailyTip!.getTitle(context)),
                style: const TextStyle(color: Color(0xFF00FFFF), fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: currentTips.isEmpty
                ? const Center(
                    child: Text(
                      'No tips found for this category.',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  )
                : CardSwiper(
                    key: ValueKey(_swipeKey), // Forces widget rebuild on data change
                    controller: controller,
                    cardsCount: currentTips.length,
                    // Prevent errors if there's only 1 card in the filtered list
                    numberOfCardsDisplayed: currentTips.length == 1 ? 1 : 2,
                    isLoop: currentTips.length > 1, // Loop cards if there are multiple
                    onSwipe: (previousIndex, currentIndex, direction) {
                      return true;
                    },
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) => 
                        SkillCard(tip: currentTips[index]),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshTips,
        tooltip: localizations.shuffleTips,
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}
