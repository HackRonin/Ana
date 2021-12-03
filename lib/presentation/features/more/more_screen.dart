import 'package:flutter/material.dart';

import 'components/more_body.dart';

class MoreScreen extends StatelessWidget{
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: MoreBody(),
   );
  }

}