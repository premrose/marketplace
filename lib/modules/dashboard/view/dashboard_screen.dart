import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/modules/dashboard/view/dashboard_page.dart';
import 'package:marketplace/widgets/custom_image.dart';

import '../../../widgets/common_widgets.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final screens = [
    const SizedBox(),
    const DashboardPage(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentIndex = context.read<DashboardBloc>().state.currentIndex;
        if (currentIndex != 0) {
          context
              .read<DashboardBloc>()
              .add(const DashboardNavigationChanged(0));
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFF7304),
                  Color(0xFFFB2A77),
                ],
              ),
            ),
          ),
          title: const Text(
            "Marketplace",
            style: TextStyle(color: Colors.white),
          ),
          leadingWidth: 100,
          actions: [
            IconButton(
                onPressed: () {
                  CommonWidgets.showToast("Hamburger button is clicked");
                },
                icon: const CustomImage(
                    imagePath: "assets/hamburger_menu.svg",
                    color: Colors.white))
          ],
        ),
        body: screens[context.watch<DashboardBloc>().state.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 1,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF1F1F1F),
            onTap: (index) {
              context
                  .read<DashboardBloc>()
                  .add(DashboardNavigationChanged(index));
              if (index == 1) {
                context
                    .read<DashboardBloc>()
                    .add(const FetchPostDataEvent(pageNumber: "0"));
              }
            },
            currentIndex: context.watch<DashboardBloc>().state.currentIndex,
            items: [
              const BottomNavigationBarItem(
                label: 'Explore',
                icon: CustomImage(
                    imagePath: "assets/explore.svg", color: Colors.white),
                activeIcon: CustomImage(
                    imagePath: "assets/explore.svg", color: Color(0xFFFE4545)),
              ),
              BottomNavigationBarItem(
                label: 'Marketplace',
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CustomImage(
                        imagePath: "assets/marketplace.svg",
                        color: Colors.white),
                    newBadge()
                  ],
                ),
                activeIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CustomImage(
                        imagePath: "assets/marketplace.svg",
                        color: Colors.white),
                    newBadge()
                  ],
                ),
              ),
              const BottomNavigationBarItem(
                label: 'Search',
                icon: CustomImage(
                    imagePath: "assets/search.svg", color: Colors.white),
                activeIcon: CustomImage(
                    imagePath: "assets/search.svg", color: Color(0xFFFE4545)),
              ),
              const BottomNavigationBarItem(
                label: 'Activity',
                icon: CustomImage(
                    imagePath: "assets/activity.svg", color: Colors.white),
                activeIcon: CustomImage(
                    imagePath: "assets/activity.svg", color: Color(0xFFFE4545)),
              ),
              const BottomNavigationBarItem(
                label: 'Profile',
                icon: CustomImage(
                    imagePath: "assets/profile.svg", color: Colors.white),
                activeIcon: CustomImage(
                    imagePath: "assets/profile.svg", color: Color(0xFFFE4545)),
              ),
            ]),
        floatingActionButton: SizedBox(
          width: 160,
          child: CommonWidgets.commonButton(
              buttonName: "Post Request",
              buttonColor: const Color(0xFFFE4545),
              isFromDashboard: true,
              iconWidget: const CustomImage(
                  imagePath: "assets/add.svg", color: Colors.white)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Positioned newBadge() {
    return Positioned(
      top: -5,
      left: 15,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 14,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'NEW',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                height: 1.6,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
