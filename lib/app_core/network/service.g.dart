// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://advertiser.cefour.com/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CountriesResponse> getCountries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CountriesResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/countries',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CountriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubscruptionResponse> getSubscription() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubscruptionResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subscriptions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubscruptionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubscriptionDetailsResponse> getSubscriptionDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubscriptionDetailsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subscriptions/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubscriptionDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginClientResponse> login(mLoginRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(mLoginRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginClientResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginClientResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateSubscriptionResponse> createSubscriptions(
      createSubscriptionRequest, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(createSubscriptionRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSubscriptionResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/subscriptions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateSubscriptionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateSubscriptionResponse> checkCopon(code, period_id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'code': code,
      r'period_id': period_id
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSubscriptionResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/check_copon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateSubscriptionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMyProfileInfoResponse> getMyProfile(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMyProfileInfoResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMyProfileInfoResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterClientUserResponse> registerClientUser({body}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterClientUserResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterClientUserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetBlockedUsersResponse> getBlockedUsers(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetBlockedUsersResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/blacklist',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetBlockedUsersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddRemoveBlackListResponse> addRemoveBlackList(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddRemoveBlackListResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/blacklist/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddRemoveBlackListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCategoriesResponse> getCategories(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCategoriesResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCategoriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCategoriesResponse> updateUserCategories(
      updateUserCategoryRequest, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(updateUserCategoryRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCategoriesResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCategoriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUseLocationsResponse> getUseLocations(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUseLocationsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/areas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUseLocationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateSubscriptionResponse> addChannel(channel, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(channel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSubscriptionResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/channels/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateSubscriptionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUseLocationsResponse> setOneCountryAndCities(
      oneCountryAndCitiesRequest, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(oneCountryAndCitiesRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUseLocationsResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/areas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUseLocationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetUseLocationsResponse> setMultipleCountry(
      oneCountryAndCitiesRequest, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(oneCountryAndCitiesRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUseLocationsResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/profile/areas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUseLocationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMyProfileInfoResponse> updateMyProfile(accept, token,
      {company_name,
      username,
      account_name,
      manager_name,
      email,
      phone,
      country_id,
      area_id,
      role,
      type,
      personal_id,
      sgl,
      isChat,
      isNotification,
      file}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Authorization': token
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (company_name != null) {
      _data.fields.add(MapEntry('company_name', company_name));
    }
    if (username != null) {
      _data.fields.add(MapEntry('username', username));
    }
    if (account_name != null) {
      _data.fields.add(MapEntry('account_name', account_name));
    }
    if (manager_name != null) {
      _data.fields.add(MapEntry('manager_name', manager_name));
    }
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (country_id != null) {
      _data.fields.add(MapEntry('country_id', country_id.toString()));
    }
    if (area_id != null) {
      _data.fields.add(MapEntry('area_id', area_id.toString()));
    }
    if (role != null) {
      _data.fields.add(MapEntry('role', role));
    }
    if (type != null) {
      _data.fields.add(MapEntry('type', type));
    }
    if (personal_id != null) {
      _data.fields.add(MapEntry('personal_id', personal_id));
    }
    if (sgl != null) {
      _data.fields.add(MapEntry('sgl', sgl));
    }
    if (isChat != null) {
      _data.fields.add(MapEntry('chat', isChat.toString()));
    }
    if (isNotification != null) {
      _data.fields.add(MapEntry('notifiable', isNotification.toString()));
    }
    if (file != null) {
      _data.files.add(MapEntry(
          'image',
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMyProfileInfoResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/profile/update',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMyProfileInfoResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetProductsAndAdsTypesResponse> getProductsAndAdsTypes(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetProductsAndAdsTypesResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/requests/form',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProductsAndAdsTypesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAdvertisersResponse> getAdvertisers(
      token, getAdvertisersRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(getAdvertisersRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAdvertisersResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/requests/advertisers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAdvertisersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAdvertisersFormResponse> getAdvertisersForm(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAdvertisersFormResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/requests/advertisers_form',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAdvertisersFormResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateAdvertiseRequestResponse> createAdvertiseRequest(accept, token,
      {advertiser_id,
      product_category_id,
      description,
      ads_type_id,
      date_type,
      started_at,
      ended_at,
      offer_ended_at,
      repeat_count,
      channelsIdes,
      attachments,
      links}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Authorization': token
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (advertiser_id != null) {
      _data.fields.add(MapEntry('advertiser_id', advertiser_id.toString()));
    }
    if (product_category_id != null) {
      _data.fields
          .add(MapEntry('product_category_id', product_category_id.toString()));
    }
    if (description != null) {
      _data.fields.add(MapEntry('description', description));
    }
    if (ads_type_id != null) {
      _data.fields.add(MapEntry('ads_type_id', ads_type_id.toString()));
    }
    if (date_type != null) {
      _data.fields.add(MapEntry('date_type', date_type));
    }
    if (started_at != null) {
      _data.fields.add(MapEntry('started_at', started_at));
    }
    if (ended_at != null) {
      _data.fields.add(MapEntry('ended_at', ended_at));
    }
    if (offer_ended_at != null) {
      _data.fields.add(MapEntry('offer_ended_at', offer_ended_at));
    }
    if (repeat_count != null) {
      _data.fields.add(MapEntry('repeat_count', repeat_count.toString()));
    }
    if (channelsIdes != null) {
      _data.files.add(MapEntry(
          'channels[]',
          MultipartFile.fromBytes(
            channelsIdes,
            filename: null,
          )));
    }
    if (attachments != null) {
      _data.files.addAll(attachments.map((i) => MapEntry(
          'attachments[]',
          MultipartFile.fromFileSync(
            i.path,
            filename: i.path.split(Platform.pathSeparator).last,
          ))));
    }
    _data.fields.add(MapEntry('links[]', jsonEncode(links)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateAdvertiseRequestResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/requests',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateAdvertiseRequestResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RequestDetailsResponse> getRequestDetail(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RequestDetailsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/requests/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RequestDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RequestDetailsResponse> deleteLink(id, link_id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'link_id': link_id};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RequestDetailsResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/requests/${id}/delete_link',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RequestDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AdvertiserProfileDetailsResponse> getAdveriserProfileDetail(
      id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AdvertiserProfileDetailsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/advertiser_profile/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AdvertiserProfileDetailsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> getAppCopons(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'copons/app?page=${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> getAdvertisersCopons(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'copons/advertisers?page=${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> getClientsCoponsWhitId(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/copons/clients?page=${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> getClientsCopons(userid, id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/copons/clients?user_id=${userid}&page=${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> getMyCopons(userid, id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/mycopons?page=${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> likeCopon(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/copons/${id}/like',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> dislikeCopon(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/copons/${id}/dislike',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CoponsResponse> select_copons(selectCoponsRequest, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(selectCoponsRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CoponsResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/select_copons',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CoponsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
