import 'dart:developer';

import 'package:segments_clean_arch/core/services/api_services.dart';
import 'package:segments_clean_arch/core/services/deviceid_service.dart';
import 'package:segments_clean_arch/features/signup/data/data_source/signup_data_sourece_interface.dart';
import 'package:segments_clean_arch/features/signup/data/model/signup_response.dart';
import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';

class SignupDataSourceImpl implements SignupDataSource {
  @override
  Future<SignupResponseEntity> signup(
    String name,
    String email,
    String mobile,
    String password,
    String selectedSegment,
  ) async {
    String? deviceId = await DeviceidService().getDeviceId();
    final response = await ApiServices.post(
      '/users/register',
      body: {
        'default_segment_id': selectedSegment,
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'client_id': "21",
        'device_id': deviceId ?? '',
        'device_type': 'android',
        'mobile': mobile,
        'country_code': '+91',
      },
    );
    log(response.toString());
    try {
      return SignupResponseModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
