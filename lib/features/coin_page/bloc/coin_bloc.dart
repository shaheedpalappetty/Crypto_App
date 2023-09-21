import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_crypto_coin/features/coin_page/repository/api_services.dart';
import 'package:bloc_crypto_coin/features/watchlist/data/watched_listdata.dart';
import 'package:bloc_crypto_coin/model/crypto_model.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<CoinFetchSuccessEvent>(coinFetchSuccessEvent);
    on<CoinWatchlistAddedEvent>(coinWatchlistAddedEvent);
  }

  FutureOr<void> coinFetchSuccessEvent(
      CoinFetchSuccessEvent event, Emitter<CoinState> emit) async {
    emit(CoinLoadingState());
    final crypto = await CryptoApi.fetchData();
    if (crypto.isNotEmpty) {
      emit(CoinSuccessState(cryptoList: crypto));
    } else {
      emit(CoinErrorState());
    }
  }

  FutureOr<void> coinWatchlistAddedEvent(
      CoinWatchlistAddedEvent event, Emitter<CoinState> emit) {
    watchList.add(event.cryptoObj);
   
    emit(CoinWatchListAddedMessageState());
  }
}
