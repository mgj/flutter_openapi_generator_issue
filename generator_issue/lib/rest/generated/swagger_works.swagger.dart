// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;

part 'swagger_works.swagger.chopper.dart';
part 'swagger_works.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class SwaggerWorks extends ChopperService {
  static SwaggerWorks create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$SwaggerWorks(client);
    }

    final newClient = ChopperClient(
        services: [_$SwaggerWorks()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$SwaggerWorks(newClient);
  }

  ///Get the map image
  ///@param X-ApiVersion The used API version. Either a specific version or "latest" for the latest version of the API.
  Future<chopper.Response<MyMapImage>> restMapImageGet({String? xApiVersion}) {
    generatedMapping.putIfAbsent(MyMapImage, () => MyMapImage.fromJsonFactory);

    return _restMapImageGet(xApiVersion: xApiVersion);
  }

  ///Get the map image
  ///@param X-ApiVersion The used API version. Either a specific version or "latest" for the latest version of the API.
  @Get(path: '/rest/mapImage')
  Future<chopper.Response<MyMapImage>> _restMapImageGet(
      {@Header('X-ApiVersion') String? xApiVersion});
}

@JsonSerializable(explicitToJson: true)
class MyMapImage {
  MyMapImage({
    required this.url,
  });

  factory MyMapImage.fromJson(Map<String, dynamic> json) =>
      _$MyMapImageFromJson(json);

  @JsonKey(name: 'url')
  final String url;
  static const fromJsonFactory = _$MyMapImageFromJson;
  static const toJsonFactory = _$MyMapImageToJson;
  Map<String, dynamic> toJson() => _$MyMapImageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyMapImage &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^ runtimeType.hashCode;
}

extension $MyMapImageExtension on MyMapImage {
  MyMapImage copyWith({String? url}) {
    return MyMapImage(url: url ?? this.url);
  }

  MyMapImage copyWithWrapped({Wrapped<String>? url}) {
    return MyMapImage(url: (url != null ? url.value : this.url));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
