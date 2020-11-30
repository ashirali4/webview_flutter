import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  String url;


  @override
  _WebPageState createState() => _WebPageState();
  WebPage(this.url);
}

class _WebPageState extends State<WebPage> {
  WebViewController _webViewController;

  String myurl;
  double webViewHeight=0;
  String title,url;
  bool isLoading=true;
  final _key = UniqueKey();

  void initState(){

    myurl=widget.url;
    setState(() {

    });
  }
  Future<String> getCountryData() async {
    setState(() {
      isLoading = true;
    });

    return 'success';
  }

  @override

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        setState(() {
          _webViewController.reload();
        });
        return getCountryData();

      },
      child: SingleChildScrollView(
        child: Container(
          height: 1360,
          child: Scaffold(
            body: Container(
              child: Stack(
                children: <Widget>[
                  WebView(
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    key: _key,
                    initialUrl: myurl,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (webhight){
                      setState(() {
                        isLoading = false;
                      });

                    },

                  ),
                  isLoading ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center( child: CircularProgressIndicator(),)],
                  )
                      : Stack(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
