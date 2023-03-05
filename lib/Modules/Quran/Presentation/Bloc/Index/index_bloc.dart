import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quran/Modules/Quran/Domain/Use_Cases/get_index_usecase.dart';

import '../../../../../App/Exceptions/failure.dart';
import '../../../../../App/Models/base_usecase.dart';
import '../../../Domain/Entities/sora.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  final GetIndexUseCase getIndexUseCase;
  IndexBloc({
    required this.getIndexUseCase,
  }) : super(InitialIndexState()) {
    on<IndexEvent>((event, emit) async {
      if (event is GetIndexEvent) {
        emit(LoadingIndexState());

        final failureOrIndex =
            await getIndexUseCase(parameters: const NoParameters());
        emit(_mapFailureOrIndexToState(failureOrIndex));
      } else if (event is RefreshIndexEvent) {
        emit(LoadingIndexState());

        final failureOrIndex =
            await getIndexUseCase(parameters: const NoParameters());
        emit(_mapFailureOrIndexToState(failureOrIndex));
      }
    });
  }

  IndexState _mapFailureOrIndexToState(Either<Failure, List<Sora>> either) {
    return either.fold(
      (failure) => ErrorIndexState(
          message: FailureToMessage.call(
        failure: failure,
      )),
      (souarList) => LoadedIndexState(
        souarList: souarList,
      ),
    );
  }
}
