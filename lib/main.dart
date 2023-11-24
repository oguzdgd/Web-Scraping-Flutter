import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:web_scraping_flutter/services/web_scraping_service.dart';

import 'models/article_models.dart';

void main() {
  runApp(WebScraping());
}

class WebScraping extends StatefulWidget {
  const WebScraping({super.key});

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  bool? isLoading;
  WebService _service = WebService();
  List<Word> articles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Web Scrapping'),
        ),
        body: FutureBuilder<List<Word>>(
          future: _service.getWebsiteData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].english + 'Türkish:  ${snapshot.data![index].turkish}'),
                    subtitle: Text(
                      '${snapshot.data![index].pronunciation}\nPronunciation:',
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
