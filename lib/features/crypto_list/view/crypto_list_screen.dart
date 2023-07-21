import 'dart:async';

import 'package:first_project/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc =
      CryptoListBloc(GetIt.instance<CryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        // leading: const Icon(Icons.arrow_back),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  });
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong.',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try again later.',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  TextButton(onPressed: () {
                    _cryptoListBloc.add(LoadCryptoList());
                  }, child: const Text('Try again'))
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),

      // (_cryptoCoinsList == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinsList!.length,
      //         separatorBuilder: (context, index) => const Divider(),
      //         itemBuilder: (context, i) {
      //           final coin = _cryptoCoinsList![i];
      //           return CryptoCoinTile(coin: coin);
      //         }),
    );
  }
}
