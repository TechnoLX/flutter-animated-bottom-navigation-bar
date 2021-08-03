import 'package:flutter/material.dart';

import 'barItem.dart';

class AnimatedBarItem extends StatefulWidget {
  AnimatedBarItem(
      {Key? key,
      required this.barItems,
      required this.duration,
      required this.onTap})
      : super(key: key);

  final List<BarItem> barItems;
  final Duration duration;
  final Function onTap;

  @override
  _AnimatedBarItemState createState() => _AnimatedBarItemState();
}

class _AnimatedBarItemState extends State<AnimatedBarItem>
    with TickerProviderStateMixin {
  //now, let complete the animation part
  int selectedIndex = 0; //for index of the icon
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      padding: const EdgeInsets.only(
          bottom: 24.0, top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: _buildIconButton(), //display icon button in row
      ),
    );
  }

  List<Widget> _buildIconButton() {
    List<Widget> _barItems = [];

    //rendering all icons and information
    for (var index = 0; index < widget.barItems.length; index++) {
      BarItem item = widget.barItems[index];
      //define isSelected
      bool _isSelected = selectedIndex == index;
      _barItems.add(InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            widget.onTap(selectedIndex);
          });
        }, //define onTap
        child: AnimatedContainer(
          //lets try delete the horizontal padding
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          duration: widget.duration,
          curve: Curves.easeIn,
          //now doing decoration for container
          decoration: BoxDecoration(
              color: _isSelected
                  ? Colors.orange //lets change the color
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Icon(item.icon, color: Colors.white, size: 24),
              SizedBox(
                width: 10,
              ),
              //hide the label when unselected
              //now wrap into AnimatedSize
              //look great, label appear with animation (0.5 second)
              AnimatedSize(
                duration: widget.duration,
                vsync: this, //for this, need to extend with TickerProvider
                curve: Curves.easeInOut,
                child: Text(_isSelected ? item.label : "",
                    style: TextStyle(
                      color: _isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              )
            ],
          ),
        ),
      )); //add all items into _barItems
    }
    return _barItems;
  }
}
