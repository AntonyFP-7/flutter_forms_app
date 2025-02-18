import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubir = context.watch<RegisterCubit>();
    final username = registerCubir.state.username;
    final password = registerCubir.state.password;
    final email = registerCubir.state.email;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChange: registerCubir.usernameChange,
          errorMesague: username.errorMesague,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          label: 'Correo electrónico',
          onChange: registerCubir.emailChange,
          errorMesague: email.errorMesague,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          label: 'Contraseña : ${password.value}',
          obscureText: true,
          onChange: registerCubir.passwordChange,
          errorMesague: password.errorMesague,
        ),
        SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubir.onSubmit();
          },
          icon: Icon(Icons.save),
          label: Text("Crear usuario"),
        ),
      ],
    ));
  }
}
