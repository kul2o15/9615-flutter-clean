import 'package:equatable/equatable.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/geo.dart';

class Address extends Equatable {
  final String streetEntity, suiteEntity, zipcodeEntity, cityEntity;
  final Geo geoEntity;

  const Address(this.streetEntity, this.cityEntity, this.suiteEntity,
      this.zipcodeEntity, this.geoEntity);

  @override
  List<Object?> get props => [
        streetEntity,
        suiteEntity,
        zipcodeEntity,
        cityEntity,
        geoEntity,
      ];
}
