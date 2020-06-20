import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/Product_details/cottonDetails.dart';
import 'package:iwacu_version1/Models/post.dart';
import 'package:iwacu_version1/sizeConfig/sizeConfig.dart';
import 'package:iwacu_version1/themes/light_color.dart';
import 'package:iwacu_version1/themes/title_text.dart';
import 'package:provider/provider.dart';

class Polyster extends StatelessWidget {
  _buildListViewItem(Post _post) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 4.0,
                    blurRadius: 4.0)
              ]),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 220,
                right: 4,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                     height: 20.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xffe57373)),
                    child: Center(child: Text("-10% Off",style: TextStyle(
                      color: Colors.white
                    ),)))
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 180.0,
                    width: 205.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        image: DecorationImage(
                            image: NetworkImage(_post.images[0]),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      _post.productName,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      _post.productCategory,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14.0,
                          color: Colors.grey),
                    ),
                  ),
                 
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Rwf10.000 /Metero',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.textMultiplier *2.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: Center(
                                child: Icon(Icons.favorite, color: Colors.grey),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _post = Provider.of<List<Post>>(context) ?? [];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            
              SizedBox(height: 10 * SizeConfig.heightMultiplier),
              Container(
                child: TitleText(
                  text: 'Ibishyahsya',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5 * SizeConfig.heightMultiplier),
              SizedBox(
                height: MediaQuery.of(context).size.height - 230,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _post.length,
                  itemBuilder: (context, int index) {
                    return _post[index].productCategory=='Polyster'? Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: _buildListViewItem(_post[index]),
                    ):Container();
                  },
                ),
              ),
              TitleText(
                text: 'Ibindi',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: _post.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: SizeConfig.widthMultiplier /
                          SizeConfig.heightMultiplier /
                          1.2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>CartDetails(post: _post[index],)),
  );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 6),
                          child: Container(
                            width: SizeConfig.widthMultiplier * 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.widthMultiplier * 3.4),
                                      child: Image.network(
                                        '${_post[index].images[0]}',
                                        fit: BoxFit.contain,
                                        width: SizeConfig.heightMultiplier * 50,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: SizeConfig.widthMultiplier * 62,
                                          left:
                                              SizeConfig.widthMultiplier * 6),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig
                                                              .widthMultiplier *
                                                          4.2)),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.widthMultiplier * 4,
                                ),
                                Text(
                                  '${_post[index].productName}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      wordSpacing: 1.4,
                                      color: Color(0xff424242)),
                                ),
                                SizedBox(
                                  height: SizeConfig.widthMultiplier * 2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.widthMultiplier * 2.4),
                                    color: Color(0xffe57373),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 6.4),
                                    child: Text(
                                      'Rwf 10.000',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.2),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              ,SizedBox(height:SizeConfig.heightMultiplier*3),
              Text(
                              'Ibyaguzwe cyane',
                              style: TextStyle(
                                fontFamily: 'PlayFair',
                                fontSize: SizeConfig.widthMultiplier * 6.8,
                                color: Color(0xff424242),
                              ),
                            ),
              SizedBox(height: SizeConfig.heightMultiplier * 1.8,),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _post.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Padding(
      padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 6.8,top: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3),
            child: Image.network(
              '${_post[index].images[0]}',
              width: SizeConfig.widthMultiplier * 20.4,
              height: SizeConfig.heightMultiplier * 10,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${_post[index].productName}',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2.4,
                    fontFamily: 'Poppins',
                  ),
                ),
                 Text(
                  '${_post[index].productCategory}',
                  style: TextStyle(
                      fontSize:SizeConfig.textMultiplier * 1.8
                  ),
                ),
                
              ],
            ),
          ),
          Text(
            'Rwf 12.000',
            style: TextStyle(
              fontSize: SizeConfig.widthMultiplier * 3,
              fontWeight: FontWeight.w500,
              color: Color(0xff424242),
              letterSpacing: 0.2,
            ),
          )
        ],
      ),
       
    )
    );
                  },
                ),
              
            
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
