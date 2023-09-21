part of 'watchlist_bloc.dart';

abstract class WatchlistState {}

abstract class WatchlistActionState extends WatchlistState {}

final class WatchlistInitial extends WatchlistState {}

final class WatchlistSuccessState extends WatchlistState {
  List<Crypto> watchLists;
  WatchlistSuccessState({required this.watchLists});
}

final class WatchlistRemovedMessage extends WatchlistActionState {}
