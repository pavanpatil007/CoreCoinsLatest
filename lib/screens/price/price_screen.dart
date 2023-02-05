import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/all_coins_component.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/topten.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:provider/provider.dart';

import '../dashboard/components/header.dart';
import '../dashboard/components/storage_details.dart';


class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Header(title: "All Coins List",),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(height: defaultPadding),
                          AllCoinsComponent(),
                          // if (Responsive.isMobile(context))
                          //   SizedBox(height: defaultPadding),
                          // if (Responsive.isMobile(context)) StarageDetails(),
                        ],
                      ),
                    ),
                    // if (!Responsive.isMobile(context))
                    //   SizedBox(width: defaultPadding),
                    // // On Mobile means if the screen is less than 850 we dont want to show it
                    // if (!Responsive.isMobile(context))
                    //   Expanded(
                    //     flex: 2,
                    //     child: StarageDetails(),
                    //   ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
