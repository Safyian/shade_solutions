import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shade_solutions/view/apply_form.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red.shade900),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final priceController = TextEditingController();
  final depositController = TextEditingController();
  final interestController = TextEditingController();
  double result;
  double price, deposit, interest;
  double year4Term = 0.0, year5Term = 0.0, year6Term = 0.0, year7Term = 0.0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new HomeScreen(),
      image: new Image.asset(
        'assets/logo.jpg',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150,
      // loaderColor: Colors.red
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final priceController = TextEditingController();
  final depositController = TextEditingController();
  final interestController = TextEditingController();
  double result;
  double price, deposit, interest, rate4, rate5, rate6, rate7;
  double year4Term = 0.0, year5Term = 0.0, year6Term = 0.0, year7Term = 0.0;

  //********************** Calculation ********************/
  void Calculate() {
  price = double.parse(priceController.text);
  deposit = double.parse(depositController.text);
  interest = double.parse(interestController.text);

  // FORMULA ==> a / {[(1+r)^n]-1} / [r(1+r)^n] = p

  price = (price + 1300 - deposit);
  interest = 1 + (interest/100)/48;
  rate4 = pow(interest, 192);
  rate5= pow(interest, 240);
  rate6 = pow(interest, 288);
  rate7 = pow(interest, 336);
  
  year4Term = price / ((rate4 -1) / ((interest - 1)*rate4));
  year5Term = price / ((rate5 -1) / ((interest - 1)*rate5));
  year6Term = price / ((rate6 -1) / ((interest - 1)*rate6));
  year7Term = price / ((rate7 -1) / ((interest - 1)*rate7));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Image.asset(
            'assets/calcover.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 2.0, right: 1.0),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/banner2.png',
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width / 2.0,
                      ),
                      Image.asset(
                        'assets/banner1.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 2.03,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 2.0, right: 2.0),
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                //*************** Basic Information ***************/
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      // *********************************
                      Text('Basic Information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0)),

                      SizedBox(height: 6.0),

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text('Purchase Price \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0)),
                      ),

                      //************** Input for Price ************** */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45.0, 8.0, 8.0, 4.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: TextFormField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "\$ 0.0",
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text('Deposit \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0)),
                      ),

                      //************** Input for Deposit ************** */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45.0, 8.0, 8.0, 4.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: TextFormField(
                              controller: depositController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "\$ 0.0",
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text('Interest Rate %',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0)),
                      ),

                      //************** Input for Interest Rate ************** */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45.0, 8.0, 8.0, 4.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: TextFormField(
                              controller: interestController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "% 0.0",
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //*************** Payment Option ***************/
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text('Payment Option',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            priceController.text = '';
                            depositController.text = '';
                            interestController.text = '';

                            year4Term = 0.0;
                            year5Term = 0.0;
                            year6Term = 0.0;
                            year7Term = 0.0;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.white60,
                        child: Text('RESET'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            Calculate();
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text('CALCULATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '4 Year Term is ',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('\$ ${year4Term.toStringAsFixed(2) ?? "0.0"}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Text(
                        ' per Week',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '5 Year Term is ',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('\$ ${year5Term.toStringAsFixed(2) ?? "0.0"}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Text(
                        ' per Week',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '6 Year Term is ',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('\$ ${year6Term.toStringAsFixed(2) ?? "0.0"}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Text(
                        ' per Week',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '7 Year Term is ',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('\$ ${year7Term.toStringAsFixed(2) ?? "0.0"}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      Text(
                        ' per Week',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ApplyForm()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text('APPLY',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}


