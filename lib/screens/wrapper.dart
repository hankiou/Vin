import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vin/models/user.dart';
import 'package:vin/screens/authenticate/authenticate.dart';
import 'package:vin/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    return user != null ? Home() : Authenticate();
  }
}