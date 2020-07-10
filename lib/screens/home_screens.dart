import 'package:flutter/material.dart';
import 'package:newsapp/provider/sources.dart';
import 'package:newsapp/widgets/news_categories.dart';
import 'package:newsapp/widgets/search_text_fields.dart';
import 'package:newsapp/widgets/sources_list.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Sources>(context).fetchAndSetSources().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: NewsCategoriesWidget(),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Sources',
                style: TextStyle(fontSize: 20, color: Colors.black54),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SourcesList(),
            ),
          ],
        ),
      ),
    );
  }
}
