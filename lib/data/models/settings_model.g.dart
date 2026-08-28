// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsModelCollection on Isar {
  IsarCollection<SettingsModel> get settingsModels => this.collection();
}

const SettingsModelSchema = CollectionSchema(
  name: r'SettingsModel',
  id: 4013777327486952906,
  properties: {
    r'accentColor': PropertySchema(
      id: 0,
      name: r'accentColor',
      type: IsarType.long,
    ),
    r'autoPlay': PropertySchema(
      id: 1,
      name: r'autoPlay',
      type: IsarType.bool,
    ),
    r'autoScan': PropertySchema(
      id: 2,
      name: r'autoScan',
      type: IsarType.bool,
    ),
    r'continueLastPlayback': PropertySchema(
      id: 3,
      name: r'continueLastPlayback',
      type: IsarType.bool,
    ),
    r'excludedFolders': PropertySchema(
      id: 4,
      name: r'excludedFolders',
      type: IsarType.stringList,
    ),
    r'lastPlaylistId': PropertySchema(
      id: 5,
      name: r'lastPlaylistId',
      type: IsarType.long,
    ),
    r'lastPosition': PropertySchema(
      id: 6,
      name: r'lastPosition',
      type: IsarType.long,
    ),
    r'lastQueueIds': PropertySchema(
      id: 7,
      name: r'lastQueueIds',
      type: IsarType.longList,
    ),
    r'lastScanTime': PropertySchema(
      id: 8,
      name: r'lastScanTime',
      type: IsarType.dateTime,
    ),
    r'lastSongId': PropertySchema(
      id: 9,
      name: r'lastSongId',
      type: IsarType.long,
    ),
    r'repeatMode': PropertySchema(
      id: 10,
      name: r'repeatMode',
      type: IsarType.long,
    ),
    r'scanCount': PropertySchema(
      id: 11,
      name: r'scanCount',
      type: IsarType.long,
    ),
    r'showLyrics': PropertySchema(
      id: 12,
      name: r'showLyrics',
      type: IsarType.bool,
    ),
    r'shuffleEnabled': PropertySchema(
      id: 13,
      name: r'shuffleEnabled',
      type: IsarType.bool,
    ),
    r'sortOrder': PropertySchema(
      id: 14,
      name: r'sortOrder',
      type: IsarType.long,
    ),
    r'themeMode': PropertySchema(
      id: 15,
      name: r'themeMode',
      type: IsarType.long,
    )
  },
  estimateSize: _settingsModelEstimateSize,
  serialize: _settingsModelSerialize,
  deserialize: _settingsModelDeserialize,
  deserializeProp: _settingsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsModelGetId,
  getLinks: _settingsModelGetLinks,
  attach: _settingsModelAttach,
  version: '3.1.0+1',
);

