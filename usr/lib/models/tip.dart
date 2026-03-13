class Tip {
  final String id;
  final String category;
  final String title;
  final String description;

  Tip({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
  });

  // Sample data for demonstration
  static List<Tip> sampleTips = [
    Tip(
      id: '1',
      category: 'AI Video Production',
      title: 'Use AI for Automated Editing',
      description: 'Leverage tools like Runway ML to auto-generate video cuts and transitions from raw footage. Prompt: "Create a 30-second montage from this footage with dynamic transitions."',
    ),
    Tip(
      id: '2',
      category: 'AI Content Writing',
      title: 'Optimize Prompts for Clarity',
      description: 'When writing prompts, specify tone, length, and audience. Example: "Write a 500-word blog post on AI ethics in a conversational tone for tech beginners."',
    ),
    Tip(
      id: '3',
      category: 'SEO/GEO Optimization',
      title: 'Incorporate GEO Keywords',
      description: 'Use AI to identify generative engine keywords. Prompt ChatGPT: "Suggest 10 GEO-optimized keywords for a blog on sustainable fashion."',
    ),
    Tip(
      id: '4',
      category: 'AI Image Design',
      title: 'Midjourney Composition Tips',
      description: 'For better results in Midjourney, use descriptive prompts with styles. Example: "/imagine prompt: A futuristic cityscape in cyberpunk style, high detail, neon lights --ar 16:9"',
    ),
    Tip(
      id: '5',
      category: 'Short-form Video Marketing',
      title: 'Script Hooks with AI',
      description: 'Generate viral hooks using AI. Prompt: "Create 5 attention-grabbing hooks for a TikTok video on AI productivity hacks."',
    ),
  ];
}