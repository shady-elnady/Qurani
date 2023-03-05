part of 'index_bloc.dart';

abstract class IndexState extends Equatable {
  const IndexState();

  @override
  List<Object> get props => [];
}

class InitialIndexState extends IndexState {}

class LoadingIndexState extends IndexState {}

class LoadedIndexState extends IndexState {
  final List<Sora> souarList;

  const LoadedIndexState({
    required this.souarList,
  });

  @override
  List<Object> get props => [
        souarList,
      ];
}

class ErrorIndexState extends IndexState {
  final String message;

  const ErrorIndexState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
