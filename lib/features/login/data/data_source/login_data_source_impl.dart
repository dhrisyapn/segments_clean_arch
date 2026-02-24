import 'dart:io';

import 'package:segments_clean_arch/core/services/api_services.dart';
import 'package:segments_clean_arch/core/services/deviceid_service.dart';
import 'package:segments_clean_arch/features/login/data/data_source/login_data_source_interface.dart';
import 'package:segments_clean_arch/features/login/data/model/login_response.dart';
import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginResponseEntity> login(
    String mobile,
    String password,
    String countryCode,
  ) async {
    String? deviceId = await DeviceidService().getDeviceId();
    final response = await ApiServices.post(
      '/v2/auth/login',
      body: {
        'mobile': mobile,
        'client_id': '21',
        'device_id': deviceId ?? '',
        'device_type': Platform.isIOS ? 'ios' : 'android',
        'password': password,
        'country_code': countryCode,
      },
    );

    try {
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
