part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({
    required this.coinsList,
  });
  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}
