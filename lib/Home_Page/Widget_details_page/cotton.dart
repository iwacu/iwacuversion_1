import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:iwacu_version1/sizeConfig/sizeConfig.dart';
import 'package:iwacu_version1/themes/light_color.dart';
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

class Cotton extends StatelessWidget {
  Widget _card(stylistData){
    return Container(
      width: 64.5 * SizeConfig.widthMultiplier,
      height: 64.5 * SizeConfig.heightMultiplier,
      
      decoration: BoxDecoration(
         border: Border.all(
      color: Colors.grey,
    ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        
        children: <Widget>[
         
           Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XffFAF0DA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleText(
                        text: 'Bishya',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
              ),
            ),
          ),
          Center(
            child:Image.asset(
             stylistData['imgUrl'],
             height: 10 * SizeConfig.imageSizeMultiplier,
              width: 10 * SizeConfig.imageSizeMultiplier,
              
             ),
         
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(stylistData['stylistName'], style: TextStyle(
              //fontFamily: 'OpenSans-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 2.5 * SizeConfig.textMultiplier,
              color: Colors.black
            ),),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("RWF 10.000 / m", style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 2.5 * SizeConfig.textMultiplier
                  ),),
               
                
              ],
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier,)
        ],
      ),
      );
      
  }
  Widget _car(stylistData){
    return Container(
      width: 64.5 * SizeConfig.widthMultiplier,
      height: 64.5 * SizeConfig.heightMultiplier,
      
      decoration: BoxDecoration(
        border: Border.all(
      color: Colors.grey,
    ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        
        children: <Widget>[
         
           Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XffFAF0DA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border,color: LightColor.grey,)
              ),
            ),
          ),
          Center(
            child:Image.asset(
             stylistData['imgUrl'],
             height: 30 * SizeConfig.imageSizeMultiplier,
              width: 30 * SizeConfig.imageSizeMultiplier,
              
             ),
         
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(stylistData['stylistName'], style: TextStyle(
              //fontFamily: 'OpenSans-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 2.5 * SizeConfig.textMultiplier,
              color: Colors.black
            ),),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("RWF 10.000 / m", style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5 * SizeConfig.textMultiplier
                ),),
               
                
              ],
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier,)
        ],
      ),
      );
      
  }
 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:12,right:8,left:8),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Card(
             shape: RoundedRectangleBorder(
               borderRadius: const BorderRadius.all(
                 Radius.circular(8.0),
               ),
               side: new BorderSide(color: Colors.white, width: 2.0),
             ),
             child: imagCarousels,
           ),
              SizedBox(height: 10*SizeConfig.heightMultiplier ),
              Container(
          child: TitleText(
                        text: 'Ibishyahsya',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
              ),
               SizedBox(height: 5*SizeConfig.heightMultiplier ),
             SizedBox(
               height: 150,
                    child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
           itemCount: stylistData.length,
          itemBuilder: (context,int index){
            return Padding(
              padding: const EdgeInsets.only(right:10,left:10),
              child: _card(stylistData[index]),
            );
          },
      ),
              ),
              TitleText(
                        text: 'Ibindi',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
               height: 20,),
                GridView.builder(
         
        shrinkWrap: true,
       physics: ScrollPhysics(),
      itemCount: stylistData.length,
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      childAspectRatio: SizeConfig.widthMultiplier/SizeConfig.heightMultiplier
     ), 
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _car(stylistData[index]),
        );
      }
        
        )
          ],
          ),
        ),
      ),
    );
  }
}

Widget imagCarousels = new Container(

    height: 150,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
     
        AssetImage('images/clothes.jpg'),
        AssetImage('images/convention.jpg'),
        AssetImage('images/lovelyRwanda.jpg'),
        AssetImage('images/convention.jpg'),
      ],
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      dotBgColor: Colors.transparent,
      indicatorBgPadding: 8.0,
    ),
  );
  
  