
import 'dart:io';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/requests/CreateAdvertiseRequest.dart';
import 'package:advertisers/app_core/network/requests/CreateSubscriptionRequest.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/app_core/network/requests/OneCountryAndCitiesRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateProfileRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateUserCategoryRequest.dart';
import 'package:advertisers/app_core/network/requests/login_client_request.dart';
import 'package:advertisers/app_core/network/responses/AddRemoveBlackListResponse.dart';
import 'package:advertisers/app_core/network/responses/CountriesResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateSubscriptionResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdvertisersFormResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdvertisersResponse.dart';
import 'package:advertisers/app_core/network/responses/GetBlockedUsersResponse.dart';
import 'package:advertisers/app_core/network/responses/GetCategoriesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetMyProfileInfoResponse.dart';
import 'package:advertisers/app_core/network/responses/GetProductsAndAdsTypesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetUseLocationsResponse.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RequestDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscriptionDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscruptionResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';

part 'service.g.dart';
@RestApi(baseUrl: "https://advertiser.cefour.com/api/v1/")
abstract class RestClient {
factory RestClient(Dio dio) = _RestClient;

@GET('/countries')
Future<CountriesResponse> getCountries();

@GET('/subscriptions')
Future<SubscruptionResponse> getSubscription();

@GET('/subscriptions/{id}')
Future<SubscriptionDetailsResponse> getSubscriptionDetails(@Path("id") int id);

@POST('/auth/login')
Future<LoginClientResponse> login(@Body() LoginClientRequest mLoginRequest);

@POST('/subscriptions')
Future<CreateSubscriptionResponse> createSubscriptions(@Body() CreateSubscriptionRequest createSubscriptionRequest,@Header("Authorization") String token);

@POST('/check_copon')
Future<CreateSubscriptionResponse> checkCopon(@Query('code') String code,@Query('period_id') int? period_id,@Header("Authorization") String token);

@GET('/profile')
Future<GetMyProfileInfoResponse> getMyProfile(@Header("Authorization") String token);

  @Header('Accept":"application/json')
  @POST('/auth/register')
  Future<RegisterClientUserResponse> registerClientUser({
     FormData? body
  // @Part() File? image,
  });

@GET('/profile/blacklist')
Future<GetBlockedUsersResponse> getBlockedUsers(@Header("Authorization") String token);

@GET('/profile/blacklist/{id}')
Future<AddRemoveBlackListResponse> addRemoveBlackList(@Path("id") int id,@Header("Authorization") String token);


@GET('/profile/categories')
Future<GetCategoriesResponse> getCategories(@Header("Authorization") String token);

@POST('/profile/categories')
Future<GetCategoriesResponse> updateUserCategories(@Body() UpdateUserCategoryRequest updateUserCategoryRequest,@Header("Authorization") String token);

@GET('/profile/areas')
Future<GetUseLocationsResponse> getUseLocations(@Header("Authorization") String token);

@POST('/profile/channels/add')
Future<CreateSubscriptionResponse> addChannel(@Body() ChannelData channel,@Header("Authorization") String token);

@POST('/profile/areas')
Future<GetUseLocationsResponse> setOneCountryAndCities(@Body() OneCountryAndCitiesRequest oneCountryAndCitiesRequest,@Header("Authorization") String token);

/*
@POST('/profile/update')
@MultiPart()
Future<GetMyProfileInfoResponse> updateMyProfile(*//*@Body() UpdateProfileRequest updateProfileRequest,*//*@Header("Accept") String token,@Part(name: 'username') String? username ,@Part(name: 'account_name') String? account_name ,@Part(name: 'email') String? email,@Part(name: 'phone') String? phone ,@Part(name: 'country_id') int? country_id ,@Part(name: 'area_id') int? area_id ,@Part(name: 'role') String? role ,@Part(name: 'type') String? type ,@Part(name: 'personal_id') String? personal_id ,{@Part(name: 'image') File? file});*/

