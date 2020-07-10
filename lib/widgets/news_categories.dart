import 'package:flutter/material.dart';
import 'package:newsapp/model/category_color.dart';
import 'package:newsapp/provider/sources.dart';
import 'package:provider/provider.dart';

class NewsCategoriesWidget extends StatefulWidget {
  @override
  _NewsCategoriesWidgetState createState() => _NewsCategoriesWidgetState();
}

class _NewsCategoriesWidgetState extends State<NewsCategoriesWidget> {
  var _selectedCategories = 'business';

  TextStyle _selected() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: CategoryColor(_selectedCategories).categoryColor,
    );
  }

  TextStyle _unselected() {
    return TextStyle(
      fontSize: 16,
      color: Colors.black12,
    );
  }

  void _selectCategories(String category) {
    setState(() {
      _selectedCategories = category;
    });

    Provider.of<Sources>(context, listen: false).setCategories(category);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        FlatButton(
          onPressed: () => _selectCategories('business'),
          child: _selectedCategories == 'business'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'Business',
                    style: _selectedCategories == 'business'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'Business',
                  style: _selectedCategories == 'business'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('entertainment'),
          child: _selectedCategories == 'entertainment'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'Entertainment',
                    style: _selectedCategories == 'entertainment'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'Entertainment',
                  style: _selectedCategories == 'entertainment'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('general'),
          child: _selectedCategories == 'general'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'General',
                    style: _selectedCategories == 'general'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'General',
                  style: _selectedCategories == 'general'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('health'),
          child: _selectedCategories == 'health'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'Health',
                    style: _selectedCategories == 'health'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'Health',
                  style: _selectedCategories == 'health'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('science'),
          child: _selectedCategories == 'science'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'Science',
                    style: _selectedCategories == 'science'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'Science',
                  style: _selectedCategories == 'science'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('sports'),
          child: _selectedCategories == 'sports'
              ? Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color:
                            CategoryColor(_selectedCategories).categoryColor),
                  ),
                  child: Text(
                    'Sports',
                    style: _selectedCategories == 'sports'
                        ? _selected()
                        : _unselected(),
                  ),
                )
              : Text(
                  'Sports',
                  style: _selectedCategories == 'sports'
                      ? _selected()
                      : _unselected(),
                ),
        ),
        FlatButton(
          onPressed: () => _selectCategories('technology'),
          child: Text(
            'Technology',
            style: _selectedCategories == 'technology'
                ? _selected()
                : _unselected(),
          ),
        ),
      ],
    );
  }
}
