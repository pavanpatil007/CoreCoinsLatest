
import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FeedbackFormComponent extends StatefulWidget {
  const FeedbackFormComponent({Key? key}) : super(key: key);

  @override
  State<FeedbackFormComponent> createState() => _FeedbackFormComponentState();
}

class _FeedbackFormComponentState extends State<FeedbackFormComponent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

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
                Header(title: "Feedback Form",),
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
            controller: emailController,
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
            controller: contactController,
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
            controller: feedbackController,
            decoration: const InputDecoration(

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(Icons.calendar_today,color: Colors.white,),
                hintText: 'Enter your Feedback',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Feedback',
                labelStyle: TextStyle(color: Colors.white)
            ),
          ),
          SizedBox(height: defaultPadding),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new ElevatedButton(
                child: const Text('Submit'),
                onPressed: (){
                  submitFeedbac(emailController.text, contactController.text, feedbackController.text);
                },
              )),
        ],
      ),
    );
  }


  void submitFeedbac(String email,String contact,String feedback) async{
    final uri = Uri.parse("http://core-coins.com/apis/savefeedback.php");
    final body2 = {
      'email':email,
      'contact' : contact,
      'feedback': feedback,

    };

    var response =  await http.post(uri,body: body2);

    print("Response: "+ response.contentLength.toString());

    setState(() {




    });


  }

}
