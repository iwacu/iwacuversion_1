import 'package:flutter/material.dart';
import 'package:iwacu_version1/Admin/widgets/Add_products/addProducts.dart';
import 'package:iwacu_version1/Admin/widgets/Managing_products/manageProducts.dart';
import 'package:iwacu_version1/Admin/widgets/overview.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/cotton.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/polyster.dart';
import 'package:iwacu_version1/sizeConfig/sizeConfig.dart';
import 'package:iwacu_version1/themes/title_text.dart';


class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin>with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFE9E9E9),
      body: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/no_image.png'),
              ),
                IconButton(
                  onPressed:(){},
                  icon:Icon(Icons.exit_to_app),
                  color: Colors.black,
                iconSize: 8 * SizeConfig.imageSizeMultiplier,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5 * SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                 ),
              child: Column(
                children: <Widget>[
                  TabBar(
                    
                      controller: tabController,
                      indicatorColor: const Color(0xffF7DFB9),
                      indicatorWeight: 3.0,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabs: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8,right:18),
                          child: Tab(
                            child: TitleText(
                              text: 'OverView',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Tab(
                          child: TitleText(
                            text: 'Oders_received',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Tab(
                          child: TitleText(
                            text: 'Add_Product',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Tab(
                          child: TitleText(
                            text: 'Edit_Product',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Tab(
                          child: TitleText(
                            text: 'Delete_Product',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            Overview(),
                             Cotton(),
                              AdminAddProducts(),
                               ManagingProducts(),
                            Polyster(),
                           
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    
    );
    }
}