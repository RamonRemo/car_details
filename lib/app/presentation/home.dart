import 'package:car_details_app/app/domain/models/entities/car_entity.dart';
import 'package:car_details_app/app/presentation/pages/details_page.dart';
import 'package:car_details_app/app/presentation/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class CarApp extends StatefulWidget {
  CarApp({super.key});

  @override
  State<CarApp> createState() => _CarAppState();
}

class _CarAppState extends State<CarApp> {
  final scrollController = ScrollController();
  int indexTile = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          _listView(context),
          _buildButton(context),
        ]),
      ),
    );
  }

  Container _listView(BuildContext context) {
    double padding = 0;

    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        controller: scrollController,
        itemBuilder: (context, index) {
          var item = Constants.list[index];
          var distanceFromSelected = index - indexTile;
          var paddingForLast = index == Constants.list.length - 1 ? 0.0 : 6.0;

          padding = 50.0 * distanceFromSelected;

          if (padding < 0) {
            padding = padding * -1;
          }

          return _buildTile(paddingForLast, padding, item);
        },
      ),
    );
  }

  AnimatedContainer _buildTile(
    double paddingForLast,
    double padding,
    CarEntity item,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.only(
        right: paddingForLast,
        top: padding,
        bottom: padding,
      ),
      child: CustomTile(
        car: item,
        key: item.key,
      ),
    );
  }

  _buildButton(context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBackButton(),
              _buildMiddleButton(context),
              _buildForwardButton(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildForwardButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (indexTile < Constants.list.length - 1) {
          setState(() {
            indexTile++;
          });
        }
        findElement();
      },
      child: Icon(
        Icons.arrow_forward_ios_sharp,
        color: Constants.red,
        size: 35,
      ),
    );
  }

  GestureDetector _buildMiddleButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, _createRoute());
      },
      child: Text(
        ' VIEW \nSTORY',
        style: GoogleFonts.goblinOne(
          color: Constants.red,
          fontSize: 13,
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DetailsPage(car: Constants.list[indexTile]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  GestureDetector _buildBackButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (indexTile >= 1) {
          setState(() {
            indexTile--;
          });
        }
        findElement();
      },
      child: Icon(
        Icons.arrow_back_ios_sharp,
        color: Constants.red,
        size: 35,
      ),
    );
  }

  TextStyle styleOutlined = GoogleFonts.plaster(
    fontSize: 50,
    foreground: Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0,
    fontWeight: FontWeight.bold,
  );

  findElement() {
    scrollController.position.ensureVisible(
      Constants.list[indexTile].key.currentContext!.findRenderObject()!,
      alignment: 0.5,
      duration: const Duration(seconds: 1),
    );
  }
}

//anton,rubik mono one, ultra, holtwood one sc, plaster
