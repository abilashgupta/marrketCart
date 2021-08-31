import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Market Cart',
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
              FormBlock(
                formKey: _formKey,
                model: model,
              ),
              ElevatedButton(
                onPressed: () => model.loginUsingEmail(context),
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('If you are a new user please',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      )),
                  InkWell(
                    onTap: model.navigateToRegister,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

class FormBlock extends StatelessWidget {
  const FormBlock({
    Key? key,
    required GlobalKey<FormState> formKey,
    required LoginViewModel model,
  })  : _formKey = formKey,
        _model = model,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final LoginViewModel _model;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: TextFormField(
              controller: _model.emailTextController,
              style: TextStyle(
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 0.0, 0.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 25.0,
            ),
            child: TextFormField(
              controller: _model.passwordTextController,
              style: TextStyle(
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 0.0, 0.0),
              ),
            ),
          ),
        ]));
  }
}
