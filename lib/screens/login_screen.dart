import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(),
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: SafeArea(
                  top: false,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _buildUpperContainer(),
                        Expanded(
                          child: _buildMiddleContainer(),
                        ),
                        SizedBox(height: 20.0),
                        _buildLoginButton()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  _buildUpperContainer() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: Colors.orange[100],
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 90),
            child: Image(
              width: 220,
              height: 200,
              image: AssetImage('images/gogreen.png'),
            ),
          ),
        ),
      ],
    );
  }

  _buildMiddleContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Image(image: AssetImage('images/email.png')),
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 16.0)),
            validator: (value) {
              return value.isEmpty ? 'Please provide Email!' : null;
            },
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Image(image: AssetImage('images/password.png')),
              filled: true,
              fillColor: Colors.grey[200],
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 16.0),
            ),
            validator: (value) {
              return value.isEmpty ? 'Please provide Email!' : null;
            },
          ),
        )
      ],
    );
  }

  _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 28.0),
      child: SizedBox(
        height: 44,
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          color: Colors.orange[400],
          child: Text('Login'),
          onPressed: () {
            _formKey.currentState.validate();
          },
        ),
      ),
    );
  }

  _hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
