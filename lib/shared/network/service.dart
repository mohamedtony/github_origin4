import 'package:advertisers/shared/network/responses/CountriesResponse.dart';
import 'package:advertisers/shared/network/responses/SubscriptionDetailsResponse.dart';
import 'package:advertisers/shared/network/responses/SubscruptionResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('https://advertiser.cefour.com/api/v1/countries')
  Future<CountriesResponse> getCountries();

  @GET('https://advertiser.cefour.com/api/v1/subscriptions')
  Future<SubscruptionResponse> getSubscription();

  @GET('https://advertiser.cefour.com/api/v1/subscriptions/{id}')
  Future<SubscriptionDetailsResponse> getSubscriptionDetails(@Path("id") int id);
}
