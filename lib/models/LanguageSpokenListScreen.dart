import 'package:countries/models/CountryDetailModel.dart';
import 'package:flutter/material.dart';

class LanguageSpokenListScreen extends StatefulWidget {
  final CountryDetailModel countryDetailModel;

  const LanguageSpokenListScreen({Key key, @required this.countryDetailModel}) : super(key: key);

  @override
  _LanguageSpokenListScreenState createState() => _LanguageSpokenListScreenState();
}

class _LanguageSpokenListScreenState extends State<LanguageSpokenListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.countryDetailModel.name)),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                  'Shared Borders:'
              ),
              onTap: () {
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.countryDetailModel.borders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        widget.countryDetailModel.borders[index]
                    ),
                    onTap: () {
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text(
                  'Languages Spoken:'
              ),
              onTap: () {
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.countryDetailModel.languages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      widget.countryDetailModel.languages[index].name
                    ),
                    onTap: () {
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
