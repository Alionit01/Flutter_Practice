import 'package:flutter/material.dart';

class numListProvider extends ChangeNotifier{
  List<int> nums = [1,2,3,4,5];

  add(){
     int last = nums.last;
     nums.add(last+1);
     notifyListeners();
  }
  subs(){
    int last = nums.last;
     nums.add(last-1);
     notifyListeners();
  }

}