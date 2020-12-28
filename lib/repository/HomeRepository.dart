import 'package:countries/models/CountryDetailModel.dart';
import 'package:countries/networking/NetworkException.dart';
import 'package:countries/networking/NetworkService.dart';
import 'package:countries/networking/RequestMethod.dart';
import 'package:countries/repository/DatabaseRepository.dart';

class HomeRepository {
  Future<dynamic> serviceCall(String url, RequestMethod requestMethod) async{
    List<CountryDetailModel> countryDetailModelList;
    try {
      var response = await NetworkService(url,requestMethod, '').serviceCall();
      if(response is NetworkException){
        return response;
      }else{
        DataBaseRepository.db.insertCountryDetailData(response);
        countryDetailModelList = countryDetailModelFromJson(response);
        return countryDetailModelList;
      }
    }catch(e){
      return countryDetailModelList;
    }
  }
}