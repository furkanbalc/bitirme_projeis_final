import 'package:bende_fazla/feature/app_main/view_model/profile_provider.dart';
import 'package:bende_fazla/feature/app_main/widgets/profile/profile_detail_text_field.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/helpers/index.dart';
import 'package:bende_fazla/product/widgets/add_photo/show_photo_widget.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileProvider>().user;
    TextEditingController name = TextEditingController(text: model!.username);
    TextEditingController email = TextEditingController(text: model.email);
    TextEditingController phone = TextEditingController(text: model.phoneNumber ?? '');
    // TextEditingController adress = TextEditingController(text: model.location ?? '');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Profil bilgilerim')),
      body: Padding(
        padding: context.paddings.horizontalHigh,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShowPhotoWidget(
                  iconSize: 24,
                  size: context.getWidth(factor: .2),
                  image: DecorationImage(
                    image: NetworkImage(model.profileImageUrl!),
                  ),
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: 'Profil fotoğrafını güncelle',
                  decoration: TextDecoration.underline,
                )
              ],
            ),
            context.sizedBoxHeightMedium,
            ProfileDetailTextField(
              controller: name,
              readOnly: true,
              label: AppStrings.kFormName,
            ),
            context.sizedBoxHeightLow,
            ProfileDetailTextField(
              controller: email,
              readOnly: true,
              label: AppStrings.kFormEmail,
            ),
            context.sizedBoxHeightLow,
            ProfileDetailTextField(
              controller: phone,
              hintText: '+90 5xxxxxxx',
              label: AppStrings.kPhoneNumber,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10), // Maksimum 13 karakter sınırı (örneğin: +905555555555)
                _PhoneNumberFormatter(), // Özel biçimlendirme için InputFormatter
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        buttonWidth: context.getWidth(factor: .9),
        text: 'Kaydet',
        onPressed: () {
          if (phone.text.isNotEmpty) {
            if (phone.text.length < 9) {
              // ignore: void_checks
              return customAlertDialog(
                context: context,
                message: "The phone number you entered is too short for the country:.\n\nInclude your area code if you haven't",
              );
            } else if (phone.text.length > 10) {
              // ignore: void_checks
              return customAlertDialog(context: context, message: 'The phone number you entered is too long for the country: ');
            }
          }
        },
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Maksimum karakter sayısına ulaşıldığında yazının durdurulması
    if (newValue.text.length >= 13) {
      return oldValue;
    }

    // Eğer yeni değer +90 ile başlamıyorsa, +90 ile başlamasını sağla
    if (!newValue.text.startsWith('+90')) {
      // +90'dan sonra gelen karakterlerin sadece rakam olmasını sağla ve +90'ı ekle
      if (newValue.text.startsWith('90')) {
        return newValue.copyWith(
          text: '+90 ${newValue.text.substring(2).replaceAll(RegExp(r'[^0-9]'), '')}',
          selection: const TextSelection.collapsed(offset: '+90'.length),
        );
      } else {
        return newValue.copyWith(
          text: '+90 ${newValue.text.replaceAll(RegExp(r'[^0-9]'), '')}',
          selection: const TextSelection.collapsed(offset: '+90'.length),
        );
      }
    }

    // +90'dan sonraki karakter sayısını kontrol et
    if (newValue.text.startsWith('+90')) {
      final numberText = newValue.text.substring(3).replaceAll(RegExp(r'[^0-9]'), '');
      // Eğer +90'dan sonra gelen karakter sayısı 10'dan az ise, sadece rakamları kabul et
      if (numberText.length < 10) {
        return TextEditingValue(
          text: '+90$numberText',
          selection: TextSelection.collapsed(offset: '+90'.length + numberText.length),
        );
      }
    }

    return newValue; // Eğer yukarıdaki kontroller sağlanmıyorsa, değeri olduğu gibi geri döndür
  }
}
