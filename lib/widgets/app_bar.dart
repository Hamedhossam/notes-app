import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset("assets/images/noteIcon.png", height: 35),
          const Text("MY Notes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
