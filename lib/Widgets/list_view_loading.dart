import 'package:flutter/material.dart';

const List<Color> defaultColors = [
  Color.fromRGBO(0, 0, 0, 0.1),
  Color(0x44CCCCCC),
  Color.fromRGBO(0, 0, 0, 0.1)
];
const List<Color> textDefaultColors = [
  Color.fromRGBO(0, 0, 0, 0.1),
  Color(0x44CCCCCC),
  Color.fromRGBO(0, 0, 0, 0.1),
];
Widget buildButtonBox(Animation animation,
    {required double width,
      required double height,
      required bool isDarkMode,
      required bool isRectBox,
      required bool isPurplishMode,
      required AlignmentGeometry beginAlign,
      required AlignmentGeometry endAlign,
      required bool hasCustomColors,
      required List<Color> colors,
      bool isVideoShimmer = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    height: isVideoShimmer ? width * 0.2 : width * 0.2,
    width: isVideoShimmer ? width * 0.25 : width * 0.2,
    decoration: customBoxDecoration(
        animation: animation,
        isDarkMode: isDarkMode,
        isPurplishMode: isPurplishMode,
        isRectBox: isRectBox,
        beginAlign: beginAlign,
        endAlign: endAlign,
        hasCustomColors: hasCustomColors,
        colors: colors.length == 3 ? colors : defaultColors),
  );
}

Decoration customBoxDecoration({
  required Animation animation,
  bool isRectBox = false,
  bool isDarkMode = false,
  bool isPurplishMode = false,
  bool hasCustomColors = false,
  List<Color> colors = defaultColors,
  AlignmentGeometry beginAlign = Alignment.topLeft,
  AlignmentGeometry endAlign = Alignment.bottomRight,
}) {
  return BoxDecoration(
      shape: isRectBox ? BoxShape.rectangle : BoxShape.circle,
      gradient: LinearGradient(
          begin: beginAlign,
          end: endAlign,
          colors: hasCustomColors
              ? colors.map((color) {
            return color;
          }).toList()
              : [
            isPurplishMode
                ? const Color(0xFF8D71A9)
                : isDarkMode
                ? const Color(0xFF1D1D1D)
                : const Color.fromRGBO(0, 0, 0, 0.1),
            isPurplishMode
                ? const Color(0xFF36265A)
                : isDarkMode ? const Color(0xFF3C4042) : const Color(0x44CCCCCC),
            isPurplishMode
                ? const Color(0xFF8D71A9)
                : isDarkMode
                ? const Color(0xFF1D1D1D)
                : const Color.fromRGBO(0, 0, 0, 0.1),
          ],
          stops: [animation.value - 2, animation.value, animation.value + 1]));
}

Decoration radiusBoxDecoration(
    {required Animation animation,
      bool isDarkMode = false,
      bool isPurplishMode = false,
      bool hasCustomColors = false,
      List<BoxShadow> shadow = const [],
      AlignmentGeometry beginAlign = Alignment.topLeft,
      AlignmentGeometry endAlign = Alignment.bottomRight,
      List<Color> colors = defaultColors,
      double radius = 10.0}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      shape: BoxShape.rectangle,
      boxShadow: shadow,
      gradient: LinearGradient(
          begin: beginAlign,
          end: endAlign,
          colors: hasCustomColors
              ? colors.map((color) {
            return color;
          }).toList()
              : [
            isPurplishMode
                ? const Color(0xFF8D71A9)
                : isDarkMode
                ? const Color(0xFF1D1D1D)
                : const Color.fromRGBO(0, 0, 0, 0.1),
            isPurplishMode
                ? const Color(0xFF36265A)
                : isDarkMode ? const Color(0xFF3C4042) : const Color(0x44CCCCCC),
            isPurplishMode
                ? const Color(0xFF8D71A9)
                : isDarkMode
                ? const Color(0xFF1D1D1D)
                : const Color.fromRGBO(0, 0, 0, 0.1),
          ],
          stops: [animation.value - 2, animation.value, animation.value + 1]));
}

class ListShimmer extends StatefulWidget {
  final bool isRectBox;
  final bool isDarkMode;
  final bool isPurplishMode;
  final AlignmentGeometry beginAlign;
  final AlignmentGeometry endAlign;
  final bool hasBottomBox;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool hasCustomColors;
  final List<Color> colors;
  final ScrollPhysics scrollPhysics;
  const ListShimmer({
    super.key,
    this.isRectBox = false,
    this.isDarkMode = false,
    this.beginAlign = Alignment.topLeft,
    this.endAlign = Alignment.bottomRight,
    this.hasBottomBox = false,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.isPurplishMode = false,
    this.hasCustomColors = false,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.colors = defaultColors,
  });
  @override
  _ListShimmerState createState() => _ListShimmerState();
}
class _ListShimmerState extends State<ListShimmer> with SingleTickerProviderStateMixin
{
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(duration: const Duration(seconds: 1), vsync: this)
      ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
            margin: widget.margin,
            padding: widget.padding,
            color: widget.isDarkMode ? const Color(0xFF0B0B0B) : Colors.transparent,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              physics: const BouncingScrollPhysics(),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 1,
                children: List.generate(10,(index) => Container(
                  height: 180,
                  decoration: radiusBoxDecoration(
                      radius: 15,
                      animation: _animation,
                      isPurplishMode: widget.isPurplishMode,
                      isDarkMode: widget.isDarkMode,
                      hasCustomColors: widget.hasCustomColors,
                      colors: widget.colors.length == 3
                          ? widget.colors
                          : defaultColors),
                )),
              ),
            )
        );
      },
    );
  }
}