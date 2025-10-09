import 'package:flutter/material.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer( // zoom + scroll dono allow karega
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/details_page.png",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  // Loader dikhane ke liye
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: frame != null
                          ? child
                          : const SizedBox(
                        height: 300,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
