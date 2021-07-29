import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

//class is a blueprint and copy of blueprint is object
//We have made this class statefull as we are implemeting welcome+what user type in username
//This will change the state of the widget and required to be load again and again when user inputs
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//Underscore berfore LoginPageState means making it private
//Means this login class cannot be used by anything outsite of this file
class _LoginPageState extends State<
    LoginPage> //This state class enable us to refresh this widget/screen
{
  //NUll Saftey in flutter 2:
  // int a = null;// this cant be null
  // String? a=null;// this can be null

  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<
      FormState>(); //global key means this key can be accessed anywhere globally
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      //await will make it wait for that durataion and also to make await work the function should be async in which it is used
      await Future.delayed(Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      await context.vxNav.push(Uri.parse(MyRoutes.homeRoute)); //navigator 2.0
      //Here it takes uri in .push() ,so we will parse our route to uri using uri.parse
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      // Colors.white,
      //To avoid bottom overflow use singlechildscrollView widget over coloumn widget/any other widget.(Function of singlechildscrollview:Creates a box in which a single widget can be scrolled.)
      child: SingleChildScrollView(
        child: Form //Form is used to group the input things like username ,password,address,etc and allow us to validate that using a key
            //This form can be wrap over any widget inside which there is a textformfield or a textfield
            (
          key: _formkey,
          child:
              Column //a container which can consist many widgets in column wise manner
                  (
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              // use sizedbox instead of padding widget for spacing
              SizedBox(
                height: 20.0,
              ), //gives particular type of box which is blank
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    //Here textformfield is also a statefull widget as it is extend to stateful widget(ctrl+click on it to see)
                    //This means every widget can maintain its own state (statefull/stateless)
                    //This result in overall speeed improvement in app as if we make full app statefull then every thing will be created again and agian on that few change which are not even nessary
                    //  TextField( ) :text field and textformfield are similar but in textformfield we can validate the text
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged:
                            (value) //Whenever the text changes, the callback is invoked and the value of the text also get returned in fnc
                            {
                          name = value;
                          setState(
                              () {}); //This setstate call this build function again when user input/on change and redraws the screen
                        } //This onchaged will give a callback of type string whenever there is a change/input from user
                        //value is the argument which is the input in text form field and this variable name can be anyhing
                        //this value is then stored in name
                        ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value) {
                        //NULL Saftey in flutter 2 :
                        //U can add value!=null condition or simple add ! eg. value!.isempty
                        //value? means this can be null
                        //value! means to check if it is null or not
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "password legth should be atleast 6";
                          }
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   onPressed: () {
                    //     //Naviagtor is used to link the routes and navigate it from one page to another
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // )
                    //Now We will see animated button
                    //to make a any widget clickable there are two methods:
                    //1.wrap it with justerdetector (no animation)
                    //2.wrap it wiht inkwell (animated)
                    Material(
                      color: context.theme.buttonColor,
                      // Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        //To make inkwell work -
                        // 1.Its ancestor should be material or
                        // 2.use Ink widget inside inkwell ,this ink is ame like container
                        onTap: () => moveToHome(context),
                        // child:Ink(
                        //we want animation too,so not using Ink
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          // color: Colors.deepPurple,
                          // We cannot use color at two place i.e here and in decoration
                          child: changeButton
                              ? Icon(Icons.done)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          //To use Ink /splash effect decoration should be given to material else this decoration will overrude the splash effect
                          // decoration: BoxDecoration(
                          //     color: Colors.deepPurple,
                          // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          // Box shape and border radius cannot be used together
                          // borderRadius:
                          //     BorderRadius.circular(changeButton ? 50 : 8)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
