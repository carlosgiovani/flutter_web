import 'package:desktop/web/breadcrumb.dart';
import 'package:desktop/widget/body.dart';
import 'package:desktop/widget/header.dart';
import 'package:desktop/widget/menu.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size; // pega altura e largura da tela
  // bool get showDrawer => size.width <= 760; //mostra o menu tela em 760
  bool get showMenu => size.width > 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: headerHeight,
      color: Colors.blue,
      child: Header(),
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - headerHeight,
      child: showMenu
          ? Row(
              children: <Widget>[
                _menu(),
                _right(),
              ],
            )
          : _right(),
    );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.grey[100],
      child: Menu(),
    );
  }

  _right() {
    return Container(
      padding: EdgeInsets.all(16),
      width: showMenu ? size.width - menuWidth : size.width,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: size.width,
            height: 60,
            child: BreadCrumb(),
          ),
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}
