
import 'package:finalwishlist/controller/auth_controller.dart';
import 'package:finalwishlist/util/util.dart';
import 'package:finalwishlist/widget/login_widget.dart';
import 'package:finalwishlist/widget/resgister_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  // const AuthScreen({Key? key}) : super(key: key);
AuthController authController= Get.find();
  buildTab(text,selected,context){
    return Container(
      width: MediaQuery.of(context).size.width /2,
      height: 40,
      child: Center(child: Text(text, style: selected? textStyle(22, Colors.lightBlueAccent, FontWeight.bold):textStyle(22, Colors.grey, FontWeight.w500),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Wishly ", style: textStyle(33, Colors.lightBlue, FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Obx(()=> Row(
                  children: [
                    InkWell(
                      onTap: ()=>authController.changeTab("Login"),
                      child:  buildTab("Login", authController.tab.value=="Login", context),
                    ),
                    InkWell(
                        onTap: ()=>authController.changeTab("Register"),
                        child:   buildTab("Register", authController.tab.value=="Register", context),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 20,),
              Obx(() => authController.tab.value=="Login"?
              LoginWidget(): RegisterWidget()
              )

              // Obx(() => authController.tab.value=="Login"
              // ? LoginWidget()
              //     : RegisterWidget()
              // )
            ],
          ),
        ),
      ),
    );
  }
}
