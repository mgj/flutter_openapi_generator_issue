// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger_works.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SwaggerWorks extends SwaggerWorks {
  _$SwaggerWorks([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SwaggerWorks;

  @override
  Future<Response<MyMapImage>> _restMapImageGet({String? xApiVersion}) {
    final Uri $url = Uri.parse('/rest/mapImage');
    final Map<String, String> $headers = {
      if (xApiVersion != null) 'X-ApiVersion': xApiVersion,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MyMapImage, MyMapImage>($request);
  }
}
