import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segments_clean_arch/core/services/snackbar_service.dart';

import 'package:segments_clean_arch/features/login/presentation/provider/login_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneNumber = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumber.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _phoneNumber,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    final phone = _phoneNumber.text.trim();
                    final password = _passwordController.text.trim();

                    if (phone.isEmpty || password.isEmpty) {
                      SnackbarService.showError(
                        'Please fill all the text fields',
                      );
                      return;
                    }

                    final countryCode = '+91';
                    await ref
                        .read(loginDataProvider.notifier)
                        .login(phone, password, countryCode);

                    if (!context.mounted) return;

                    final state = ref.read(loginDataProvider);
                    if (state.error != null) {
                      SnackbarService.showError(state.error.toString());
                    } else if (!state.isNoInternet) {
                      SnackbarService.showSuccess('Login successful');
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
