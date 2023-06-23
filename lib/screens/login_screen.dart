import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sed_project/model/user_details.dart';
import 'package:sed_project/screens/page_cover.dart';
import 'package:sed_project/screens/register_screen.dart';
import 'package:sed_project/services/api_endpoints.dart';
import 'package:sed_project/services/http_requests.dart';

import 'front_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserDetails userDetails;
  int statusCode=0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isObscure = true;

  String validateText(String formText) {
    if (formText.isEmpty) return 'Field is Required';
    return null;
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  login(BuildContext context,String userName,String password) async {
    if(userNameController.text.isEmpty || passwordController.text.isEmpty){
      EasyLoading.dismiss();
      showSnackBar(context, 'All fields are required');
    }else{
      String url = Endpoints.LOGIN_URL + userName + "/" + password;
      userDetails=(await ServerRequests().getLoginInfo(context,url));
      statusCode=(await ServerRequests().getStatusCode(context,url));
      if(statusCode==300){
        EasyLoading.dismiss();
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Login Error!"),
            content: Text("Invalid Username or Password"),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Close"),
              ),
              SizedBox(width: 10,),
              MaterialButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
        print("Login Url wrong ");
      }else{
        EasyLoading.dismiss();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FrontPage(userDetails)));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController.text="EDTO-806860832";
    passwordController.text="806860832v";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageCover(
        needBack: true,
        needBottom: true,
        title: "Google Maps",
        needTop: false,
        needBackground: true,
        body: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Center(
                    child: Container(
                        child: Image.asset('assets/image/logo.png', alignment: Alignment.center, height: 200, width: 200,)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0 , 3)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(width: 6),
                              SvgPicture.asset(
                                'assets/Icons/Profile.svg',
                                height:19.839 ,
                                width:15.84 ,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: userNameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: InputBorder.none,
                                    hintText: 'Enter Username',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                    //hintText: 'Enter your Username'
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/Icons/Lock.svg',
                                color: Colors.black,
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: _isObscure,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                            _isObscure ? Icons.visibility : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: InputBorder.none,
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: MaterialButton(
                              onPressed: () async {
                                try {
                                  EasyLoading.show(dismissOnTap: false, status: "Checking credentials please wait! ");
                                  await login(context, userNameController.text, passwordController.text);
                                } catch (error) {

                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
