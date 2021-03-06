import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/cart.dart';
import 'package:groceryapp/checkout-screen.dart';
import 'package:groceryapp/login-page.dart';
import 'package:groceryapp/map-screen.dart';
import 'package:groceryapp/product-model.dart';
import 'package:groceryapp/registration-screen.dart';
import 'package:groceryapp/welcome.dart';
import 'package:groceryapp/home_screen.dart';
import 'package:groceryapp/fruits-screen.dart';
import 'package:groceryapp/checkout-screen.dart';
import 'package:groceryapp/map-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  runApp(GroceryApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class GroceryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        backgroundColor: Color(0xfff4e3),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Small Basket : The Perfect Grocery Store'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> cart;
  ValueSetter<ProductModel> _valueSetter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MapsScreen.id: (context) => MapsScreen(),
        FruitScreen.id: (context) => FruitScreen(_valueSetter),
        CheckoutScreen.id: (context) => CheckoutScreen(),
        Cart.id: (context) => Cart(cart),
      },
    );
  }
}
