// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

import 'Objects/model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7608616296206782918),
      name: 'Party2',
      lastPropertyId: const IdUid(3, 4846114434512186188),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2956109229902477164),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6554245934306255892),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4846114434512186188),
            name: 'tableId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 4200680047655490354),
            relationTarget: 'Table2')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 4613489386952352673),
      name: 'Table2',
      lastPropertyId: const IdUid(2, 3503228508913699242),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3666939304917952137),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3503228508913699242),
            name: 'tableNumber',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 4613489386952352673),
      lastIndexId: const IdUid(1, 4200680047655490354),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Party2: EntityDefinition<Party2>(
        model: _entities[0],
        toOneRelations: (Party2 object) => [object.table],
        toManyRelations: (Party2 object) => {},
        getId: (Party2 object) => object.id,
        setId: (Party2 object, int id) {
          object.id = id;
        },
        objectToFB: (Party2 object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.table.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Party2(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          object.table.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.table.attach(store);
          return object;
        }),
    Table2: EntityDefinition<Table2>(
        model: _entities[1],
        toOneRelations: (Table2 object) => [],
        toManyRelations: (Table2 object) => {},
        getId: (Table2 object) => object.id,
        setId: (Table2 object, int id) {
          object.id = id;
        },
        objectToFB: (Table2 object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.tableNumber);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Table2(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Party2] entity fields to define ObjectBox queries.
class Party2_ {
  /// see [Party2.id]
  static final id = QueryIntegerProperty<Party2>(_entities[0].properties[0]);

  /// see [Party2.name]
  static final name = QueryStringProperty<Party2>(_entities[0].properties[1]);

  /// see [Party2.table]
  static final table =
      QueryRelationToOne<Party2, Table2>(_entities[0].properties[2]);
}

/// [Table2] entity fields to define ObjectBox queries.
class Table2_ {
  /// see [Table2.id]
  static final id = QueryIntegerProperty<Table2>(_entities[1].properties[0]);

  /// see [Table2.tableNumber]
  static final tableNumber =
      QueryIntegerProperty<Table2>(_entities[1].properties[1]);
}