

import 'package:flutter/material.dart';
import 'package:login/home_screens/client_data.dart';
import 'package:login/home_screens/contract_data.dart';
import 'package:login/home_screens/importan_milestones_dates.dart';
import 'package:login/home_screens/initial_invertion.dart';
import 'package:login/home_screens/motorcycle_delivery_data.dart';
import 'package:login/home_screens/payment_additional_fees.dart';
import 'package:login/home_screens/selection_group_description.dart';

import 'late_payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width *0.15 ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ContractData(),
              SizedBox(
                height: 20,
              ),
              ClientData(),
              SizedBox(
                height: 20,
              ),
              SelectionGroupDescription(),
              SizedBox(
                height: 20,
              ),
              InitialInvertion(),
              SizedBox(
                height: 20,
              ),
              PaymentAdditionalFees(),
              SizedBox(
                height: 20,
              ),
              LatePayment(),
              SizedBox(
                height: 20,
              ),
              ImportanMilestonesDates(),
              SizedBox(
                height: 20,
              ),
              MotorcycleDeliveryData(),

            ],
          ),
        ),
      )
    );
  }
}
