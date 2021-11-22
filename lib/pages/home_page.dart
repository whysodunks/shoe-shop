import 'package:app_shoe_shop/core/const.dart';
import 'package:app_shoe_shop/core/flutter_icons.dart';
import 'package:app_shoe_shop/models/shoe_model.dart';
import 'package:app_shoe_shop/pages/detail_page.dart';
import 'package:app_shoe_shop/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FlutterIcons.format_list_bulleted,
          color: Colors.black38,
        ),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    FlutterIcons.search,
                    color: Colors.black26,
                  ),
                  onPressed: null,
                )
              ]),
        ),
        Container(
            height: 350,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
                itemCount: shoeList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailPage(shoeList[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 16),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: _buildBackground(index, 230),
                          ),
                          Positioned(
                            bottom: 150,
                            left: 0,
                            child: Hero(
                              tag: "hero${shoeList[index].imgPath}",
                              child: Transform.rotate(
                                angle: -math.pi / 7,
                                child: Image(
                                  width: 230,
                                  image: AssetImage(
                                      "assets/${shoeList[index].imgPath}"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
        SizedBox(height: 14),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("JUST FOR YOU",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  Text("VIEW ALL",
                      style:
                          TextStyle(color: AppColors.greenColor, fontSize: 12)),
                ])),
        SizedBox(height: 12),
        ...shoeList.map((data) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    data,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
              margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/${data.imgPath}"),
                    width: 100,
                    height: 80,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "${data.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "${data.brand}",
                            style:
                                TextStyle(color: Colors.black38, height: 1.5),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "\$${data.price.toInt()}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]),
        child: BottomNavigationBar(
            selectedItemColor: AppColors.greenColor,
            unselectedItemColor: Colors.black26,
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(FlutterIcons.compass),
                  ),
                  title: Text("data")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.format_list_bulleted),
                  title: Text("data")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.shopping_bag), title: Text("data")),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.person), title: Text("data")),
            ]),
      ),
    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 180),
      child: Container(
        color: shoeList[index].color,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(
                        shoeList[index].brand == "Nike"
                            ? FlutterIcons.format_list_bulleted
                            : FlutterIcons.compass,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 125,
                      child: Text(
                        "${shoeList[index].name}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text("\$${shoeList[index].price.toInt()}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                  ]),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    )),
                child: Center(
                  child: Icon(
                    FlutterIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
