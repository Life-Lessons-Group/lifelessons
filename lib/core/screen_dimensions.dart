import 'package:flutter/material.dart';

class ScreenDimensions {
  final BuildContext context;

  ScreenDimensions(this.context);
  
  get screenWidth{
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  get screenHeight{
    double height = MediaQuery.of(context).size.height;
    return height;
  }


}