int _settingsModelEstimateSize(
  SettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.excludedFolders.length * 3;
  {
    for (var i = 0; i < object.excludedFolders.length; i++) {
      final value = object.excludedFolders[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.lastQueueIds.length * 8;
  return bytesCount;
}

void _settingsModelSerialize(
  SettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accentColor);
  writer.writeBool(offsets[1], object.autoPlay);
  writer.writeBool(offsets[2], object.autoScan);
  writer.writeBool(offsets[3], object.continueLastPlayback);
  writer.writeStringList(offsets[4], object.excludedFolders);
  writer.writeLong(offsets[5], object.lastPlaylistId);
  writer.writeLong(offsets[6], object.lastPosition);
  writer.writeLongList(offsets[7], object.lastQueueIds);
  writer.writeDateTime(offsets[8], object.lastScanTime);
  writer.writeLong(offsets[9], object.lastSongId);
  writer.writeLong(offsets[10], object.repeatMode);
  writer.writeLong(offsets[11], object.scanCount);
  writer.writeBool(offsets[12], object.showLyrics);
  writer.writeBool(offsets[13], object.shuffleEnabled);
  writer.writeLong(offsets[14], object.sortOrder);
  writer.writeLong(offsets[15], object.themeMode);
}

SettingsModel _settingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsModel();
  object.accentColor = reader.readLong(offsets[0]);
  object.autoPlay = reader.readBool(offsets[1]);
  object.autoScan = reader.readBool(offsets[2]);
  object.continueLastPlayback = reader.readBool(offsets[3]);
  object.excludedFolders = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.lastPlaylistId = reader.readLongOrNull(offsets[5]);
  object.lastPosition = reader.readLongOrNull(offsets[6]);
  object.lastQueueIds = reader.readLongList(offsets[7]) ?? [];
  object.lastScanTime = reader.readDateTimeOrNull(offsets[8]);
  object.lastSongId = reader.readLongOrNull(offsets[9]);
  object.repeatMode = reader.readLong(offsets[10]);
  object.scanCount = reader.readLong(offsets[11]);
  object.showLyrics = reader.readBool(offsets[12]);
  object.shuffleEnabled = reader.readBool(offsets[13]);
  object.sortOrder = reader.readLong(offsets[14]);
  object.themeMode = reader.readLong(offsets[15]);
  return object;
}

P _settingsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongList(offset) ?? []) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsModelGetId(SettingsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsModelGetLinks(SettingsModel object) {
  return [];
}

void _settingsModelAttach(
    IsarCollection<dynamic> col, Id id, SettingsModel object) {
  object.id = id;
}

extension SettingsModelQueryWhereSort
    on QueryBuilder<SettingsModel, SettingsModel, QWhere> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsModelQueryWhere
    on QueryBuilder<SettingsModel, SettingsModel, QWhereClause> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsModelQueryFilter
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      accentColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      accentColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      accentColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      accentColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accentColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      autoPlayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoPlay',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      autoScanEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoScan',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      continueLastPlaybackEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'continueLastPlayback',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'excludedFolders',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'excludedFolders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'excludedFolders',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedFolders',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'excludedFolders',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      excludedFoldersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedFolders',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPlaylistId',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPlaylistId',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPlaylistId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPlaylistId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPlaylistId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPlaylistIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPlaylistId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPosition',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPosition',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPosition',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastQueueIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastQueueIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastQueueIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastQueueIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastQueueIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lastQueueIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastScanTime',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastScanTime',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastScanTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastScanTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastScanTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastScanTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastScanTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSongId',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSongId',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSongId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSongId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSongId',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lastSongIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSongId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      repeatModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      repeatModeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeatMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      repeatModeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeatMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      repeatModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeatMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      scanCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scanCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      scanCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scanCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      scanCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scanCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      scanCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scanCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      showLyricsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showLyrics',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      shuffleEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shuffleEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      sortOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      sortOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      sortOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      sortOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeModeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeModeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsModelQueryObject
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQueryLinks
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQuerySortBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByAutoPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPlay', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoPlayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPlay', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByAutoScan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScan', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoScanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScan', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByContinueLastPlayback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continueLastPlayback', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByContinueLastPlaybackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continueLastPlayback', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlaylistId', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlaylistId', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPosition', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPosition', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastScanTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastScanTime', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastScanTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastScanTime', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByLastSongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSongId', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLastSongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSongId', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByRepeatMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByRepeatModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByScanCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanCount', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByScanCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanCount', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByShowLyrics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLyrics', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByShowLyricsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLyrics', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByShuffleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shuffleEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByShuffleEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shuffleEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension SettingsModelQuerySortThenBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortThenBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByAutoPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPlay', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoPlayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPlay', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByAutoScan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScan', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoScanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoScan', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByContinueLastPlayback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continueLastPlayback', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByContinueLastPlaybackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'continueLastPlayback', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlaylistId', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlaylistId', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPosition', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPosition', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastScanTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastScanTime', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastScanTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastScanTime', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByLastSongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSongId', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLastSongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSongId', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByRepeatMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByRepeatModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByScanCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanCount', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByScanCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scanCount', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByShowLyrics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLyrics', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByShowLyricsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLyrics', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByShuffleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shuffleEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByShuffleEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shuffleEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension SettingsModelQueryWhereDistinct
    on QueryBuilder<SettingsModel, SettingsModel, QDistinct> {
  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColor');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByAutoPlay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoPlay');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByAutoScan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoScan');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByContinueLastPlayback() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'continueLastPlayback');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByExcludedFolders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'excludedFolders');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLastPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPlaylistId');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLastPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPosition');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLastQueueIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastQueueIds');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLastScanTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastScanTime');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByLastSongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSongId');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByRepeatMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatMode');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByScanCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scanCount');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByShowLyrics() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showLyrics');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByShuffleEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shuffleEnabled');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode');
    });
  }
}

extension SettingsModelQueryProperty
    on QueryBuilder<SettingsModel, SettingsModel, QQueryProperty> {
  QueryBuilder<SettingsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> accentColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColor');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> autoPlayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoPlay');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> autoScanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoScan');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations>
      continueLastPlaybackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'continueLastPlayback');
    });
  }

  QueryBuilder<SettingsModel, List<String>, QQueryOperations>
      excludedFoldersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'excludedFolders');
    });
  }

  QueryBuilder<SettingsModel, int?, QQueryOperations> lastPlaylistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlaylistId');
    });
  }

  QueryBuilder<SettingsModel, int?, QQueryOperations> lastPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPosition');
    });
  }

  QueryBuilder<SettingsModel, List<int>, QQueryOperations>
      lastQueueIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastQueueIds');
    });
  }

  QueryBuilder<SettingsModel, DateTime?, QQueryOperations>
      lastScanTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastScanTime');
    });
  }

  QueryBuilder<SettingsModel, int?, QQueryOperations> lastSongIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSongId');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> repeatModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatMode');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> scanCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scanCount');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> showLyricsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showLyrics');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> shuffleEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shuffleEnabled');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }
}
