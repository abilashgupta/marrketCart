import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'reg_viewmodel.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Register to Market Cart',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlueAccent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter the Details',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              SizedBox(height: 20),
              FormBlock(
                formKey: _formKey,
                model: model,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: model.registerUser,
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ],
          )),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}

class FormBlock extends StatelessWidget {
  const FormBlock({
    Key? key,
    required GlobalKey<FormState> formKey,
    required RegisterViewModel model,
  })  : _formKey = formKey,
        _model = model,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final RegisterViewModel _model;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 40.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: _model.nameTextController,
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Enter Name',
                contentPadding: EdgeInsets.fromLTRB(
                  20.0,
                  12.0,
                  0.0,
                  0.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 15.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: _model.emailTextController,
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(
                  20.0,
                  12.0,
                  0.0,
                  0.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 15.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: _model.passwordTextController,
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(
                  20.0,
                  12.0,
                  0.0,
                  0.0,
                ),
              ),
            ),
          ),
        ]));
  }
}
