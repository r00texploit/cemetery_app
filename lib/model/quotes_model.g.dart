// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'text': instance.text,
    };
