part of 'coin_bloc.dart';

abstract class CoinState {}

abstract class CoinActionState extends CoinState {}

final class CoinInitial extends CoinState {}

final class CoinLoadingState extends CoinState {}

final class CoinSuccessState extends CoinState {
  List<Crypto> cryptoList = [];
  CoinSuccessState({required this.cryptoList});
}

final class CoinErrorState extends CoinState {}

final class CoinWatchListAddedMessageState extends CoinActionState {

}
