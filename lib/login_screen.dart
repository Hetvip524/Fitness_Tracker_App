import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final void Function(bool)? onThemeChanged;
  final bool isDarkMode;
  const LoginScreen({Key? key, this.onThemeChanged, this.isDarkMode = false}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> _getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString('users');
    if (usersString == null) return {};
    try {
      final Map<String, dynamic> users = Map<String, dynamic>.from(
        (usersString.isNotEmpty) ? Map<String, dynamic>.from(Uri.decodeComponent(usersString).codeUnits.asMap()) : {}
      );
      return users;
    } catch (_) {
      return {};
    }
  }

  Future<void> _saveUsers(Map<String, dynamic> users) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('users', users.toString());
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final name = _isLogin ? email.split('@').first : _nameController.text.trim();
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString('users');
    Map<String, dynamic> users = {};
    if (usersString != null && usersString.isNotEmpty) {
      try {
        users = Map<String, dynamic>.from(Uri.decodeComponent(usersString).codeUnits.asMap());
      } catch (_) {
        users = {};
      }
    }
    if (_isLogin) {
      if (!users.containsKey(email) || users[email]['password'] != password) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Invalid email or password.';
        });
        return;
      }
      // Login success
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            name: users[email]['name'],
            email: email,
            onThemeChanged: widget.onThemeChanged,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    } else {
      if (users.containsKey(email)) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Email already registered.';
        });
        return;
      }
      users[email] = {'name': name, 'password': password};
      prefs.setString('users', users.toString());
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            name: name,
            email: email,
            onThemeChanged: widget.onThemeChanged,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _isLogin ? 'Welcome Back!' : 'Create Account',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2193b0),
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (_errorMessage != null) ...[
                        Text(_errorMessage!, style: TextStyle(color: Colors.red)),
                        SizedBox(height: 16),
                      ],
                      if (!_isLogin) ...[
                        TextFormField(
                          controller: _nameController,
                          decoration: _buildInputDecoration('Full Name', Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                      TextFormField(
                        controller: _emailController,
                        decoration: _buildInputDecoration('Email', Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: _buildInputDecoration('Password', Icons.lock),
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2193b0),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  _isLogin ? 'Login' : 'Sign Up',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                  _errorMessage = null;
                                });
                              },
                        child: Text(
                          _isLogin ? 'Don\'t have an account? Sign Up' : 'Already have an account? Login',
                          style: GoogleFonts.poppins(color: Colors.grey[600]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData prefixIcon) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(),
      prefixIcon: Icon(prefixIcon),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}