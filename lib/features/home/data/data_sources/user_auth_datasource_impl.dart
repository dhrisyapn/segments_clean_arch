import 'dart:developer';

import 'package:segments_clean_arch/core/services/api_services.dart';
import 'package:segments_clean_arch/features/home/data/data_sources/user_auth_datasource_interface.dart';
import 'package:segments_clean_arch/features/home/data/model/segment_response.dart';
import 'package:segments_clean_arch/features/home/domain/entities/segment_response_entity.dart';

class UserAuthDataSourceImpl implements UserAuthDataSource {
  @override
  Future<List<SegmentResponseEntity>> getSegments() async {
    final data = await ApiServices.get(
      '/v2/segments',
      queryParameters: {'client_id': '21'},
    );
    log(data.toString());
    if (data is List) {
      final List<SegmentResponseEntity> segments = data
          .map((e) => SegmentResponseModel.fromJson(e as Map<String, dynamic>))
          .toList();
      log(segments.toString());
      return segments;
    } else if (data is Map && data.containsKey('error')) {
      throw Exception(data['error'] ?? 'Unknown API error');
    }
    return [];
  }
}
