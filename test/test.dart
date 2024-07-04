import 'package:flutter/material.dart';

// Show policy widget - shows
class ShowPolicy extends StatelessWidget {
  final Policy policy;

  const ShowPolicy(this.policy);

  @override
  Widget build(BuildContext context) {
    return Text('Test text ${policy.riskName} ');
  }
}

// Policy class
class Policy {
  final String riskName;

  const Policy({required this.riskName});
}

List<Policy> policies = [const Policy(riskName: "riskName")];
