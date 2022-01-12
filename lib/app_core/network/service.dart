//
import 'dart:io';

import 'package:advertisers/app_core/network/requests/RegisterClientUserRequest.dart';
import 'package:advertisers/app_core/network/responses/CountriesResponse.dart';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

 static const String rootPath='https://advertiser.cefour.com/api/v1/';
  @GET(rootPath+'countries')
  Future<CountriesResponse> getCountries();

  @Header('Accept":"application/json')
  @POST(rootPath+'auth/register')
  Future<RegisterClientUserResponse> registerClientUser({
     FormData? body
  // @Part() File? image,
  });


}
