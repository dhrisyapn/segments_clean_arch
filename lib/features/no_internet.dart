import 'package:flutter/material.dart';

import 'package:segments_clean_arch/core/services/network_service.dart';
import 'package:segments_clean_arch/main.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternet({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No Internet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  onRetry ??
                  () async {
                    final hasInternet =
                        await NetworkService().hasInternetConnection;

                    // 2. If available, go back to previous page
                    if (hasInternet && navigatorKey.currentState!.canPop()) {
                      navigatorKey.currentState!.pop(true);
                    }
                  },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
