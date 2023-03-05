import 'package:dartz/dartz.dart';

import '../../../../App/Exceptions/exceptions.dart';
import '../../../../App/Exceptions/failure.dart';
import '../../../../App/Services/network_services.dart';
import '../../../../App/Utils/Strings/messages.dart';
import '../../Domain/Entities/sora.dart';
import '../../Domain/Repository/base_quran_repository.dart';
import '../Data_Source/quran_local_data_source.dart';
import '../Data_Source/quran_remote_data_source.dart';
import '../Models/sora_model.dart';

class QuranRepositoryImp implements BaseQuranRepository {
  final BaseQuranRemoteDataSource remoteQuranDataSource;
  final QuranLocalDataSource localQuranDataSource;
  final NetworkInfo networkService;

  QuranRepositoryImp({
    required this.remoteQuranDataSource,
    required this.localQuranDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<Sora>>> getIndex() async {
    if (await networkService.isConnected) {
      try {
        List<SoraModel> remoteIndex = await remoteQuranDataSource.getIndex();
        localQuranDataSource.cacheIndex(remoteIndex);
        return Right(remoteIndex);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(
            message: failure.errorMessageModel?.statusMessage,
          ),
        );
      }
    } else {
      try {
        List<SoraModel> localIndex =
            await localQuranDataSource.getCachedIndex();
        return Right(localIndex);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            message: Meassages.emptyCacheData,
          ),
        );
      }
    }
  }
}
