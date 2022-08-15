import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webullish/pages/achevimentdescription.dart';

import '../models/achevimentModel.dart';
import '../models/character.dart';
import '../widgets/styleguide.dart';
import 'character_detail_screen.dart';

class acheviements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 60),
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [AchevimentWidget()],
          )),
    );
  }
}
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors

class AchevimentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return PageView(scrollDirection: Axis.vertical, children: [
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[0])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[0].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[0].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[0].name}",
                        child: Image.asset(
                          achevimentModels[0].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[0].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[0].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[0])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[1].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[1].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[1].name}",
                        child: Image.asset(
                          achevimentModels[1].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[1].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[1].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[2])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[2].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[2].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[2].name}",
                        child: Image.asset(
                          achevimentModels[2].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[2].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[2].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[3])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[3].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[3].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[3].name}",
                        child: Image.asset(
                          achevimentModels[3].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[3].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[3].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[4])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[4].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[4].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[4].name}",
                        child: Image.asset(
                          achevimentModels[4].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[4].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[4].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[5])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[5].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[5].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[5].name}",
                        child: Image.asset(
                          achevimentModels[5].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[5].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[5].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) =>
                            achevimentdetails(character: achevimentModels[6])));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: CharacterCardBackgroundClipper(),
                      child: Hero(
                        tag: "background-${achevimentModels[6].name}",
                        child: Container(
                          height: 0.8 * screenHeight,
                          width: 0.9 * screenWidth,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: achevimentModels[6].colors,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260),
                    child: Align(
                      alignment: Alignment(0, -0.5),
                      child: Hero(
                        tag: "image-${achevimentModels[6].name}",
                        child: Image.asset(
                          achevimentModels[6].imagePath,
                          width: screenWidth * 0.89,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 48, right: 16, bottom: 0, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Hero(
                          tag: "name-${achevimentModels[6].name}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              child: Text(
                                achevimentModels[6].name,
                                style: AppTheme.heading,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Tap to Read more",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
