import 'package:drift/drift.dart';

import '../../../domain/models/model.dart';

abstract class DriftMapper<
  M extends Model,
  D extends DataClass,
  C extends UpdateCompanion<D>
> {
  M fromDataClass(D dataClass);

  C toCompanion(M model);
}
