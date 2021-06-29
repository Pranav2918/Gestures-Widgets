import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double width = 100.0, height = 100.0;
  late Offset position;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Drag')),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: position.dx,
              top: position.dy - height + 20,
              child: GestureDetector(
                onVerticalDragDown: (DragDownDetails details) {
                  String pos = details.globalPosition.toString();
                  print(pos);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(pos),
                    duration: Duration(seconds: 1),
                  ));
                },
                child: Draggable(
                  child: Container(
                    width: width,
                    height: height,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Drag",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  feedback: Container(
                    child: Center(
                      child: Text(
                        "Dragging",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    color: Colors.red[300],
                    width: width,
                    height: height,
                  ),
                  onDraggableCanceled: (Velocity velocity, Offset offset) {
                    setState(() => position = offset);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
