import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage4 extends StatefulWidget {
  String url;


  @override
  _WebPageState createState() => _WebPageState();
  WebPage4(this.url);
}

class _WebPageState extends State<WebPage4> {
  String myurl;
  String title,url;
  bool isLoading=true;
  final _key = UniqueKey();
  void initState(){
    myurl=widget.url;
    setState(() {

    });
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          key: _key,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? Center( child: CircularProgressIndicator(),)
            : Stack(),
      ],
    );
  }
}
