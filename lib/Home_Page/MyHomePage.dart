import 'package:flutter/material.dart';
import 'package:iwacu_version1/Admin/HomePageAdmin.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/cotton.dart';
import 'package:iwacu_version1/Home_Page/Widget_details_page/polyster.dart';
import 'package:iwacu_version1/Models/post.dart';
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
          SizeConfig().init(constraints,orientation);
          return MultiProvider(
            providers: [
              StreamProvider<UsersInformations>.value(
                  value: DatabaseService(uid: _user.uid).userInformations),
              StreamProvider<List<Post>>.value(
                  value: DatabaseService(uid: _user.uid).postDetail),    
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.4),
                          child: Image.asset(
                            'img/profile.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
          )
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
      body: Padding(
        padding: const EdgeInsets.only(left:10),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Title and subtitle
                      SizedBox(height: SizeConfig.heightMultiplier * 3.6,),
                      Text(
                        'Gitenge',
                        style: TextStyle(
                          fontFamily: 'Libre',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.widthMultiplier * 12.6,
                          color: Color(0xffe57373),
                          letterSpacing: 0.2
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier,),
                      Text(
                        'Ahowasanga igitenge wifuza.',
                        style: TextStyle(
                          fontSize: SizeConfig.widthMultiplier * 3.9,
                          color: Color(0xff757575),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          wordSpacing: 0.4
                        ),
                      ),

                SizedBox(height: SizeConfig.heightMultiplier),
                //product Category
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
                            child: Container(
                                  width: SizeConfig.widthMultiplier * 34,
                                  child: Center(
                                    child: Text(
                                      'Cotton',
                                      style: TextStyle(
                                        color:Color(0xff616161),
                                        fontSize:SizeConfig.textMultiplier * 3.4,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        Tab(
                          child: Container(
                                  width: SizeConfig.widthMultiplier * 34,
                                  child: Center(
                                    child: Text(
                                      'Polyster',
                                      style: TextStyle(
                                        color:Color(0xff616161),
                                        fontSize:SizeConfig.textMultiplier * 3.4,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
