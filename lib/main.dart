import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMTI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true; // Status untuk menyembunyikan atau menampilkan password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            const Text(
              'SIMTI',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 40),

            // Email Input
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'abc@email.com',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),

            // Password Input
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Your password',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword; // Toggle password visibility
                    });
                  },
                ),
              ),
              obscureText: obscurePassword,
            ),
            const SizedBox(height: 20),

            // Remember Me Switch
            Row(
              children: <Widget>[
                Switch(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
                const Text('Remember Me'),
              ],
            ),
            const SizedBox(height: 20),

            // Sign In Button with Arrow
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () {
                  // Logic when sign in button is pressed
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10), // Spasi antara teks dan ikon
                    Icon(
                      Icons.arrow_forward, // Ikon panah
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OR Text
            const Text(
              'OR',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Google Sign-In Button (Placeholder)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Logic for Google Sign-In
                },
                icon: Image(
                  image: NetworkImage(
                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                  ),
                  width: 24,
                  height: 24,
                ),
                label: const Text('Login with Google'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Sign Up Text
            GestureDetector(
              onTap: () {
                // Logic for signing up
              },
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
