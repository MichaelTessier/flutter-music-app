import 'dart:ui';

class Genre {
  int id;
  String name;
  List<int> color;

  Color colorFromRgb() {
    return Color.fromRGBO(color[0],color[1],color[2], 1);
  }


  Genre({ required this.id, required this.name, required this.color });

}