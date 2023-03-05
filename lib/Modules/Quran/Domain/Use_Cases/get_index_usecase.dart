import 'package:dartz/dartz.dart';

import '../../../../App/Exceptions/failure.dart';
import '../../../../App/Models/base_usecase.dart';
import '../Entities/sora.dart';
import '../Repository/base_quran_repository.dart';

class GetIndexUseCase extends BaseUseCase<List<Sora>, NoParameters> {
  final BaseQuranRepository baseQuranRepository;

  GetIndexUseCase(this.baseQuranRepository);

  @override
  Future<Either<Failure, List<Sora>>> call({
    required NoParameters parameters,
  }) async {
    return await baseQuranRepository.getIndex();
  }
}
