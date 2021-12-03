import 'package:ana/presentation/features/reset_info/components/reset_info_body.dart';
import 'package:flutter/material.dart';

class ResetInfoScreen extends StatelessWidget{
  const ResetInfoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: ResetInfoBody(),
   );
  }

}