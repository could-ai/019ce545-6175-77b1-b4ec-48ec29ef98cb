import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/tip.dart';
import '../widgets/skill_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();
  List<Tip> currentTips = [];
  String selectedCategory = 'All';
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

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        currentTips = List.from(Tip.sampleTips);
      } else {
        currentTips = Tip.sampleTips.where((tip) => tip.category == category).toList();
      }
      _swipeKey++; // Incrementing the key forces the swiper to reset with new data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Skill Booster'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white, fontSize: 14),
              underline: Container(), // Removes the default underline
              icon: const Icon(Icons.filter_list, color: Color(0xFF00FFFF)),
              items: ['All', 'AI Video Production', 'AI Content Writing', 'SEO/GEO Optimization', 'AI Image Design', 'Short-form Video Marketing']
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category,
                          style: TextStyle(
                            color: selectedCategory == category ? const Color(0xFF00FFFF) : Colors.white,
                            fontWeight: selectedCategory == category ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ))
                  .toList(),
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
                '💡 Daily AI Tip: ${dailyTip!.title}',
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
        tooltip: 'Shuffle Tips',
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}
