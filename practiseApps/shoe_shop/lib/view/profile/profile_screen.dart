// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoe_shop/utils/constants.dart';
import 'package:shoe_shop/view/profile/widget/appbar.dart';
import 'package:shoe_shop/view/profile/widget/body.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarProfile(),
        body: BodyProfile(),
      ),
      
    );
  }
}