import 'package:flutter/material.dart';
import 'package:iwacu_version1/themes/title_text.dart';

const stylistData = [
  {
    'stylistName': 'Shoes 2',
    'salonName': 'Kigali,Downtown',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'images/shoe_thumb_4.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Shoes 1',
    'salonName': 'Kigali,Downtown',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'images/shooe_tilt_1.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Shoes 3',
    'salonName': 'Kigali,Downtown',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'images/small_tilt_shoe_3.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Shoes 4',
    'salonName': 'Kigali,Downtown',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'images/stylist2.png',
    'bgColor': Color(0xffFFF0EB),
  },

];

class Overview extends StatelessWidget {
 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:12,right:8,left:8),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
             
              TitleText(
                        text: 'App Overview',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
               height: 20,),

               Container(
        //width: MediaQuery.of(context).size.width,
        // height:double.infinity ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffFFF0EB),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              right: -60,
              child: Image.asset(
                '',
                width: MediaQuery.of(context).size.width * 0.60,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TitleText(
                        text: 'Users Registered : 10,000 Users',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                         'Verifed User :  8,900 Users',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                         'Active User :  6,900 Users',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                         'Users Completed Oders :  7,900 Users',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xff4E295B),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          color: Color(0xff4E295B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                     
                    },
                    color: Color(0xff4E295B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Visit Shop',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
   
          ],
          ),
        ),
      ),
    );
  }
}

