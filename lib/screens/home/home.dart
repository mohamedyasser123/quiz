import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzed/providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthProvider _authProvider = AuthProvider();
  final User? loggedInUser = AuthProvider().loggedInUser;

  Future<void> signOut() async {
    await _authProvider.signOut();
    navigateToWelcomeScreen();
  }

  void navigateToWelcomeScreen() =>
      Navigator.pushNamedAndRemoveUntil(context, '/Welcome', (route) => false);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _authProvider.getFireStoreUser(),
        builder: (context, snapshot) {
          bool isLoading = snapshot.connectionState == ConnectionState.waiting;
          if (isLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ${loggedInUser?.email ?? 'Professor ${loggedInUser?.email}'}',
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      OutlinedButton(
                        onPressed: () => signOut(),
                        child: Text('Sign out',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/courses'),
                        child: Text('View courses',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/addCourse'),
                        child: Text('Add new course',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
