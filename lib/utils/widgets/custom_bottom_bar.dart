import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/screens/cart_screen.dart';
import 'package:white_matrix_ecommerce/screens/explore.dart';
import 'package:white_matrix_ecommerce/screens/settings.dart';
import 'package:white_matrix_ecommerce/screens/store.dart';
import 'package:white_matrix_ecommerce/utils/widgets/exit_alert.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  var _currentIndex = 0;
  late PageController _pageController = PageController();
  bool isLoading = false;
  List<String> assignedDesignerList = [];

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool val) {
          if (val) {
            return;
          }
          showDialog(
            barrierColor: Colors.black.withOpacity(0.8),
            context: context,
            builder: (context) => const ExitAlert(),
          );
        },
        child: SafeArea(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: PageView(
                    controller: _pageController,
                    pageSnapping: true,
                    children: [
                      const ExplorePage(),
                      ScreenStore(),
                      CartPage(),
                      SettingsPage()
                    ],
                    onPageChanged: (i) => setState(() => _currentIndex = i),
                  ),
                ),
        ),
      ),
      bottomNavigationBar: AdvancedSalomonBottomBar(
        unselectedItemColor: Colors.grey[600],
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
            _pageController.animateToPage(i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          });
        },
        items: [
          AdvancedSalomonBottomBarItem(
            icon: Image.asset(
              "assets/icons/explore.png",
              height: 20,
              width: 20,
              color: Colors.white,
            ),
            title: const Text("Explore"),
            selectedColor: Colors.white,
          ),
          AdvancedSalomonBottomBarItem(
            icon: Image.asset(
              "assets/icons/store.png",
              height: 20,
              width: 20,
              color: Colors.white,
            ),
            title: const Text("Store"),
            selectedColor: Colors.white,
          ),
          AdvancedSalomonBottomBarItem(
            icon: Image.asset(
              "assets/icons/cart.png",
              height: 20,
              width: 20,
              color: Colors.white,
            ),
            title: const Text("Cart"),
            selectedColor: Colors.white,
          ),
          AdvancedSalomonBottomBarItem(
            icon: Image.asset(
              "assets/icons/settings.png",
              height: 20,
              width: 20,
              color: Colors.white,
            ),
            title: const Text("Settings"),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
