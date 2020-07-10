import 'package:flutter/material.dart';
import 'package:newsapp/provider/articles.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _form = GlobalKey<FormState>();
  var _searchKey = '';

  void _searchNews() {
    FocusScope.of(context).requestFocus(FocusNode());
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    if (_searchKey.isNotEmpty) {
      Provider.of<Articles>(context, listen: false).searchArticle(_searchKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 15,
            bottom: 11,
            top: 11,
            right: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).accentColor, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).accentColor, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: 'Search article',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: _searchNews,
          ),
        ),
        onFieldSubmitted: (_) {
          _searchNews();
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Field can not be empty';
          }
          return null;
        },
        onSaved: (newValue) {
          _searchKey = newValue;
        },
      ),
    );
  }
}
