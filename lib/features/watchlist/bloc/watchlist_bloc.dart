import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_crypto_coin/features/watchlist/data/watched_listdata.dart';
import 'package:bloc_crypto_coin/model/crypto_model.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<WishlistSuccessLoadedEvent>(wishlistSuccessLoadedEvent);
    on<WishlistRemovedEvent>(wishlistRemovedEvent);
  }

  FutureOr<void> wishlistSuccessLoadedEvent(
      WishlistSuccessLoadedEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchLists: watchList));
  }

  FutureOr<void> wishlistRemovedEvent(
      WishlistRemovedEvent event, Emitter<WatchlistState> emit) {
    int index = event.index;
    watchList.removeAt(index);
    emit(WatchlistRemovedMessage());
  }
}
