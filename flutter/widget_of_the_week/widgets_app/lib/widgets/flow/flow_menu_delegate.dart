import 'package:flutter/material.dart';

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> animation;

  FlowMenuDelegate({required this.animation}) : super(repaint: animation);

  //get the constraints from the parent widget to the flow widget
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, constraints.maxHeight);
  }

  //this method is responsible for rendering the children onto the screen
  //going to calculate the height that each individual wdget should occupy
  @override
  void paintChildren(FlowPaintingContext context) {
    //since all children have the same height, obtain height as childHeight
    final childHeight = context.getChildSize(0)!.height;
    //variabe to store the total childCount
    final childCount = context.childCount;

    for (var i = 0; i < childCount; i++) {
      //to determine the offset of the children along the x axis, get the max width of the parent container and
      //subtract the child's width from it
      final offsetX = context.size.width - context.getChildSize(i)!.width;
      //to determine the offset of the children along the y axis, get the max height of the parent container &
      //subtract from it the child's height depend on its position in the flow children list
      final baseY = context.size.height - childHeight;
      final offsetY =
          i == (childCount - 1)
              ? baseY
              : baseY - (childCount - 1 - i) * childHeight * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(offsetX, offsetY, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
