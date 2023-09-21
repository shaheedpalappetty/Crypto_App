part of 'watchlist_bloc.dart';

abstract class WatchlistEvent {}

final class WishlistRemovedEvent extends WatchlistEvent {
  int index;
  WishlistRemovedEvent({required this.index});
}

final class WishlistSuccessLoadedEvent extends WatchlistEvent {}
