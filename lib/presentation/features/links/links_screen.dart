import 'package:flutter/material.dart';

import 'components/links_body.dart';

class LinksScreen extends StatelessWidget{
  const LinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: LinksBody(),
   );
  }

}