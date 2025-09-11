import 'package:butter/view/screens/account_screen/account_screen.dart';
import 'package:butter/view/screens/activity_screen/activity_screen.dart';
import 'package:butter/view/screens/launch/splash_screen.dart';
import 'package:butter/view/screens/list/list_screen.dart';
import 'package:butter/view/screens/main/main.dart';
import 'package:butter/view/screens/marge_screens/marge_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_create_screen.dart';
import 'package:butter/view/screens/onboarding/onboarding_household_join_screen.dart'
    show OnboardingHouseholdJoinScreen;
import 'package:butter/view/screens/onboarding/onboarding_success_screen.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes_name.dart';
import '../../view/screens/categories_screen/categories_screen.dart';
import '../../view/screens/house_hold_screen/house_hold_screen.dart';
import '../../view/screens/launch/select_login_screen.dart';
import '../../view/screens/onboarding/add_tap_and_speak_screen.dart';
import '../../view/screens/onboarding/add_voice_confirm_screen.dart';
import '../../view/screens/onboarding/join_via_deep_link.dart';
import '../../view/screens/onboarding/onboarding_exist_house_hold_success_screen.dart';
import '../../view/screens/onboarding/onboarding_name_screen.dart';
import 'package:get/get.dart';
import '../../view/screens/onboarding/onboarding_household_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RouteName.signUpInScreen,
      page: () => const SelectLoginScreen(),
    ),
    GetPage(
      name: RouteName.onboardingNameScreen,
      page: () => OnboardingNameScreen(),
    ),
    GetPage(
      name: RouteName.onboardingHouseholdScreen,
      page: () => const OnboardingHouseholdScreen(),
    ),
    GetPage(
      name: RouteName.onboardingCreateScreen,
      page: () => OnboardingCreateScreen(),
    ),
    GetPage(
      name: RouteName.onboardingSuccessScreen,
      page: () => const OnboardingSuccessScreen(),
    ),
    GetPage(
      name: RouteName.onboardingAddScreen,
      page: () => const AddTapAndSpeakScreen(),
    ),
    GetPage(
      name: RouteName.onboardingAddVoiceConfirmScreen,
      page: () => const AddVoiceConfirmScreen(),
    ),
    GetPage(
      name: RouteName.onboardingHouseholdJoinScreen,
      page: () => OnboardingHouseholdJoinScreen(),
    ),
    GetPage(
      name: RouteName.onboardingExistHouseHoldSuccessScreen,
      page: () => const OnboardingExistHouseHoldSuccessScreen(),
    ),

    GetPage(
      name: RouteName.joinViaDeepLink,
      page: () => const JoinViaDeepLink(),
    ),

    GetPage(name: RouteName.main, page: () => const Main()),
    GetPage(name: RouteName.margeScreen, page: () => const MargeScreen()),

    GetPage(name: RouteName.activityScreen, page: () => const ActivityScreen()),

    GetPage(name: RouteName.accountScreen, page: () => const AccountScreen()),
    GetPage(
      name: RouteName.categoriesScreen,
      page: () => const CategoriesScreen(),
    ),
    GetPage(
      name: RouteName.houseHoldScreen,
      page: () => const HouseHoldScreen(),
    ),
  ];
}
