import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _navigateToChat(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            const SizedBox(height: 100,),
            // --- Email Section ---
            Text(
              'Your Email',
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            myTextFormField("Enter your email"),

            const SizedBox(height: 12),

            // Password section
            Text(
              'Password',
              style: TextStyle(
                color: Color(0xFF2A2A2A),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),
            myTextFormField("Enter your password"),
            
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
const SizedBox(height: 6),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _navigateToChat(context),
              child: const Text('Login'),
            ),
            const SizedBox(height: 35,),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 60,
                    endIndent: 20,
                  ),
                ),
                Text("or"),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 60,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35,),
            myloginButton("assets/images/appleLogo.png", " Login with Apple" ),
            const SizedBox(height: 8,),
            myloginButton("assets/images/googleLogo.png", " Login with Google" ),
            
            const SizedBox(height: 50,),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color(0xFF989898),
                  ), 
                  children: <InlineSpan>[
                    TextSpan(text: "Don't have and account? "),
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      )
                    )
                  ]
                )
                ),
            ),
          ],
        ),
      ),
    );
  }

  Padding myloginButton(String image, String text) {
    return Padding(
            padding: EdgeInsets.all(2),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 255, 255, 255),
                ) ,
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Adjust border radius as needed
                    side: BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 24,
                    width: 24,
                  ),
                  Text(text,
                  style: TextStyle(
                     color: Color(0xFF2A2A2A),
                     fontWeight: FontWeight.w600,
                  ),
                  ),
                ],
              ),
            ),
          );
  }

  Container myTextFormField(String hintText) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 255, 255, 255),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),

            borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 2.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFB3B3B3)),
        ),
      ),
    );
  }
}
