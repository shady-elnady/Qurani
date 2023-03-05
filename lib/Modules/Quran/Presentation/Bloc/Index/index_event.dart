part of 'index_bloc.dart';

abstract class IndexEvent extends Equatable {
  const IndexEvent();

  @override
  List<Object> get props => [];
}

class RefreshIndexEvent extends IndexEvent {}

class GetIndexEvent extends IndexEvent {}