  @POST('/profile/areas')
  Future<GetUseLocationsResponse> setMultipleCountry(@Body() OneCountryAndCitiesRequest oneCountryAndCitiesRequest,@Header("Authorization") String token);

  @POST('/profile/update')
  @MultiPart()
  Future<GetMyProfileInfoResponse> updateMyProfile(@Header("Accept") String accept,@Header("Authorization") String token,{@Part(name: 'company_name') String? company_name ,@Part(name: 'username') String? username ,@Part(name: 'account_name') String? account_name ,@Part(name: 'manager_name') String? manager_name,@Part(name: 'email') String? email,@Part(name: 'phone') String? phone ,@Part(name: 'country_id') int? country_id ,@Part(name: 'area_id') int? area_id ,@Part(name: 'role') String? role ,@Part(name: 'type') String? type ,@Part(name: 'personal_id') String? personal_id ,@Part(name: 'sgl') String? sgl ,@Part(name: 'chat') int? isChat ,@Part(name: 'notifiable') int? isNotification ,@Part(name: 'image') File? file});

  @GET('/requests/form')
  Future<GetProductsAndAdsTypesResponse> getProductsAndAdsTypes(@Header("Authorization") String token);

  @POST('/requests/advertisers')
  Future<GetAdvertisersResponse> getAdvertisers(@Header("Authorization") String token,@Body() GetAdvertisersRequest getAdvertisersRequest,);

  @GET('/requests/advertisers_form')
  Future<GetAdvertisersFormResponse> getAdvertisersForm(@Header("Authorization") String token);

/*
  @POST('/requests')
  //@PATCH('/requests')@MultiPart()
  Future<CreateAdvertiseRequestResponse> createAdvertiseRequest(@Header("Accept") String accept,@Header("Authorization") String token, @MultiPart() Map<String,void> json);
*/
  @POST('/requests')
  @MultiPart()
  Future<CreateAdvertiseRequestResponse> createAdvertiseRequest(@Header("Accept") String accept,@Header("Authorization") String token, {@Part(name: 'advertiser_id')int? advertiser_id,@Part(name: 'product_category_id')int? product_category_id,@Part(name: 'description')String? description,@Part(name: 'ads_type_id')int? ads_type_id,@Part(name: 'date_type')String? date_type,
    @Part(name: 'started_at')String? started_at,@Part(name: 'ended_at')String? ended_at,@Part(name: 'offer_ended_at')String? offer_ended_at,@Part(name: 'repeat_count')int? repeat_count,@Part(name: 'channels[]')List<int>? channelsIdes,@Part(name: 'attachments[]')List<File>? attachments,@Part(name: 'links[]')List<LinkModel>? links,});

  @GET('/requests/{id}')
  Future<RequestDetailsResponse> getRequestDetail(@Path("id") int? id,@Header("Authorization") String token);
/*  Map<String, dynamic> mymap = {

    "location[name]": requestAdvertiseController.locationModel.name,
    "location[address]": requestAdvertiseController.locationModel.address,
    "location[lat]": requestAdvertiseController.locationModel.lat,
    "location[lng]": requestAdvertiseController.locationModel.lng,
    "copon[image]": requestAdvertiseController.imageCoponMultiPart,
    "copon[code]": requestAdvertiseController.coponNumberController?.text,
    "copon[name]": requestAdvertiseController.coponNameController?.text,
    "copon[discount]":
    requestAdvertiseController.coponDiscountController?.text,
    "copon[uses]": requestAdvertiseController.coponUsesController?.text,
    "copon[link]": requestAdvertiseController.coponLinkController?.text,
    "copon[ended_at]": requestAdvertiseController.endAdvertisingDateCoupon,
    "notes": requestAdvertiseController.noticeController?.text,
    "plan_file": requestAdvertiseController.planFile
  };*/


}
