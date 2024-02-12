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
          if (snapshot.hasData) {
            children = <Widget>[
              Image.file(
                snapshot.data!,
                width: 100,
                height: 100,
                alignment: Alignment.topCenter,
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
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
          return Center(
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
