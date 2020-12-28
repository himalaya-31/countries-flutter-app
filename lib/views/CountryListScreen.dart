import 'package:countries/models/CountryDetailModel.dart';
import 'package:countries/utils/Constant.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  final List<CountryDetailModel> countryDetailModelList;

  const CountryListScreen({Key key, @required this.countryDetailModelList}) : super(key: key);

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constant.appName)),
      body: Container(
        child: ListView.builder(
          itemCount: widget.countryDetailModelList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.network(
                            widget.countryDetailModelList[index].flag,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                widget.countryDetailModelList[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.countryDetailModelList[index].capital,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, Constant.languageSpokenListRoute, arguments: widget.countryDetailModelList[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
