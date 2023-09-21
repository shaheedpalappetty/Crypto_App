import 'package:bloc_crypto_coin/features/coin_page/bloc/coin_bloc.dart';
import 'package:bloc_crypto_coin/features/coin_page/ui/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  void initState() {
    context.read<CoinBloc>().add(CoinFetchSuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 37),
      body: BlocConsumer<CoinBloc, CoinState>(
        listenWhen: (previous, current) => current is CoinActionState,
        buildWhen: (previous, current) => current is! CoinActionState,
        listener: (context, state) {
          if (state is CoinWatchListAddedMessageState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 1, 198, 106),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                content: Text(
                  'Added to Wishlist',
                )));
          }
        },
        builder: (context, state) {
          if (state is CoinSuccessState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.cryptoList.length,
              itemBuilder: (context, index) {
                return CoinWidget(cryptoCoin: state.cryptoList[index]);
              },
            );
          } else if (state is CoinLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinErrorState) {
            return const Center(
              child: Text(
                'Error Occured Fetchind Data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
