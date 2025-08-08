import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Image.asset('assets/images/avocado.png'),
            ),
            Text(
              'We deliver grocery at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 64,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Grocer offers you fresh vegetables and fruits. \nOrder from grocer now',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: HomePage(),
                  );
                },
              )),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFF6558CA),
                ),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
