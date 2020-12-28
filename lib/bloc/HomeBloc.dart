import 'dart:async';

import 'package:countries/models/CountryDetailModel.dart';
import 'package:countries/models/RegionDetailModel.dart';
import 'package:countries/networking/NetworkException.dart';
import 'package:countries/networking/RequestMethod.dart';
import 'package:countries/repository/HomeRepository.dart';
import 'package:countries/utils/Constant.dart';

class HomeBloc {
  StreamController<dynamic> _countryDetailStreamController;

  StreamSink<dynamic> get countryDetailDataSink =>
      _countryDetailStreamController.sink;

  Stream<dynamic> get countryDetailDataStream =>
      _countryDetailStreamController.stream;


  HomeRepository _homeRepository;
  List<RegionDetailModel> listOfRegions;
  List<CountryDetailModel> countryDetailModelList;

  HomeBloc() {
    _homeRepository = HomeRepository();
    _countryDetailStreamController = StreamController<dynamic>();

    listOfRegions = [
      RegionDetailModel(region: Region.ASIA, regionName: Constant.asia),
      RegionDetailModel(region: Region.EUROPE, regionName: Constant.europe),
      RegionDetailModel(region: Region.AFRICA, regionName: Constant.africa),
      RegionDetailModel(region: Region.OCEANIA, regionName: Constant.oceania),
      RegionDetailModel(region: Region.AMERICAS, regionName: Constant.americas),
      RegionDetailModel(region: Region.POLAR, regionName: Constant.polar),
      RegionDetailModel(region: Region.EMPTY, regionName: Constant.other),
    ];
  }

  Future<dynamic> fetchCountryDetailDataFromServer() async {
    try {
      var countryDetailsData = await _homeRepository.serviceCall(Constant.url, RequestMethod.GET);
      if (countryDetailsData is NetworkException) {
        countryDetailDataSink.addError(countryDetailsData.toString());
      } else {
        if(countryDetailsData != null) {
          if(countryDetailsData is List<CountryDetailModel>) {
            print(countryDetailsData);
            countryDetailModelList = countryDetailsData;
            countryDetailDataSink.add(countryDetailsData);
          } else {
            countryDetailDataSink.addError(Exception(Constant.somethingWentWrong));
          }
        } else {
          countryDetailDataSink.addError(Exception(Constant.somethingWentWrong));
        }
      }
    } catch (e) {
      //  signUpFirstStepDataSink.add("Error");
      countryDetailDataSink.addError(Exception(Constant.somethingWentWrong));
      print(e.toString());
    }
  }

  List<CountryDetailModel> getCountryDetailListOfRegion(Region region) {
    List<CountryDetailModel> countryDetailList = [];
    countryDetailModelList.forEach((element) {
      if(region == element.region) {
        countryDetailList.add(element);
      }
    });
    return countryDetailList;
  }

  void dispose() {
    _countryDetailStreamController?.close();
  }
}