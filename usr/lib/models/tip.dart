import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

class Tip {
  final String id;
  final String categoryKey;
  final String titleKey;
  final String descriptionKey;

  Tip({
    required this.id,
    required this.categoryKey,
    required this.titleKey,
    required this.descriptionKey,
  });

  String getCategory(BuildContext context) {
    return AppLocalizations.of(context)?.translate(categoryKey) ?? categoryKey;
  }

  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)?.translate(titleKey) ?? titleKey;
  }

  String getDescription(BuildContext context) {
    return AppLocalizations.of(context)?.translate(descriptionKey) ?? descriptionKey;
  }

  // Sample data for demonstration
  static List<Tip> sampleTips = [
    Tip(
      id: '1',
      categoryKey: 'aiVideoProduction',
      titleKey: 'tip1Title',
      descriptionKey: 'tip1Desc',
    ),
    Tip(
      id: '2',
      categoryKey: 'aiContentWriting',
      titleKey: 'tip2Title',
      descriptionKey: 'tip2Desc',
    ),
    Tip(
      id: '3',
      categoryKey: 'seoGeoOptimization',
      titleKey: 'tip3Title',
      descriptionKey: 'tip3Desc',
    ),
    Tip(
      id: '4',
      categoryKey: 'aiImageDesign',
      titleKey: 'tip4Title',
      descriptionKey: 'tip4Desc',
    ),
    Tip(
      id: '5',
      categoryKey: 'shortFormVideoMarketing',
      titleKey: 'tip5Title',
      descriptionKey: 'tip5Desc',
    ),
  ];
}
