
import 'dart:io';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/GetAdsFilterForm.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/requests/CreateAdvertiseRequest.dart';
import 'package:advertisers/app_core/network/requests/CreateSubscriptionRequest.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/app_core/network/requests/GetAdvertisersRequest.dart';
import 'package:advertisers/app_core/network/requests/OneCountryAndCitiesRequest.dart';
import 'package:advertisers/app_core/network/requests/SelectCoponsRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateProfileRequest.dart';
import 'package:advertisers/app_core/network/requests/UpdateUserCategoryRequest.dart';
import 'package:advertisers/app_core/network/requests/login_client_request.dart';
import 'package:advertisers/app_core/network/responses/AdDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/AddEmployeeResponse.dart';
import 'package:advertisers/app_core/network/responses/AddRemoveBlackListResponse.dart';
import 'package:advertisers/app_core/network/responses/AddToFavoriteListResponse.dart';
import 'package:advertisers/app_core/network/responses/AdvertiserProfileDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/CoponsResponse.dart';
import 'package:advertisers/app_core/network/responses/CountriesResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:advertisers/app_core/network/responses/CreateSubscriptionResponse.dart';
import 'package:advertisers/app_core/network/responses/GalleryResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdsFilterFormResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdsListResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdvertisersFormResponse.dart';
import 'package:advertisers/app_core/network/responses/GetAdvertisersResponse.dart';
import 'package:advertisers/app_core/network/responses/GetBlockedUsersResponse.dart';
import 'package:advertisers/app_core/network/responses/GetCategoriesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetCouponsFilterFormResponse.dart';
import 'package:advertisers/app_core/network/responses/GetGalleryFilterResponse.dart';
import 'package:advertisers/app_core/network/responses/GetMyProfileInfoResponse.dart';
import 'package:advertisers/app_core/network/responses/GetProductsAndAdsTypesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetRulesResponse.dart';
import 'package:advertisers/app_core/network/responses/GetUseLocationsResponse.dart';
import 'package:advertisers/app_core/network/responses/LoginClientResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestFiltersResponse.dart';
import 'package:advertisers/app_core/network/responses/MyRequestsResponse.dart';
import 'package:advertisers/app_core/network/responses/NotificationsResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/app_core/network/responses/RequestDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/ShowAddsListResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscriptionDetailsResponse.dart';
import 'package:advertisers/app_core/network/responses/SubscruptionResponse.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
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

  @POST('/requests/{id}/delete_link')
  @FormUrlEncoded()
  Future<RequestDetailsResponse> deleteLink(@Path("id") int? id,@Field()int? link_id,@Header("Authorization") String token,);

  @GET('/advertiser_profile/{id}')
  Future<AdvertiserProfileDetailsResponse> getAdveriserProfileDetail(@Path("id") int? id,@Header("Authorization") String token);
  //@GET('/copons/app')
  @GET('copons/app')
  Future<CoponsResponse> getAppCopons(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token);


  @GET('copons/advertisers?page={id}')
  Future<CoponsResponse> getAdvertisersCopons( @Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/clients')
  Future<CoponsResponse> getClientsCopons(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token);

  @GET('/copons/clients?user_id={userid}&page={id}')
  Future<CoponsResponse> getClientsCoponsWhitId( @Path("userid") int? userid,@Path("id") int? id,@Header("Authorization") String token);

  @GET('/mycopons?page={id}')
  Future<CoponsResponse> getMyCopons( /*@Path("userid") int? userid,*/@Path("id") int? id,@Header("Authorization") String token);


  @GET('/copons/{id}/like')
  Future<CoponsResponse> likeCopon(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/{id}/dislike')
  Future<CoponsResponse> dislikeCopon(@Path("id") int? id,@Header("Authorization") String token);

  @POST('/select_copons')
  Future<CoponsResponse> select_copons(@Body()SelectCoponsRequest selectCoponsRequest,@Header("Authorization") String token);

  @POST('/deselect_copons')
  Future<CoponsResponse> deselect_copons(@Body()SelectCoponsRequest selectCoponsRequest,@Header("Authorization") String token);

  @DELETE('/copons/{id}')
  Future<AdvertiserProfileDetailsResponse> deleteCopon(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/{id}/status')
  Future<AdvertiserProfileDetailsResponse> changeStatus(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/{id}/seen')
  Future<AdvertiserProfileDetailsResponse> seenCopon(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/{id}/share')
  Future<AdvertiserProfileDetailsResponse> shareCopon(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/copons/{id}/use')
  Future<AdvertiserProfileDetailsResponse> useCopon(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads?user_id={user_id}&page={id}')
  Future<GetAdsListResponse> getAdsList(@Path("user_id") int? user_id, @Path("id") int? id,@Header("Authorization") String token,@Body() GetAdsRequest getAdsRequest);

  @GET('/ads?page={id}&name=mohamed')
  Future<GetAdsListResponse> getAdsListHome(
      @Path("id") int? id, @Header("Authorization") String token, /*{@Query("page") int? user_id,@Query("ads_types[]") List<int>? ads_types,@Query("filters[]") List<String>? filters,
        @Query("countries[]") List<int>? countries,@Query("areas[]") List<int>? areas,@Query("country_category[]") List<int>? country_category,
        @Query("distance_from") int? distance_from,@Query("distance_to") int? distance_to,@Query("name") String? name,@Query("date_from") String? date_from,@Query("date_to") String? date_to}*/);

  @GET('/ads')
  Future<GetAdsListResponse> getAdsListHome2(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token,);

  @POST('/ads/{id}/comment')
  @FormUrlEncoded()
  Future<AdvertiserProfileDetailsResponse> commentAd(@Path("id") int? id,@Field()String? comment,@Header("Authorization") String token);

  @GET('/ads/{id}/favourite')
  Future<AddToFavoriteListResponse> favouriteAd(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/{id}/like')
  Future<AddToFavoriteListResponse> likeAd(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/{id}/dislike')
  Future<AddToFavoriteListResponse> dislikeAd(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/profile/blacklist/{id}')
  Future<AddToFavoriteListResponse> blacklistAdvertiser(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/profile/like/{id}')
  Future<AddToFavoriteListResponse> likeAdvertiser(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/profile/mute/{id}')
  Future<AddToFavoriteListResponse> muteAdvertiser(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/{id}')
  Future<AdDetailsResponse> getAdDetails( @Path("id") int? id,@Header("Authorization") String token);

  @POST('/ads/{id}/rate')
  @FormUrlEncoded()
  Future<AddToFavoriteListResponse> rateAds( @Path("id") int? id,@Query('rate') double? rate,@Header("Authorization") String token);

  @GET('/ads/{id}/notify')
  @FormUrlEncoded()
  Future<AddToFavoriteListResponse> notify( @Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/{id}/in_front')
  @FormUrlEncoded()
  Future<AddToFavoriteListResponse> in_front( @Path("id") int? id,@Header("Authorization") String token);

  @GET('/myads?page={id}')
  Future<GetAdsListResponse> getMyAds(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads')
  Future<ShowAddsListResponse> getMyAdsAdvertiserMenue(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token);


  @POST('/ads/{id}/report')
  @FormUrlEncoded()
  Future<AddToFavoriteListResponse> reportAds( @Path("id") int? id,@Field() String? reason,@Header("Authorization") String token);

  @GET('/favourite_ads?page={id}')
  Future<GetAdsListResponse> getMyFavoriteAds( @Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/{id}/seen')
  Future<AdvertiserProfileDetailsResponse> seenAds(@Path("id") int? id,@Header("Authorization") String token);

  @GET('/ads/filter_form')
  Future<GetAdsFilterFormResponse> filterForm(@Header("Authorization") String token);

  @GET('/requests/filter_form')
  Future<MyRequestFiltersResponse> myRequestsFilterForm(@Header("Authorization") String token);

  @GET('/employees/{id}/roles')
  Future<GetRulesResponse> getMyEmployeeRules( @Path("id") int? id,@Header("Authorization") String token);

  @GET('/notifications_form')
  Future<MyRequestFiltersResponse> notifications_form(@Header("Authorization") String token);

  @GET('/notifications')
  Future<NotificationsResponse> getNotifications(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token);

  @GET('/myrequests')
  Future<MyRequestsResponse> getMyRequests(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token,);

  @GET('/myrequests')
  Future<AdvertisingRequestsResponse> getMyRequestsAdvertising(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token,);

  @GET('/copons/filter_form')
  Future<GetCouponsFilterFormResponse> getCoupounsFilterForm(@Header("Authorization") String token,);

  @GET('/gallery/filter_form')
  Future<GetGalleryFilterResponse> getGalleryFilterForm(@Header("Authorization") String token,);

  @GET('/gallery')
  Future<GalleryResponse> getGallery(@Queries() Map<String, dynamic> queries,@Header("Authorization") String token,);


  @GET('/copons/filter_form2')
  Future<GetCouponsFilterFormResponse> getCoupounsShopsFilterForm(@Header("Authorization") String token,);
}
