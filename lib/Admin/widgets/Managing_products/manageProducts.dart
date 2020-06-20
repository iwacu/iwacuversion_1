import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iwacu_version1/Admin/widgets/Managing_products/editProducts.dart';

class ManagingProducts extends StatefulWidget {
  final String userUid;
  ManagingProducts({this.userUid});
  @override
  _ManagingProductsState createState() => _ManagingProductsState();
}

class _ManagingProductsState extends State<ManagingProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        title: Text(
          "Edit your Product",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          // IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,), onPressed: () {  },)
        ],
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("Post")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, int i) {
                      List<DocumentSnapshot> document = snapshot.data.documents;
                      String price =
                          document[i].data["productPrice"].toString();
                      String name = document[i].data["productName"].toString();
                      String details =
                          document[i].data["productDetails"].toString();
                      String phone =
                          document[i].data["productPhone"].toString();
                      String brand =
                          document[i].data["productBrand"].toString();
                      String quality =
                          document[i].data["productQuality"].toString();
                      List<dynamic> image1 = document[i].data["images"];

                      return
                          //ListingPag(name: name, price:price);
                          Dismissible(
                        key: new Key(document[i].documentID),
                        onDismissed: (direction) {
                          Firestore.instance
                              .runTransaction((transaction) async {
                            DocumentSnapshot snapshot =
                                await transaction.get(document[i].reference);
                            await transaction.delete(snapshot.reference);
                          });
                          Scaffold.of(context).showSnackBar(new SnackBar(
                            content: new Text(" Data deleted"),
                          ));
                        },
                        /////////////////////
                        child: Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new EditProducts(
                                        email: widget.userUid,
                                        productName: name,
                                        index: snapshot
                                            .data.documents[i].reference,
                                        productQuality: quality,
                                        productBrand: brand,
                                        productPhone: phone,
                                        productDetails: details,
                                        productPrice: price,
                                      )));
                            },
                            child: ListTile(
                              leading: new CachedNetworkImage(
                                imageUrl: image1[0].toString(),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                width: 80.0,
                                height: 80.0,
                              ),
                              title: new Text(name),
                              subtitle: new Column(children: <Widget>[
                                new Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: new Text("Brand:"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: new Text(
                                      brand,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 8.0, 8.0, 8.0),
                                    child: new Text("Edit:"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: new Icon(Icons.edit),
                                  )
                                ]),
                                new Container(
                                  alignment: Alignment.topLeft,
                                  child: new Text(
                                    "RWF $price",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),

                        
                      ); //ListingPages(name: name, price:price);
                    });
              }
            }),
      ),
    );
  }
}

class ListingPag extends StatelessWidget {
  final String name;
  final String price;
  ListingPag({this.price, this.name});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Text(name),
                      Text(price),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}