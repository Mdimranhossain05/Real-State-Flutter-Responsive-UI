import 'package:first_project/Constrain.dart';
import 'package:first_project/CustomFunction.dart';
import 'package:first_project/SampleData.dart';
import 'package:first_project/Widget_Function.dart';
import 'package:first_project/customs/OptionButton.dart';
import 'package:first_project/customs/border_box.dart';
import 'package:first_project/screens/descriptionScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: 25);
    final double padding = 25;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(child: Icon(Icons.menu), padding: EdgeInsets.all(8), width: 50, height: 50),
                        BorderBox(child: Icon(Icons.settings), padding: EdgeInsets.all(8), width: 50, height: 50),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text("City",style: themeData.textTheme.bodyText2,),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text("San Francisco",style: themeData.textTheme.headline1,),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(height: padding,color: COLOR_GREY,),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                      ["<\$20000","For Sale","3-4 Beds",">1000 sqft"]
                          .map((e) => ChoiceOption(text: e)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context,index){
                            return RealStateItem(itemData: RE_DATA[index],);
                          }),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                icon: Icons.map_rounded,
                text: "Map View",
                width: size.width*0.40,
              ),
                  ))
            ],
          )

        ),
      ),
    );
  }
}
class ChoiceOption extends StatelessWidget {

  final String text;
  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(text,style: themeData.textTheme.headline5,),
    );
  }
}

class RealStateItem extends StatelessWidget {
  const RealStateItem({Key? key, this.itemData}) : super(key: key);
  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final ThemeData themedata = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => descriptionScreen(
                itemData: itemData,
              )));
        },

    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(itemData["image"])),
              Positioned(
                  top: 10,
                  left: 250,
                  child: BorderBox(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.favorite_outline,color: COLOR_BLACK,),
              ))
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text("${formatCurrency(itemData["amount"]) }",style: themedata.textTheme.headline1,),
              addHorizontalSpace(10),
              Text("${itemData["address"]}",style: themedata.textTheme.bodyText2,)
            ],
          ),
          addVerticalSpace(10),
          Text("${itemData["bedroom"]} Bedrooms / ${itemData["bathroom"]} bathrooms / ${itemData["area"]} sqft",
          style: themedata.textTheme.headline5,)
        ],
      ),
    ));
  }
}


