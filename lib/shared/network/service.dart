import 'package:advertisers/shared/network/responses/CountriesResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('https://advertiser.cefour.com/api/v1/countries')
  Future<CountriesResponse> getCountries();
}
