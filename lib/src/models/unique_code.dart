import 'package:json_annotation/json_annotation.dart';

part 'unique_code.g.dart';

@JsonSerializable()
class UniqueCode {
  @JsonKey(name: '_id')
  String? id;
  String? deviceIp;
  String? verifyTime;
  bool? isVerified;
  String? code;
  String? productId;

  UniqueCode({
    this.id,
    this.deviceIp,
    this.verifyTime,
    this.isVerified,
    this.code,
    this.productId,
  });

  factory UniqueCode.fromJson(Map<String, dynamic> json) =>
      _$UniqueCodeFromJson(json);

  Map<String, dynamic> toJson() => _$UniqueCodeToJson(this);
}
