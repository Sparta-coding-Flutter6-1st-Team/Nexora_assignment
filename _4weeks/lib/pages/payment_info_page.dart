import 'package:flutter/material.dart';

class PaymentInfoPage extends StatelessWidget {
  const PaymentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결제 정보')),
      body: const Center(child: Text('여기에 결제 정보를 입력하세요')),
    );
  }
}
