import 'package:flutter/material.dart';
class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:7,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black87,
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Text(" Cash withdrawal")),
                Tab(child: Text(" Cash Deposit")),
                Tab(child: Text("Account Statement ")),
                Tab(child: Text(" Loan Repayment")),
                Tab(child: Text("Balance Enquiry")),
                Tab(child: Text("Balance Enquiry")),
                Tab(child: Text("New Member Reg")),
              ],
            ),
            title: const Text('Dynamic Tabs'),
          ),
          body:  TabBarView(
            children: [
              Container(
                child: Center(
                  child: Text('Cash Withdrawal'),
                ),
              ),  Container(
                child: Center(
                  child: Text('Cash Deposit'),
                ),
              ),  Container(
                child: Center(
                  child: Text('Account Statement'),
                ),
              ),  Container(
                child: Center(
                  child: Text('Loan Repayment'),
                ),
              ),  Container(
                child: Center(
                  child: Text('Balance Inquiry'),
                ),
              ),  Container(
                child: Center(
                  child: Text('Customer balance'),
                ),
              ),  Container(
                child: Center(
                  child: Text('New Member Registration'),
                ),
              ),

            ],
          ),
        ),

    );
  }
}
