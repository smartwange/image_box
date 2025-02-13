import 'dart:math';
import 'package:flutter/material.dart';

class ImageBox extends StatefulWidget {
  final Color? bgColor;
  final List<String> imageList;
  final int imageIndex;
  const ImageBox(
      {Key? key,
      this.bgColor,
      required this.imageList,
      required this.imageIndex})
      : super(key: key);

  @override
  ImageBoxState createState() => ImageBoxState();
}

class ImageBoxState extends State<ImageBox> {
  int index = 0;
  int count = 0;
  @override
  void initState() {
    super.initState();
    index = widget.imageIndex;
  }

  @override
  Widget build(BuildContext context) {
    double size1 = 80;
    double size2 = 40;
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      iconPadding: EdgeInsets.all(1),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: widget.bgColor ?? Colors.grey,
      surfaceTintColor: widget.bgColor ?? Colors.grey,
      insetPadding: EdgeInsets.all(1),
      content: Wrap(
        children: [
          Stack(
            children: [
              Transform.rotate(
                  angle: (pi / 2) * count,
                  child: InteractiveViewer(
                      boundaryMargin: EdgeInsets.all(20.0),
                      minScale: 0.5, // 最小缩放比例
                      maxScale: 4.0, // 最大缩放比例
                      child: Image.network(widget.imageList[index],
                          width: size.width - 40,
                          height: size.height / 2,
                          fit: BoxFit.contain))),
              Transform(
                  transform:
                      Transform.translate(offset: Offset(size.width - 70, -20))
                          .transform,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => {Navigator.of(context).pop()},
                      style: ButtonStyle(
                          shadowColor:
                              const WidgetStatePropertyAll(Colors.grey),
                          elevation: WidgetStatePropertyAll(20),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(1)),
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.white)),
                      icon: Icon(
                        Icons.close,
                        size: 25,
                        color: Colors.black26,
                      ))),
              Transform(
                  transform: Transform.translate(
                          offset: Offset(-10, size.height / 2 - 200))
                      .transform,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => {
                            if (index != 0)
                              {
                                setState(() {
                                  index--;
                                })
                              }
                          },
                      style: ButtonStyle(
                          shadowColor:
                              const WidgetStatePropertyAll(Colors.grey),
                          elevation: WidgetStatePropertyAll(20),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(1)),
                          backgroundColor: WidgetStatePropertyAll(
                              index != 0 ? Colors.white : Colors.grey)),
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        size: 25,
                        color: index != 0 ? Colors.grey[400] : Colors.grey[50],
                      ))),
              Transform(
                  transform: Transform.translate(
                          offset:
                              Offset(size.width - size1, size.height / 2 - 200))
                      .transform,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => {
                            if (index != widget.imageList.length - 1)
                              {
                                setState(() {
                                  index++;
                                })
                              }
                          },
                      style: ButtonStyle(
                          shadowColor:
                              const WidgetStatePropertyAll(Colors.grey),
                          elevation: WidgetStatePropertyAll(20),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(1)),
                          backgroundColor: WidgetStatePropertyAll(
                              index != widget.imageList.length - 1
                                  ? Colors.white
                                  : Colors.grey)),
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        size: 25,
                        color: index != widget.imageList.length - 1
                            ? Colors.grey[400]
                            : Colors.grey[50],
                      ))),
              Transform(
                  transform: Transform.translate(
                          offset: Offset(
                              size.width / 2 - size2, size.height / 2 - 70))
                      .transform,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => {
                            setState(() {
                              count++;
                              if (count == 4) {
                                count = 0;
                              }
                            })
                          },
                      style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(1)),
                          backgroundColor: WidgetStatePropertyAll(
                              index != widget.imageList.length - 1
                                  ? Colors.white
                                  : Colors.grey)),
                      icon: Icon(
                        Icons.rotate_right,
                        size: 25,
                        color: Colors.black54,
                      ))),
            ],
          )
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
