class SegmentResponseEntity {
  final int? id;
  final String? name;
  final String? description;
  final String? tumbnail;
  final int? clientId;
  final int? published;
  final String? parentId;
  final int? order;
  final List<SubSegmentResponseEntity>? subSegments;
  SegmentResponseEntity({
    this.id,
    this.name,
    this.description,
    this.tumbnail,
    this.clientId,
    this.published,
    this.parentId,
    this.order,
    this.subSegments,
  });
}

class SubSegmentResponseEntity {
  final int? id;
  final String? name;
  final String? description;
  final String? tumbnail;
  final int? clientId;
  final int? published;
  final String? parentId;
  final int? order;

  SubSegmentResponseEntity({
    this.id,
    this.name,
    this.description,
    this.tumbnail,
    this.clientId,
    this.published,
    this.parentId,
    this.order,
  });
}

class SegmentData {
  final List<SegmentResponseEntity> segments;
  final bool isLoading;
  final String? error;
  final bool isNoInternet;

  SegmentData({
    required this.segments,
    this.isLoading = true,
    this.error,
    this.isNoInternet = false,
  });

  SegmentData copyWith({
    List<SegmentResponseEntity>? segments,
    bool? isLoading,
    String? error,
    bool? isNoInternet,
  }) {
    return SegmentData(
      segments: segments ?? this.segments,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isNoInternet: isNoInternet ?? false,
    );
  }
}
