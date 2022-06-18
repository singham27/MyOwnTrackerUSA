import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 6,),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            children: [
              Expanded(child: TextField (
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                        fontSize: 14
                    )

                ),
              ),),
              Icon(Icons.remove_red_eye_outlined)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
        SizedBox(height: 16,),
        Text(
            'Confirm Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 6,),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            children: [
              Expanded(child: TextField (
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: 'Enter confirm password',
                    hintStyle: TextStyle(
                        fontSize: 14
                    )

                ),
              ),),
              Icon(Icons.remove_red_eye_outlined)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
      ],
    );
  }
}
class TextFieldEmailCustom extends StatelessWidget {
  const TextFieldEmailCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Please enter your email so we can send you acode to verify it.',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 20,),
        Text(
            'Email',
            textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 12,),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: TextField (
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,

                hintText: 'Enter Your email',
                hintStyle: TextStyle(
                    fontSize: 14
                )

            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
      ],
    );
  }
}
class TextFieldEmailLoginCustom extends StatelessWidget {
  const TextFieldEmailLoginCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Email',
            textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 12,),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: TextField (
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,

                hintText: 'Enter Your email',
                hintStyle: TextStyle(
                    fontSize: 14
                )

            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
        SizedBox(height: 20,),
        Text(
            'Password',
            // textAlign: TextAlign.center,
            // maxLines: 3,
            style:  TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black, )),
        SizedBox(height: 6,),
        Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            children: [
              Expanded(child: TextField (
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                        fontSize: 14
                    )

                ),
              ),),
              InkWell(
                child:   Icon(Icons.remove_red_eye_outlined),
                onTap: (){

                },
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
      ],
    );
  }
}

class TextFieldEditClient extends StatelessWidget {
  const TextFieldEditClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 8,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Client name'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Email address'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Mobile number'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Home phone'
          ),
        ),
        SizedBox(height: 22,),
      ],
    );
  }
}
class TextFieldEditClients extends StatelessWidget {
  const TextFieldEditClients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Address #1'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Address #2'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'City'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'State/Provicine'
          ),
        ),
        SizedBox(height: 22,),
        TextField (
          decoration: InputDecoration(
            // border: InputBorder.none,

              hintText: 'Zip/Postal Code'
          ),
        ),

      ],
    );
  }
}

