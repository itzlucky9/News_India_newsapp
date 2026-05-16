import 'package:flutter/material.dart';
import 'package:news_application/screens/home_screen.dart';


void main(){
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),
      (){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (_)=> HomeScreen())
        );
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 219, 219),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              Image.asset(
                "assets/images/chakra.png",
                height: 150,
                width: 150,
              ),

              SizedBox(height: 8,),

              Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "New",
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 237, 87, 28),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          wordSpacing: 2,
                          height: 1,
                          letterSpacing: 2
                        )
                      ),
              
                      TextSpan(
                        text: "'s ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          height: 1,
                          letterSpacing: 2.0
                        )
                      ),
              
                      TextSpan(
                        text: "India",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 40, 122, 31),
                          fontStyle: FontStyle.italic,
                          wordSpacing: 1,
                          height: 1,
                          letterSpacing: 2
                        )
                      )
                    ]
                  )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

