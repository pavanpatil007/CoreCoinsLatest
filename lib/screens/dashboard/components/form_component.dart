
import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';

import 'storage_details.dart';
import 'topten.dart';
import 'package:http/http.dart' as http;


class FormComponent extends StatefulWidget {
  const FormComponent({Key? key}) : super(key: key);

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _formKey = GlobalKey<FormState>();

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
                Header(title: "Form Example",),
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
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),              icon: const Icon(Icons.phone,color: Colors.white,),
                hintText: 'Enter a phone number',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Phone',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: defaultPadding),

          TextFormField(
            decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.calendar_today,color: Colors.white,),
                hintText: 'Enter your date of birth',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Dob',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: defaultPadding),


          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: null,
              )),
        ],
      ),
    );
  }

}
