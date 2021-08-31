import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Cart'),
          actions: [
            IconButton(onPressed: model.signOut, icon: Icon(Icons.logout)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedFontSize: 16,
          unselectedFontSize: 12,
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smartphone),
              label: 'Mobile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.devices_other),
              label: 'AC',
            ),
          ],
          onTap: model.setIndex,
        ),
        body: getViewForIndex(model.currentIndex),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 1:
        return Text('Mobile');
      case 2:
        return Text('AC');
      default:
        return Text('Cart');
    }
  }
}
