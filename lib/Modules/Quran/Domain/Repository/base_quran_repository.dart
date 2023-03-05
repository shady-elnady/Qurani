import 'package:dartz/dartz.dart';

import '../../../../App/Exceptions/failure.dart';
import '../Entities/sora.dart';

abstract class BaseQuranRepository {
  Future<Either<Failure, List<Sora>>> getIndex();
}
