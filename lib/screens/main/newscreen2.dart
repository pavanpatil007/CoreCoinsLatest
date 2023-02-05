

import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/form_component.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class NewScreen2 extends StatefulWidget {
  const NewScreen2({Key? key}) : super(key: key);

  @override
  State<NewScreen2> createState() => _NewScreen2State();
}

class _NewScreen2State extends State<NewScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Header(title: "Demo Screen",),
            SizedBox(height: defaultPadding,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(),
                  ),

                if(Responsive.isDesktop(context))
                  Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 10,
                      child: FormComponent(),
                    ),
                  ),
                ),

                 if(Responsive.isMobile(context))
                   Expanded(child:
                   Column(
                     children: [
                       Card(
                         elevation: 10,
                         child: FormComponent(),
                       ),


                     ],
                   )
                   )




              ],
            ),
          ],
        ),
      ),
    );
  }
}
