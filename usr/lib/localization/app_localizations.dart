import 'dart:async';

import 'package:flutter/material.dart';

class AppLocalizations {
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
      'tip1Desc': '利用 Runway ML 等工具从原始素材自动生成视频剪辑和转场。提示：