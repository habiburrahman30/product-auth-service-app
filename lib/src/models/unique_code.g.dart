// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniqueCode _$UniqueCodeFromJson(Map<String, dynamic> json) {
  return UniqueCode(
    id: json['_id'] as String?,
    deviceIp: json['deviceIp'] as String?,
    verifyTime: json['verifyTime'] as String?,
    isVerified: json['isVerified'] as bool?,
    code: json['code'] as String?,
    productId: json['productId'] as String?,
  );
}

Map<String, dynamic> _$UniqueCodeToJson(UniqueCode instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'deviceIp': instance.deviceIp,
      'verifyTime': instance.verifyTime,
      'isVerified': instance.isVerified,
      'code': instance.code,
      'productId': instance.productId,
    };
