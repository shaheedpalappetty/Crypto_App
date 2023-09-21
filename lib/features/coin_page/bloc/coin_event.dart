part of 'coin_bloc.dart';

abstract class CoinEvent {}

class CoinFetchSuccessEvent extends CoinEvent {}

class CoinWatchlistAddedEvent extends CoinEvent {
  Crypto cryptoObj;
  CoinWatchlistAddedEvent({required this.cryptoObj});
}
