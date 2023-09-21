import 'package:bloc_crypto_coin/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:bloc_crypto_coin/features/watchlist/ui/watchlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(WishlistSuccessLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 37),
        body: BlocConsumer<WatchlistBloc, WatchlistState>(
          listenWhen: (previous, current) => current is WatchlistActionState,
          buildWhen: (previous, current) => current is! WatchlistActionState,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WatchlistSuccessState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.watchLists.length,
                itemBuilder: (context, index) {
                  return WatchlistWidget(
                    cryptoCoin: state.watchLists[index],
                    index: index,
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
