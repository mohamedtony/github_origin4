import 'package:advertisers/shared/network/requests/CreateSubscriptionRequest.dart';
import 'package:advertisers/shared/network/requests/MLoginRequest.dart';
import 'package:advertisers/shared/network/requests/login_client_request.dart';
import 'package:advertisers/shared/network/responses/CountriesResponse.dart';
import 'package:advertisers/shared/network/responses/LoginClientResponse.dart';
import 'package:advertisers/shared/network/responses/LoginResponse.dart';
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

  @POST('https://advertiser.cefour.com/api/v1/auth/login')
  Future<LoginClientResponse> login(@Body() LoginClientRequest mLoginRequest);

  @POST('https://advertiser.cefour.com/api/v1/subscriptions')
  Future<LoginClientResponse> createSubscriptions(@Body() CreateSubscriptionRequest createSubscriptionRequest,@Header("Authorization") String token);
}
