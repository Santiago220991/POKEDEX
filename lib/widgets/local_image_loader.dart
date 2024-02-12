import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/storage.dart';

class LocalImageLoader extends StatefulWidget {
  final String picturePath;
  const LocalImageLoader({super.key, required this.picturePath});

  @override
  State<LocalImageLoader> createState() => _LocalImageLoaderState();
}

class _LocalImageLoaderState extends State<LocalImageLoader> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<File>(
        future: loadStoragedPicture(widget.picturePath),
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.waiting) {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            ];
          } else if (snapshot.hasData) {
            children = <Widget>[
              Image.file(
                snapshot.data!,
                height: 250,
                width: MediaQuery.of(context).size.width - 40.0,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            ];
          }
          return Container(
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
