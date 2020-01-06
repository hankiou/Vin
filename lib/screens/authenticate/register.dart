import 'package:flutter/material.dart';
import 'package:vin/services/auth.dart';
import 'package:vin/services/database.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String passwd = '';
  String nickname = '';
  String err = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        elevation: 0.0,
        title: Text('Vin: Register'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign-in'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val.isEmpty ? 'Please enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Password must contain at least 6 chars' : null,
                onChanged: (val) {
                  setState(() => passwd = val);
                },
                
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nickname',
                ),
                validator: (val) => val.isEmpty ? 'Please enter a nickname' : null,
                onChanged: (val) {
                  setState(() => nickname = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authService.registerWithEmailAndPassword(email, passwd);
                    if(result == null){
                      setState(() => err = 'Oops, something went wrong');
                    } else {
                      String user_id = result.uid;
                      DatabaseService().registerUser(user_id, nickname);
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                err,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}