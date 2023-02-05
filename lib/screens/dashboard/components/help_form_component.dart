
import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HelpFormComponent extends StatefulWidget {
  const HelpFormComponent({Key? key}) : super(key: key);

  @override
  State<HelpFormComponent> createState() => _HelpFormComponentState();
}

class _HelpFormComponentState extends State<HelpFormComponent> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Header(title: "Need Help ?",),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          //       MyFiles(),
                          SizedBox(height: defaultPadding),
                          if(Responsive.isDesktop(context))
                            form(),
                          if(Responsive.isMobile(context))
                            Container(
                              height: 450,
                              width: 300,
                              child: form(),
                            ) ,

                          SizedBox(height: defaultPadding),

                        ],
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  Widget form(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),              icon: const Icon(Icons.person,color: Colors.white,),
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: defaultPadding),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),              icon: const Icon(Icons.person,color: Colors.white,),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),

          SizedBox(height: defaultPadding),

          TextFormField(
            controller: feedbackController,
            decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.calendar_today,color: Colors.white,),
                hintText: 'Enter your Message',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Query',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: defaultPadding),


          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: (){
                  submitHelp(nameController.text,emailController.text, contactController.text, feedbackController.text);
                },
              )),
        ],
      ),
    );
  }


  void submitHelp(String name,String email,String contact,String feedback) async{
    final uri = Uri.parse("http://core-coins.com/apis/saveHelp.php");
    final body2 = {
      'email':email,
      'name':name,
      'message': feedback,

    };

    final response = await http.post(uri,body: body2);

    print(response.body);

    setState(() {
      nameController.text ="";
      emailController.text="";
      feedbackController.text="";
     // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text("We Will Get Back To You Soon !")));
    });


  }

}
