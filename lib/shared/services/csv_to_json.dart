import 'dart:convert';

import '../models/json.dart';

List<Json> csvToJsonList(String csvString) {
  final jsonList = <Json>[];
  const splitter = LineSplitter();
  final lines = splitter.convert(csvString);
  // The headers from the first line of the csv.
  final keys = lines.first.split(',');
  // Skip the header and iterate over the lines.
  for (final line in lines.skip(1)) {
    final item = <String, dynamic>{};
    //Add value with the corresponding key.
    final values = line.split(',');
    for (var i = 0; i < keys.length; i++) {
      item[keys[i]] = values[i];
    }
    jsonList.add(item);
  }
  return jsonList;
}
