import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/recipe_elevated_button.dart';
import '../manager/sign_up_view_model.dart';
import '../widgets/recipe_date_of_birth_field.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(authRepo: context.read()),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Sign Up"),
          ),
          body: ListView(
            children: [
              SizedBox(height: 20),
              Form(
                key: vm.formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    RecipeTextFormField(
                      title: 'First Name',
                      hintText: "Abdulloh",
                      validator: (value) => null,
                      controller: vm.firstNameController,
                    ),
                    RecipeTextFormField(
                      title: 'Last Name',
                      hintText: "Abdurahmonov",
                      validator: (value) => null,
                      controller: vm.lastNameController,
                    ),
                    RecipeTextFormField(
                      title: 'Username',
                      hintText: "chef-solih",
                      validator: (value) => null,
                      controller: vm.usernameController,
                    ),
                    RecipeTextFormField(
                      title: 'Email',
                      hintText: "example@example.com",
                      validator: (value) => null,
                      controller: vm.emailController,
                    ),
                    RecipeTextFormField(
                      title: 'Phone number',
                      hintText: "+998901234567",
                      validator: (value) => null,
                      controller: vm.numberController,
                    ),
                    RecipeDateOfBirthField(),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: "Password",
                      validator: (value) => null,
                    ),
                    RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      title: "Confirm Password",
                      validator: (value) {
                        if (vm.passwordController.text != vm.confirmPasswordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RecipeElevatedButton(
                text: "Sign Up",
                size: Size(195, 45),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.redPinkMain,
                callback: () => vm.signUp(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
