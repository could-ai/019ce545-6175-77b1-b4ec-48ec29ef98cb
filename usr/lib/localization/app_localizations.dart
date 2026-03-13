import 'dart:async';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Skill Booster',
      'home': 'Home',
      'search': 'Search',
      'favorites': 'Favorites',
      'searchTips': 'Search Tips',
      'searchPlaceholder': 'Search by title, description, or category',
      'noFavorites': 'No favorites yet. Heart some tips!',
      'dailyTip': '💡 Daily AI Tip: {tip}',
      'shuffleTips': 'Shuffle Tips',
      'all': 'All',
      'aiVideoProduction': 'AI Video Production',
      'aiContentWriting': 'AI Content Writing',
      'seoGeoOptimization': 'SEO/GEO Optimization',
      'aiImageDesign': 'AI Image Design',
      'shortFormVideoMarketing': 'Short-form Video Marketing',
      'tip1Title': 'Use AI for Automated Editing',
      'tip1Desc': 'Leverage tools like Runway ML to auto-generate video cuts and transitions from raw footage. Prompt: "Create a 30-second montage from this footage with dynamic transitions."',
      'tip2Title': 'Optimize Prompts for Clarity',
      'tip2Desc': 'When writing prompts, specify tone, length, and audience. Example: "Write a 500-word blog post on AI ethics in a conversational tone for tech beginners."',
      'tip3Title': 'Incorporate GEO Keywords',
      'tip3Desc': 'Use AI to identify generative engine keywords. Prompt ChatGPT: "Suggest 10 GEO-optimized keywords for a blog on sustainable fashion."',
      'tip4Title': 'Midjourney Composition Tips',
      'tip4Desc': 'For better results in Midjourney, use descriptive prompts with styles. Example: "/imagine prompt: A futuristic cityscape in cyberpunk style, high detail, neon lights --ar 16:9"',
      'tip5Title': 'Script Hooks with AI',
      'tip5Desc': 'Generate viral hooks using AI. Prompt: "Create 5 attention-grabbing hooks for a TikTok video on AI productivity hacks."',
      'english': 'English',
      'chinese': '中文',
    },
    'zh': {
      'appTitle': 'AI 技能提升器',
      'home': '首页',
      'search': '搜索',
      'favorites': '收藏',
      'searchTips': '搜索提示',
      'searchPlaceholder': '按标题、描述或类别搜索',
      'noFavorites': '还没有收藏。喜欢一些提示吧！',
      'dailyTip': '💡 每日 AI 提示: {tip}',
      'shuffleTips': '随机提示',
      'all': '全部',
      'aiVideoProduction': 'AI 视频制作',
      'aiContentWriting': 'AI 内容写作',
      'seoGeoOptimization': 'SEO/GEO 优化',
      'aiImageDesign': 'AI 图像设计',
      'shortFormVideoMarketing': '短视频营销',
      'tip1Title': '使用 AI 进行自动编辑',
      'tip1Desc': '利用 Runway ML 等工具从原始素材自动生成视频剪辑和转场。提示："使用动态转场从此素材创建一个30秒的蒙太奇。"',
      'tip2Title': '优化提示词以提高清晰度',
      'tip2Desc': '编写提示词时，指定语气、长度和受众。例如："以对话的语气为技术初学者写一篇关于AI伦理的500字博客文章。"',
      'tip3Title': '整合 GEO 关键字',
      'tip3Desc': '使用 AI 识别生成式引擎关键字。提示 ChatGPT："为关于可持续时尚的博客推荐10个经过GEO优化的关键字。"',
      'tip4Title': 'Midjourney 构图技巧',
      'tip4Desc': '为了在 Midjourney 中获得更好的结果，请使用带有样式的描述性提示词。例如："/imagine prompt: 赛博朋克风格的未来城市景观，高细节，霓虹灯 --ar 16:9"',
      'tip5Title': '使用 AI 制作脚本钩子',
      'tip5Desc': '使用 AI 生成病毒式钩子。提示："为关于AI生产力技巧的TikTok视频创建5个引人注目的钩子。"',
      'english': 'English',
      'chinese': '中文',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  String get appTitle => translate('appTitle');
  String get home => translate('home');
  String get search => translate('search');
  String get favorites => translate('favorites');
  String get searchTips => translate('searchTips');
  String get searchPlaceholder => translate('searchPlaceholder');
  String get noFavorites => translate('noFavorites');
  String dailyTip(String tip) => translate('dailyTip').replaceAll('{tip}', tip);
  String get shuffleTips => translate('shuffleTips');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
