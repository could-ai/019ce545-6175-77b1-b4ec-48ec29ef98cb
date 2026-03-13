import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/tip.dart';
import '../providers/favorites_provider.dart';
import '../widgets/skill_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();
  List<Tip> currentTips = Tip.sampleTips;
  String selectedCategory = 'All';
  Tip? dailyTip;

  @override
  void initState() {
    super.initState();
    dailyTip = currentTips[DateTime.now().day % currentTips.length]; // Simple daily tip logic
  }

  void _refreshTips() {
    setState(() {
      currentTips = List.from(Tip.sampleTips)..shuffle();
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        currentTips = Tip.sampleTips;
      } else {
        currentTips = Tip.sampleTips.where((tip) => tip.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Skill Booster'),
        actions: [
          DropdownButton<String>(
            value: selectedCategory,
            dropdownColor: const Color(0xFF1E1E1E),
            items: ['All', 'AI Video Production', 'AI Content Writing', 'SEO/GEO Optimization', 'AI Image Design', 'Short-form Video Marketing']
                .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                .toList(),
            onChanged: (value) => _filterByCategory(value!),
          ),
        ],
      ),
      body: Column(
        children: [
          if (dailyTip != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF00FFFF).withOpacity(0.1),
              child: Text(
                'Daily AI Tip: ${dailyTip!.title}',
                style: const TextStyle(color: Color(0xFF00FFFF), fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: CardSwiper(
              controller: controller,
              cardsCount: currentTips.length,
              onSwipe: (previousIndex, currentIndex, direction) {
                // Refresh logic on swipe
                if (currentIndex == currentTips.length - 1) {
                  _refreshTips();
                }
                return true;
              },
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => SkillCard(tip: currentTips[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshTips,
        tooltip: 'Refresh Tips',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}