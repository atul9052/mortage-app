import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class mortageapp extends StatefulWidget {
  @override
  mortageappState createState() => mortageappState();
}

class mortageappState extends State<mortageapp> {
  double homeprice = 0.0;
  int interest = 0;
  int years = 0;
  double monthlypayment =0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mortgage Payments"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
       child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Column(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(4.0),
             child: Container(
               width: 500,
               height: 150,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   border: Border.all(color: Colors.white),
                   borderRadius: BorderRadius.circular(2),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey,
                       spreadRadius: 1,
                       blurRadius: 7
                     )
                   ]
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("MonthlyPayment"),
                   ),
                   Text("\$ ${Calculatepayment(homeprice,interest,years)}")
                 ],
               )
             ),
           ),
Divider(color: Colors.white,),
           Container(
             width: 490,
             height: 250,

             decoration: BoxDecoration(
             color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
               border: Border.all(color: Colors.black12)
             ),

             //color: Colors.black,
               child: Column(
                    children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                         keyboardType:
                         TextInputType.numberWithOptions(decimal: true),
                         style: TextStyle(color: Colors.purple),
                         decoration: InputDecoration(
                             prefixText: "HOME PRICE",
                             prefixIcon: Icon(Icons.home,color: Colors.blue,)),
                         onChanged: (String value) {
                           try {
                             homeprice = double.parse(value);
                           } catch (exception) {
                             homeprice = 0.0;
                           }
                         },
                       ),
                     ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Lenght of Loan(years)"),
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap:   (){
                                setState(() {
                                  if(years > 1)
                                    {years--;
                                    }
                                });
    },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 5,
                                    height: 5,

                                    child: Text("-",style: TextStyle(
                                        fontSize: 25
                                    ),),
                                  ),
                                ),
                              ),
                            )

                            ,
                            Text("$years"),
                            InkWell(
                              onTap: (){
                            setState(() {
                             return years++;
                            });
                            }
                            ,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                     borderRadius: BorderRadius.circular(10)
                                  ),

                                child: Container(
                                  alignment: Alignment.center,
                                  width: 5,
                                  height: 5,

                                  child: Text("+",style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],


                    ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Interest"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${interest/100} %"),
                          ),

                        ],

                      ),
                      Slider(
                          min: 0,
                          max: 500,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          divisions: 500,
                          value: interest.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              interest =  value.round() ;
                            });
                          })
                    ],


),
           )
         ],

      ),
   ]
    ),

    )
    );
  }
}
 Calculatepayment(double x,int h,int z){
double t;
double p ;
int  f = z*12;
double u = h/1200;
double y = u/100;
  t = (pow(1+y,f))/(pow(1+y,f) - 1);
  p = (x*y*t);
     return p.toStringAsFixed(2);


}
