import 'package:countries/bloc/HomeBloc.dart';
import 'package:countries/models/CountryDetailModel.dart';
import 'package:countries/utils/Constant.dart';
import 'package:countries/views/ExitAppDialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();

    _homeBloc = HomeBloc();

    _homeBloc.fetchCountryDetailDataFromServer();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              content: ExitAppDialog(),
            );
          },
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(Constant.appName)),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Text(Constant.home),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Text(Constant.exit),
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        content: ExitAppDialog(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: StreamBuilder<dynamic>(
            stream: _homeBloc.countryDetailDataStream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: _homeBloc.listOfRegions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_homeBloc.listOfRegions[index].regionName),
                      onTap: () {
                        List<CountryDetailModel> countryList = _homeBloc.getCountryDetailListOfRegion(_homeBloc.listOfRegions[index].region);
                        Navigator.pushNamed(context, Constant.countryListScreenRoute, arguments: countryList);
                      },
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
