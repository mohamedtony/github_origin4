import 'package:advertisers/app_core/network/requests/CreateSubscriptionRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateUserCategoryRequest.dart';
import 'package:advertisers/app_core/network/requests/login_client_request.dart';
import 'package:advertisers/app_core/network/responses/AddRemoveBlackListResponse.dart';
import 'package:advertisers/app_core/network/responses/CountriesResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateSubscriptionResponse.dart';
import 'package:advertisers/app_core/network/responses/GetBlockedUsersResponse.dart';
import 'package:advertisers/app_core/network/responses/GetCategoriesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetMyProfileInfoResponse.dart';
import 'package:advertisers/app_core/network/responses/GetUseLocationsResponse.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscriptionDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscruptionResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';
@RestApi()
abstract class RestClient {
@RestApi()
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
Future<CreateSubscriptionResponse> createSubscriptions(@Body() CreateSubscriptionRequest createSubscriptionRequest,@Header("Authorization") String token);

@POST('https://advertiser.cefour.com/api/v1/check_copon')
Future<CreateSubscriptionResponse> checkCopon(@Query('code') String code,@Query('period_id') int period_id,@Header("Authorization") String token);

@GET('https://advertiser.cefour.com/api/v1/profile')
Future<GetMyProfileInfoResponse> getMyProfile(@Header("Authorization") String token);

  @Header('Accept":"application/json')
  @POST('https://advertiser.cefour.com/api/v1/auth/register')
  Future<RegisterClientUserResponse> registerClientUser({
     FormData? body
  // @Part() File? image,
  });

@GET('https://advertiser.cefour.com/api/v1/profile/blacklist')
Future<GetBlockedUsersResponse> getBlockedUsers(@Header("Authorization") String token);

@GET('https://advertiser.cefour.com/api/v1/profile/blacklist/{id}')
Future<AddRemoveBlackListResponse> addRemoveBlackList(@Path("id") int id,@Header("Authorization") String token);


@GET('https://advertiser.cefour.com/api/v1/profile/categories')
Future<GetCategoriesResponse> getCategories(@Header("Authorization") String token);

@POST('https://advertiser.cefour.com/api/v1/profile/categories')
Future<GetCategoriesResponse> updateUserCategories(@Body() UpdateUserCategoryRequest updateUserCategoryRequest,@Header("Authorization") String token);

@GET('https://advertiser.cefour.com/api/v1/profile/areas')
Future<GetUseLocationsResponse> getUseLocations(@Header("Authorization") String token);
}
