class NominatimSearchResult {
  final double lat;
  final double lon;
  final String displayName;

  const NominatimSearchResult({
    required this.lat,
    required this.lon,
    required this.displayName,
  });

  factory NominatimSearchResult.fromJson(Map<String, dynamic> json) {
    return NominatimSearchResult(
      lat: double.parse(json['lat'] as String),
      lon: double.parse(json['lon'] as String),
      displayName: json['display_name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'lat': lat.toString(),
    'lon': lon.toString(),
    'display_name': displayName,
  };
}
