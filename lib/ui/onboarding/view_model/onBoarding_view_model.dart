import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import "../../../core/theme/app_colors.dart";

class OnboardingState {
  final int currentPage;
  final PageController pageController;
  final bool isLastPage;
  final double animationProgress;

  OnboardingState({
    required this.currentPage,
    required this.pageController,
    required this.isLastPage,
    required this.animationProgress,
  });

  OnboardingState copyWith({
    int? currentPage,
    PageController? pageController,
    bool? isLastPage,
    double? animationProgress,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      pageController: pageController ?? this.pageController,
      isLastPage: isLastPage ?? this.isLastPage,
      animationProgress: animationProgress ?? this.animationProgress,
    );
  }
}

class OnboardingSlide {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color iconColor;
  final List<String> features;

  OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.features,
  });
}

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  OnboardingViewModel()
    : super(
        OnboardingState(
          currentPage: 0,
          pageController: PageController(),
          isLastPage: false,
          animationProgress: 0.0,
        ),
      );

  static final List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: "Track Your",
      subtitle: "Fitness Journey",
      description:
          "Monitor your daily activities, workouts, and progress with our comprehensive fitness tracking system.",
      icon: Icons.fitness_center,
      iconColor: AppColors.primaryNeon,
      features: [
        "Daily workout tracking",
        "Calorie monitoring",
        "Progress visualization",
      ],
    ),
    OnboardingSlide(
      title: "Achieve Your",
      subtitle: "Goals Faster",
      description:
          "Set personalized fitness goals and get insights to help you stay motivated and reach your targets.",
      icon: Icons.track_changes,
      iconColor: AppColors.accentGreen,
      features: ["Personalized goals", "Smart insights", "Achievement rewards"],
    ),
    OnboardingSlide(
      title: "Stay Motivated",
      subtitle: "Every Day",
      description:
          "Join a community of fitness enthusiasts and keep yourself motivated with challenges and achievements.",
      icon: Icons.emoji_events,
      iconColor: AppColors.primaryNeon,
      features: [
        "Community challenges",
        "Achievement badges",
        "Progress sharing",
      ],
    ),
  ];

  void onPageChanged(int page) {
    state = state.copyWith(
      currentPage: page,
      isLastPage: page == slides.length - 1,
      animationProgress: page / (slides.length - 1),
    );
  }

  void nextPage() {
    if (state.currentPage < slides.length - 1) {
      state.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      state.pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToEnd() {
    state.pageController.animateToPage(
      slides.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void navigateToAuth() {
    // TODO: Navigate to auth screen
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AuthScreen()));
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingViewModel, OnboardingState>((ref) {
      return OnboardingViewModel();
    });
