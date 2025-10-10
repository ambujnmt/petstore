import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          // zoom + scroll dono allow karega
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/catrgories.png",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  // Loader dikhane ke liye
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
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
