// import 'package:flutter/material.dart';
// import '../../../core/theme/app_colors.dart';
// import '../../../core/theme/app_text_styles.dart';
// import '../../../core/theme/app_dimensions.dart';
// import '../view_model/onboarding_view_model.dart';

// class OnboardingScreen extends ConsumerStatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _slideController, curve: Curves.elasticOut));

//     _fadeController.forward();
//     _slideController.forward();
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(onboardingProvider);
//     final viewModel = ref.read(onboardingProvider.notifier);

//     return Scaffold(
//       backgroundColor: AppColors.darkBackground,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildTopBar(state, viewModel),
//             _buildProgressIndicator(state),
//             Expanded(
//               child: PageView.builder(
//                 controller: state.pageController,
//                 onPageChanged: viewModel.onPageChanged,
//                 itemCount: OnboardingViewModel.slides.length,
//                 itemBuilder: (context, index) {
//                   return _buildSlide(OnboardingViewModel.slides[index], index, state);
//                 },
//               ),
//             ),
//             _buildBottomSection(state, viewModel),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTopBar(OnboardingState state, OnboardingViewModel viewModel) {
//     return Padding(
//       padding: const EdgeInsets.all(AppDimensions.paddingL),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           if (state.currentPage > 0)
//             GestureDetector(
//               onTap: viewModel.previousPage,
//               child: Container(
//                 padding: const EdgeInsets.all(AppDimensions.paddingS),
//                 decoration: BoxDecoration(
//                   color: AppColors.cardGray,
//                   borderRadius: BorderRadius.circular(AppDimensions.radiusM),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   color: AppColors.textWhite,
//                   size: AppDimensions.iconS,
//                 ),
//               ),
//             )
//           else
//             const SizedBox(width: 40),
//           Text(
//             "Fitness Tracker",
//             style: AppTextStyles.brand,
//           ),
//           if (!state.isLastPage)
//             GestureDetector(
//               onTap: viewModel.skipToEnd,
//               child: Text(
//                 "Skip",
//                 style: AppTextStyles.navigation,
//               ),
//             )
//           else
//             const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressIndicator(OnboardingState state) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
//       child: Row(
//         children: List.generate(
//           OnboardingViewModel.slides.length,
//           (index) => Expanded(
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: AppDimensions.animationNormal),
//               height: AppDimensions.progressIndicatorHeight,
//               margin: const EdgeInsets.symmetric(horizontal: AppDimensions.marginXS / 2),
//               decoration: BoxDecoration(
//                 color: index <= state.currentPage 
//                     ? AppColors.primaryNeon
//                     : AppColors.cardGray,
//                 borderRadius: BorderRadius.circular(AppDimensions.radiusXS / 2),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSlide(OnboardingSlide slide, int index, OnboardingState state) {
//     return AnimatedBuilder(
//       animation: _fadeAnimation,
//       builder: (context, child) {
//         return SlideTransition(
//           position: _slideAnimation,
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Padding(
//               padding: const EdgeInsets.all(AppDimensions.paddingL),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildIcon(slide),
//                   const SizedBox(height: AppDimensions.spaceXXL + AppDimensions.spaceS),
//                   _buildTitle(slide),
//                   const SizedBox(height: AppDimensions.spaceL),
//                   _buildDescription(slide),
//                   const SizedBox(height: AppDimensions.spaceXXL + AppDimensions.spaceS),
//                   _buildFeatures(slide),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   } OnboardingState state) {
//     return AnimatedBuilder(
//       animation: _fadeAnimation,
//       builder: (context, child) {
//         return SlideTransition(
//           position: _slideAnimation,
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildIcon(slide),
//                   const SizedBox(height: 40),
//                   _buildTitle(slide),
//                   const SizedBox(height: 20),
//                   _buildDescription(slide),
//                   const SizedBox(height: 40),
//                   _buildFeatures(slide),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildIcon(OnboardingSlide slide) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.0, end: 1.0),
//       duration: Duration(milliseconds: AppDimensions.animationVerySlow),
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: Container(
//             width: AppDimensions.onboardingIconSize,
//             height: AppDimensions.onboardingIconSize,
//             decoration: BoxDecoration(
//               color: AppColors.cardGray,
//               borderRadius: BorderRadius.circular(AppDimensions.onboardingIconRadius),
//               boxShadow: [
//                 BoxShadow(
//                   color: slide.iconColor.withOpacity(0.3),
//                   blurRadius: 20,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//             child: Icon(
//               slide.icon,
//               size: AppDimensions.iconXXL - AppDimensions.iconXS,
//               color: slide.iconColor,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTitle(OnboardingSlide slide) {
//     return Column(
//       children: [
//         Text(
//           slide.title,
//           style: AppTextStyles.onboardingTitle,
//           textAlign: TextAlign.center,
//         ),
//         Text(
//           slide.subtitle,
//           style: AppTextStyles.onboardingTitleBold,
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildDescription(OnboardingSlide slide) {
//     return Text(
//       slide.description,
//       style: AppTextStyles.onboardingDescription,
//       textAlign: TextAlign.center,
//     );
//   }

//   Widget _buildFeatures(OnboardingSlide slide) {
//     return Column(
//       children: slide.features.map((feature) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingS),
//           child: Row(
//             children: [
//               Container(
//                 width: AppDimensions.dotIndicatorSize,
//                 height: AppDimensions.dotIndicatorSize,
//                 decoration: BoxDecoration(
//                   color: AppColors.accentGreen,
//                   borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
//                 ),
//               ),
//               const SizedBox(width: AppDimensions.spaceM),
//               Text(
//                 feature,
//                 style: AppTextStyles.onboardingFeature,
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildBottomSection(OnboardingState state, OnboardingViewModel viewModel) {
//     return Padding(
//       padding: const EdgeInsets.all(AppDimensions.paddingL),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               OnboardingViewModel.slides.length,
//               (index) => AnimatedContainer(
//                 duration: Duration(milliseconds: AppDimensions.animationNormal),
//                 width: index == state.currentPage ? AppDimensions.dotIndicatorActiveWidth : AppDimensions.dotIndicatorSize,
//                 height: AppDimensions.dotIndicatorSize,
//                 margin: const EdgeInsets.symmetric(horizontal: AppDimensions.marginXS),
//                 decoration: BoxDecoration(
//                   color: index == state.currentPage
//                       ? AppColors.primaryNeon
//                       : AppColors.cardGray,
//                   borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: AppDimensions.spaceXL - AppDimensions.spaceXS),
//           SizedBox(
//             width: double.infinity,
//             height: AppDimensions.buttonHeightLarge,
//             child: ElevatedButton(
//               onPressed: state.isLastPage ? viewModel.navigateToAuth : viewModel.nextPage,
//               child: Text(
//                 state.isLastPage ? "Get Started" : "Continue",
//                 style: AppTextStyles.buttonLarge,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }