import 'package:fashionista/widgets/custom_app_bar.dart';
import 'package:fashionista/widgets/custom_button.dart';
import 'package:fashionista/widgets/custom_line.dart';
import 'package:fashionista/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

class Payment extends StatefulWidget {
  const Payment({super.key, this.cardData});

  final dynamic cardData;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.cardData != null) {
      cardNumber = widget.cardData['cardNumber'];
      expiryDate = widget.cardData['expiryDate'];
      cardHolderName = widget.cardData['cardHolderName'];
      cvvCode = widget.cardData['cvvCode'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(isHome: false),
      body: Column(
        children: [
          Gap(30),
          Header(text: "Payment Method"),
          Center(child: CustomLine()),
          Gap(20),
          CreditCardWidget(
            cardBgColor: Colors.black,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            obscureCardCvv: false,
            showBackView: false,
            onCreditCardWidgetChange: (val) {},
            isHolderNameVisible: true,
            cardType: CardType.mastercard,
          ),
          Gap(20),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel creditCardModel) {
              setState(() {
                cardNumber = creditCardModel.cardNumber;
                expiryDate = creditCardModel.expiryDate;
                cardHolderName = creditCardModel.cardHolderName;
                cvvCode = creditCardModel.cvvCode;
              });
            },
            obscureCvv: true,
            isHolderNameVisible: true,
            formKey: key,
          ),
          Spacer(),
          Gap(20),
          CustomButton(
            text: "Add Card",
            onTap: () {
              if (key.currentState!.validate()) {
                final data = {
                  "cardNumber": cardNumber,
                  "expiryDate": expiryDate,
                  "cardHolderName": cardHolderName,
                  "cvvCode": cvvCode,
                };
                Navigator.pop(context, data);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error while adding card try again.")),
                );
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
