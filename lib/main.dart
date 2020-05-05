import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SimpleBMICalculator(),
    );
  }
}

class SimpleBMICalculator extends StatefulWidget {
  @override
  _SimpleBMICalculatorState createState() => _SimpleBMICalculatorState();
}

class _SimpleBMICalculatorState extends State<SimpleBMICalculator> {

  //final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String bmi = "";
  String comment = "";

  buttonPressed(String heightText, String weightText){
    //var age = double.parse(ageText);
    var height = double.parse(heightText);
    var weight = double.parse(weightText);

    var doubleBMI = weight / (height * height);
    bmi = doubleBMI.toStringAsFixed(2);
    if(doubleBMI <= 18.5){
      comment = "Underweight";
    }else if(doubleBMI > 18.5 && doubleBMI <= 24.9){
      comment = "Normal";
    }else if(doubleBMI > 24.9 && doubleBMI <= 29.9){
      comment = "Overweight";
    }else{
      comment = "Obese";
    }
  }

  Widget buildField(String hintText, Icon icon, TextEditingController inputControl){
    return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: inputControl,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: icon,
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
              ),
            )
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple BMI Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(15.0),
            child: Image(image: AssetImage('assets/images/bmi.png')),
          ),

          //buildField('Enter Your Age...', Icon(Icons.calendar_today), ageController),
          buildField('Enter Your Height...', Icon(Icons.directions_walk), heightController),
          buildField('Enter Your Weight...', Icon(Icons.shutter_speed), weightController),

          /*Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: ageController,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Age...',
                prefixIcon: Icon(Icons.calendar_today),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
              ),
            )
          ),*/

          /*Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: heightController,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Height...',
                prefixIcon: Icon(Icons.directions_walk),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
              ),
            )
          ),*/

          /*Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: weightController,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Weight...',
                prefixIcon: Icon(Icons.shutter_speed),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
              ),
            )
          ),*/

          RaisedButton(
              onPressed: () => buttonPressed(heightController.text, weightController.text),
              padding: EdgeInsets.all(0.0),
              child: Container(
                width: MediaQuery.of(context).size.height * 0.50,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.greenAccent,
                ),
                child: Text('Calculate', style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
              child: Text(bmi, style: TextStyle(fontSize: 30.0),),
            ),

            Container(
              padding: EdgeInsets.all(0.0),
              child: Text(comment, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
            )
      ],
      )
    );
  }
}