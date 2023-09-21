import 'package:bloc_crypto_coin/features/coin_page/ui/coin_page.dart';
import 'package:bloc_crypto_coin/features/watchlist/ui/watchlist.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 37),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 13, 37),
          title: const Text('Crypto Coin'),
          centerTitle: true,
        ),
        body: const SafeArea(
            child: Column(
          children: [
            TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                text: 'Coin',
              ),
              Tab(
                text: 'Watchlist',
              )
            ]),
            Expanded(child: TabBarView(children: [CoinPage(), WatchlistPage()]))
          ],
        )),
      ),
    );
  }
}
