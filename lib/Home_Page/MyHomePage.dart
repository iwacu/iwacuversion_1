import 'package:flutter/material.dart';
import 'package:iwacu_version1/Admin/HomePageAdmin.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/cotton.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/polyster.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/Models/usersInformations.dart';
import 'package:iwacu_version1/services/auth.dart';
import 'package:iwacu_version1/services/database.dart';
import 'package:iwacu_version1/sizeConfig/sizeConfig.dart';
import 'package:iwacu_version1/themes/title_text.dart';
import 'package:provider/provider.dart';
import 'package:iwacu_version1/themes/light_color.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MultiProvider(
            providers: [
              StreamProvider<UsersInformations>.value(
                  value: DatabaseService(uid: _user.uid).userInformations),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ),
          );
        });
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  bool _admin=false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
   final _userInformations = Provider.of<UsersInformations>(context);
   _admin= _userInformations.adminSide ==true;
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFE9E9E9),
        elevation: 0.0,
        //title: Text('Ibitenge'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: null),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: TitleText(
                text: '${_userInformations.fullName.toString()}',
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              accountEmail: TitleText(
                text: '${_userInformations.email.toString()}',
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/no_image.png'),
              ),
              decoration: new BoxDecoration(color: LightColor.background),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: TitleText(
                  text: 'Ahabanza',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.home,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: TitleText(
                  text: 'Agaseke',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.shopping_basket,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: TitleText(
                  text: 'Ibikunzwe',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.favorite,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: TitleText(
                  text: 'Ipaji yange',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.person,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
           _admin? InkWell(
              onTap: () {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePageAdmin()),
  );
              },
              child: ListTile(
                title: TitleText(
                  text: 'Admin',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.person_outline,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ):Text(""),
            Divider(),
            InkWell(
              onTap: () async {
                await _auth.signOut();
              },
              child: ListTile(
                title: TitleText(
                  text: 'Gusohoka',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: TitleText(
                  text: 'Ubufasha',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                leading: Icon(
                  Icons.help,
                  size: SizeConfig.imageSizeMultiplier * 8,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE9E9E9),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  )),
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
                              text: 'Cotton',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Tab(
                          child: TitleText(
                            text: 'Polyster',
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
                            Cotton(),
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
