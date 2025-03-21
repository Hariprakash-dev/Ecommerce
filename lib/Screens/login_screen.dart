import 'package:ecom/Screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/vegetables.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Welcome to",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  " eGrocer !",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            
                            

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(247, 247, 247, 1),
                              prefixText: "+91",
                              hintText: "    999999",
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(185, 185, 185, 1),
                              ),
                                prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0), 
                child: Image.asset(
                  "Assets/flag.webp", 
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
                              
                         
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(247, 247, 247, 1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(247, 247, 247, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (BuildContext context) => MainScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.lightGreen,
                              ),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Don't have an account?",style: TextStyle(
                                      color: Color.fromRGBO(165, 167, 169, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                              Text(" Register Now",style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Expanded(
                                child:DottedLine(dashColor: Color.fromRGBO(165, 167, 169, 1),)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromRGBO(247, 247, 247, 1)),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                      color: Color.fromRGBO(165, 167, 169, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child:DottedLine(dashColor: Color.fromRGBO(165, 167, 169, 1),)
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "Assets/g.png",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "Assets/E.png",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Continue with email",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Divider(
                            color: Color.fromRGBO(165, 167, 169, 1),
                            thickness: 1,
                          ),
                          SizedBox(height: 15,),
                          RichText(
                            text: TextSpan(
                              text: "By Continuing, you agree to eGrocer's  ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(165, 165, 165, 1)
                              ),
                              children: [
                                TextSpan(
                                  text: "Terms of \nService  ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                                TextSpan(
                                  text: "and  ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                   color: Color.fromRGBO(165, 165, 165, 1)
                                  ),
                                ),
                                TextSpan(
                                  text: " Privacy Policy",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
