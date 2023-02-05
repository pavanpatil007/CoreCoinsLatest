import 'package:admin/screens/dashboard/dashboard_new.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/blogsscreen.dart';
import 'package:admin/screens/main/contactscreen.dart';
import 'package:admin/screens/main/feedbackscreen.dart';
import 'package:admin/screens/main/help_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/main/main_screen2.dart';
import 'package:admin/screens/main/newscreen2.dart';
import 'package:admin/screens/main/price_main.dart';
import 'package:admin/screens/main/tutorialsscreen.dart';
import 'package:admin/screens/newscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key,}) : super(key: key);


    @override
    State<SideMenu> createState() => SideMenuState();
  }
  class SideMenuState extends State<SideMenu> {
    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: Material(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/CC-2.png"),
              ),
              DrawerListTile(
                title: "Dashboard",
                svgSrc: "assets/icons/menu_dashbord.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );

                },
              ),
              DrawerListTile(
                title: "Price",
                svgSrc: "assets/icons/menu_tran.svg",
                press: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PriceMainScreen(),
                    ),
                  );

                },
              ),
              DrawerListTile(
                title: "Blogs",
                svgSrc: "assets/icons/menu_task.svg",
                press: () {

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => BlogsScreen(),
                  //   ),
                  // );

                },
              ),
              DrawerListTile(
                title: "Tutorials",
                svgSrc: "assets/icons/menu_doc.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorialsScreen(),
                    ),
                  );


                },
              ),

              Divider(thickness: 2,color: Colors.white,),
              DrawerListTile(
                title: "Feedback",
                svgSrc: "assets/icons/menu_store.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackScreen(),
                    ),
                  );


                },
              ),
              DrawerListTile(
                title: "Contact",
                svgSrc: "assets/icons/menu_notification.svg",
                press: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactScreen(),
                    ),
                  );

                },
              ),
              DrawerListTile(
                title: "Help",
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(),
                    ),
                  );

                },
              ),
              DrawerListTile(
                title: "Settings",
                svgSrc: "assets/icons/menu_setting.svg",
                press: () {},
              ),
            ],
          ),
        ),
      );
    }
  }



class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      hoverColor: Colors.white.withOpacity(0.5),
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
