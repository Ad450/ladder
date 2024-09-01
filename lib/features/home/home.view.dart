import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:ladder/features/dashboard/dashboard.view.dart';
import 'package:ladder/features/expenses/expenses.view.dart';
import 'package:ladder/features/settings/settings.view.dart';
import 'package:ladder/gen/colors.gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(_interceptLeavingNonFeedScreen);
  }

  bool _interceptLeavingNonFeedScreen(bool stopDefaultButtonEvent, RouteInfo info) {
    if (stopDefaultButtonEvent) return true;
    if (currentIndex != 0) {
      setState(() {
        currentIndex = 0;
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [DashboardView(), ExpensesView(), SettingsView()][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorName.onboardingBackground,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: currentIndex == 0 ? ColorName.primary : ColorName.primary.withOpacity(0.4),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.graphic_eq,
              color: currentIndex == 1 ? ColorName.primary : ColorName.primary.withOpacity(0.4),
            ),
            label: "Expenses",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: currentIndex == 2 ? ColorName.primary : ColorName.primary.withOpacity(0.4),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
