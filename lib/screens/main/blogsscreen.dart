import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/blogs_component.dart';
import 'package:admin/screens/dashboard/components/tutorial_video_component.dart';
import 'package:admin/screens/dashboard/components/tutorials_component.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/price/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: BlogsComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
