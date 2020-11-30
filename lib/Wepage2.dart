import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage2 extends StatefulWidget {
  String url;


  @override
  _WebPageState createState() => _WebPageState();
  WebPage2(this.url);
}

class _WebPageState extends State<WebPage2> with AutomaticKeepAliveClientMixin {
  WebViewController _webViewController;

  String myurl;
  double webViewHeight=0;
  String title,url;
  bool isLoading=true;
  final _key = UniqueKey();

  void initState(){

    myurl=widget.url;



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
                    onPageFinished: (webhight) async {
                      webViewHeight = double.tryParse(
                        await _webViewController
                            .evaluateJavascript("document.documentElement.scrollHeight;"),
                      );
                      print(webViewHeight);
                      setState(() {
                        isLoading = false;
                      });

                    },

                  ),
                  isLoading ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(child: CircularProgressIndicator())
                      ],
                    ),
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

  @override
  bool get wantKeepAlive => true;
}
