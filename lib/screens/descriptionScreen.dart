import 'package:first_project/CustomFunction.dart';
import 'package:first_project/SampleData.dart';
import 'package:first_project/Widget_Function.dart';
import 'package:first_project/customs/OptionButton.dart';
import 'package:first_project/customs/border_box.dart';
import 'package:flutter/material.dart';

class descriptionScreen extends StatelessWidget {
  const descriptionScreen({Key? key, this.itemData,}) : super(key: key);

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: 25);
    final double padding = 25;
    return SafeArea(
        child: new Scaffold(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(itemData["image"],width: size.width,),

                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BorderBox(child: Icon(Icons.arrow_back),
                                  padding: EdgeInsets.all(8),
                                  width: 50,
                                  height: 50),
                              BorderBox(child: Icon(Icons.favorite_outline),
                                  padding: EdgeInsets.all(8),
                                  width: 50,
                                  height: 50),
                            ],
                          ),
                        ),)
                    ],
                  ),
                  addVerticalSpace(padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: sidePadding,
                            child: Text("${formatCurrency(itemData["amount"]) }",
                              style: themeData.textTheme.headline1,),
                          ),
                          Padding(
                            padding: sidePadding,
                            child: Text("${itemData["address"]}",
                              style: themeData.textTheme.bodyText2,),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: padding),
                        child: BorderBox(child: Text(
                            "20 Hours ago", style: themeData.textTheme.headline5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            width: size.width * 0.35,
                            height: 43),
                      )
                    ],
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                        "House Information", style: themeData.textTheme.headline4),
                  ),
                  addVerticalSpace(padding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        InformationTile(
                          content: "${itemData["area"]}", name: "Square Foot",),
                        InformationTile(
                          content: "${itemData["bedroom"]}", name: "Bedrooms",),
                        InformationTile(
                          content: "${itemData["bathroom"]}", name: "Bathrooms",),
                        InformationTile(
                          content: "${itemData["garage"]}", name: "Garage",)
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(itemData["description"],
                      textAlign: TextAlign.justify,
                      style: themeData.textTheme.bodyText2,
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(text: "Message", icon: Icons.message, width: size.width*0.40),
                    addHorizontalSpace(10),
                    OptionButton(text: "Call", icon: Icons.call, width: size.width*0.40),
                  ],
                ),

              )
            ],
          )
        )
    );
  }
}

class InformationTile extends StatelessWidget {

  final String content;
  final String name;

  const InformationTile({Key? key, required this.content, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery
        .of(context)
        .size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderBox(
            child: Text(content, style: themeData.textTheme.headline3,),
            padding: EdgeInsets.all(8),
            width: tileSize,
            height: tileSize,
          ),
          addVerticalSpace(15),
          Text(name, style: themeData.textTheme.headline6,)
        ],
      ),
    );
  }
}
