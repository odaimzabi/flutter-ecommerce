import 'package:app/colors/colors.dart';
import 'package:app/controllers/auth_controller.dart';
import 'package:app/screens/cart_checkout_page.dart';
import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomePage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _navigatorValue = 0;

          break;
        }
      case 1:
        {
          _navigatorValue = 1;

          break;
        }
      case 2:
        {
          _navigatorValue = 2;

          break;
        }
    }
    update();
  }
}

final screens = [HomePage(), CartCheckoutPage()];

class MainScreen extends StatelessWidget {
  MainScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            AuthViewModel.to.signOut();
          },
        )),
        body: IndexedStack(
          index: controller._navigatorValue,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          items: [
            const BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.home, size: 30, color: primaryColor),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.home, size: 30),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.shopping_cart, color: primaryColor, size: 30),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.shopping_cart, size: 30),
              ),
            ),
            const BottomNavigationBarItem(
              label: '',
              activeIcon: const Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: const Icon(Icons.person, color: primaryColor, size: 30),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: const Icon(Icons.person, size: 30),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(
        enableFeedback: true,
        items: [
          const BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.search, color: primaryColor),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.search),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Icon(Icons.shopping_basket, color: primaryColor),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.shopping_basket),
              )),
          const BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: const Icon(Icons.person, color: primaryColor),
              ),
              icon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Icon(Icons.person))),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
