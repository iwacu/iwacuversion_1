import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iwacu_version1/Models/post.dart';
import 'package:iwacu_version1/sizeConfig/sizeConfig.dart';

class CartDetails extends StatefulWidget{

  final Post post;
  CartDetails({this.post});

  @override
  State createState() {
    return _CartDetailsState();
  }
}

class _CartDetailsState extends State<CartDetails> {
  int count = 1;
  double price = 0.0;
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
                  itemCount: widget.post.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new CachedNetworkImage(
                      imageUrl: widget.post.images[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(),
                ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 6,left: SizeConfig.widthMultiplier * 7,right: SizeConfig.widthMultiplier * 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back,color: Color(0xff424242),size: SizeConfig.imageSizeMultiplier * 12,)),
                Icon(Icons.search,color: Color(0xff424242),size: SizeConfig.imageSizeMultiplier * 12,),
              ],
            ),
          ),
         Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: SizeConfig.heightMultiplier * 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.heightMultiplier * 8.4),
                                                topRight: Radius.circular(SizeConfig.heightMultiplier* 8.4)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 10,top: SizeConfig.widthMultiplier * 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(
                      '${widget.post.productName}',
                      style: TextStyle(
                        fontSize: SizeConfig.widthMultiplier * 6.8,
                        fontFamily: 'Poppins',
                        wordSpacing: 2,
                        letterSpacing: 0.2,
                        color: Color(0xff424242)
                      ),
                    ),
                    SizedBox(height: SizeConfig.widthMultiplier * 0.2,),
                    Text(
                      '${widget.post.productCategory}',
                      style: TextStyle(
                        fontSize: SizeConfig.widthMultiplier * 3.4,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff616161),
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(height: SizeConfig.widthMultiplier * 8.4,),
                     Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: SizeConfig.widthMultiplier * 3,
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 5,),
                        CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: SizeConfig.widthMultiplier * 3,
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 5,),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: SizeConfig.widthMultiplier * 3,
                        ),

                        SizedBox(width: SizeConfig.widthMultiplier * 20,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count =
                              count > 1 ? count - 1 : count;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xff757575)),borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 2)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 0.4,
                                                            horizontal: SizeConfig.widthMultiplier * 2),
                              child: Icon(Icons.remove,size: SizeConfig.widthMultiplier * 5.4,color: Color(0xff424242),),
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 4,),
                        Text(
                          '$count',
                          style: TextStyle(
                            fontSize: SizeConfig.widthMultiplier * 4,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff424242),
                          ),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 4,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count =
                              count < 5 ? count + 1 : count;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xff757575)),borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 2)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: SizeConfig.widthMultiplier * 0.8,
                                  horizontal: SizeConfig.widthMultiplier * 2.4),
                              child: Icon(Icons.add,size: SizeConfig.widthMultiplier * 4.4,color: Color(0xff424242),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.widthMultiplier * 4.4,),
                    Expanded(
                                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.widthMultiplier * 12.4,
                            height: SizeConfig.heightMultiplier * 5.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffef5350),width: 1.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.favorite,color: Color(0xffe57373),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 10.4),
                            child: RaisedButton(
                              onPressed: (){},
                              color: Color(0xffe57373),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3)),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.2,horizontal: SizeConfig.widthMultiplier * 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      '\$ ${(price*count).toStringAsFixed(2)}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.2,
                                          wordSpacing: 2,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeConfig.widthMultiplier * 4
                                      ),
                                    ),
                                    SizedBox(width: SizeConfig.widthMultiplier * 16,),
                                    Icon(Icons.arrow_forward,color: Colors.white,)
                                  ],
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    )
                    ,SizedBox(height: SizeConfig.widthMultiplier * 4.4,),
                 
                  ],
                ),
                ),
            ),
         ),
        ],
      ),
    );
  }
}