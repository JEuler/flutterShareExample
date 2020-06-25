import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mime/mime.dart';
//import 'package:share_social_media_plugin/share_social_media_plugin.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
   var url = "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png";
    //var url = "http://erdoganabaci.site/wp-content/uploads/2020/05/cute-dog.jpg";
    //var imageId = await ImageDownloader.downloadImage("http://erdoganabaci.site/wp-content/uploads/2020/05/cute-dog.jpg");
    var imageId = await ImageDownloader.downloadImage(url);


    print("This is image ID $imageId");
    var mediaId = imageId;
    final instagramUrl = 'instagram://library?LocalIdentifier=$mediaId';
   //final instagramUrl = 'instagram://media?id=$mediaId';

     //String url1 = 'tel:1-408-555-5555';

   if (await canLaunch(instagramUrl)) {
      try {
        //final instagramUrl = 'instagram://library?LocalIdentifier=$mediaId';
        await launch(instagramUrl);
        //await launch(url1);

      } on PlatformException {
        // do something
      }
    } else {
      throw 'Could not launch $url';
    }
  /*  var request = await HttpClient().getUrl(Uri.parse('http://erdoganabaci.site/wp-content/uploads/2020/05/cute-dog.jpg'));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    //await ShareSocialMediaPlugin.shareInstagram("hello","images/play.jpg","images/play.jpg");
    await Share.file('ESYS AMLOG',"images/play.jpg", bytes, 'image/jpg');
*/


    /*var request = await HttpClient().getUrl(Uri.parse('http://erdoganabaci.site/wp-content/uploads/2020/05/cute-dog.jpg'));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');*/




  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.share),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
