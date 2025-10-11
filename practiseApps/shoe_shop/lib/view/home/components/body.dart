// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_shop/theme/custom_app_theme.dart';

import '../../../../animation/fadeanimation.dart';
import '../../../../utils/constants.dart';
import '../../../../models/shoe_model.dart';
import '../../../../view/detail/detail_screen.dart';
import '../../../data/dummy_data.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        topCategoriesWidget(width, height),
        SizedBox(height: 5),
        middleCategoriesWidget(width, height),
        SizedBox(height: 5),
        moreTextWidget(),
        lastCategoriesWidget(context),
      ],
    );
  }

// Top Categories Widget Components
  topCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height / 18,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index ? 21 : 18,
                          color: selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.bold
                              : FontWeight.w400),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

// Middle Categories Widget Components
  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: width / 16,
          height: height / 2.7,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: featured.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexOfFeatured = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize:
                                selectedIndexOfFeatured == index ? 19 : 17,
                            color: selectedIndexOfFeatured == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedIndexOfFeatured == index
                                ? FontWeight.bold
                                : FontWeight.w400),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Container(
          width: width / 1.215,
          height: height / 2.4,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            itemBuilder: (ctx, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                        model: model,
                        isComeFromMoreSection: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(model.name,
                                  style: AppThemes.homeProductName),
                              SizedBox(
                                width: 110,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: Text(model.model,
                              style: AppThemes.homeProductModel),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text("\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 60,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-30 / 360),
                              child: Container(
                                width: 230,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 160,
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.arrowCircleRight,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

// More Text Widget Components
  moreTextWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("More", style: AppThemes.homeMoreText),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
               final snackBar = SnackBar(
                content: const Text("Under processing"),
                 action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },),
                );
                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: FaIcon(
                CupertinoIcons.arrow_right,
                size: 27,
              ))
        ],
      ),
    );
  }

// Last Categories Widget Components
 Widget lastCategoriesWidget(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
    width: width,
    height: height * 0.27, // 25% of screen height
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: availableShoes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        ShoeModel model = availableShoes[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                  model: model,
                  isComeFromMoreSection: true,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(width * 0.025), // responsive margin
            width: width * 0.45,  // ~45% of screen width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                /// NEW Badge
                Positioned(
                  left: width * 0.02,
                  child: FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: width * 0.1,
                      height: height * 0.06,
                      color: Colors.red,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Center(
                          child: FadeAnimation(
                            delay: 1.5,
                            child: Text(
                              "NEW",
                              style: AppThemes.homeGridNewText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Favorite Icon
                Positioned(
                  right: width * 0.02,
                  top: height * 0.005,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: AppConstantsColor.darkTextColor,
                    ),
                  ),
                ),

                /// Shoe Image
                Positioned(
                  top: height * 0.04,
                  left: width * 0.07,
                  child: FadeAnimation(
                    delay: 1.5,
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-15 / 360),
                      child: Container(
                        width: width * 0.35,
                        height: height * 0.12,
                        child: Hero(
                          tag: model.model,
                          child: Image(
                            image: AssetImage(model.imgAddress),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Shoe Name + Model
                Positioned(
                  bottom: height * 0.05,
                  left: width * 0.1,
                  child: FadeAnimation(
                    delay: 2,
                    child: Container(
                      width: width * 0.3,
                      child: FittedBox(
                        child: Text(
                          "${model.name} ${model.model}",
                          style: AppThemes.homeGridNameAndModel,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Shoe Price
                Positioned(
                  bottom: height * 0.02,
                  left: width * 0.1,
                  child: FadeAnimation(
                    delay: 2.2,
                    child: Container(
                      width: width * 0.2,
                      child: FittedBox(
                        child: Text(
                          "\$${model.price.toStringAsFixed(2)}",
                          style: AppThemes.homeGridPrice,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

}


