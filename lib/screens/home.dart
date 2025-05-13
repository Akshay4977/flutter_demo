import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/SecureStorageService.dart';
import 'package:go_router_demo/app_router_constant.dart';
import 'package:go_router_demo/dio_service.dart';
import 'package:logger/logger.dart';

import '../logger/app_log_printer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();

  final log1 = Logger(
      printer: PrettyPrinter(
    printEmojis: false,
    colors: true,
    methodCount: 0,
    errorMethodCount: 3,
    lineLength: 50,
  ));

  final log2 = Logger(
    printer: AppLogPrinter()
  );

  final log = getLogger('home screen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Text('Home'),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRouterConstant.bank,
                pathParameters: {'username': 'Akshay'});
          }, // Go to AboutScreen
          child: const Text('Details')),
      const SizedBox(height: 30),
      TextField(
        controller: _controller,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () {
            SecureStorageService().setValue('temp', _controller.text);
            SecureStorageService().setValue('test', _controller.text + 'test');
          },
          child: Text('Save Information')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () async {
            final result = await SecureStorageService().getValue('temp');
            print(result ?? 'empty');
          },
          child: Text('Get information')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () async {
            final result = await SecureStorageService().getAllValue();
            print(result ?? 'empty');
          },
          child: Text('Get all information')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () async {
            final result = await SecureStorageService().deleteValue('temp');
            print('Deleted');
          },
          child: Text('Delete information')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () async {
            final result = await SecureStorageService().deleteAllValue();
            print('Deleted all');
          },
          child: Text('Delete  all information')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () async {
            final result = await HttpService().getRequest(1);
            print('Get data from API');
          },
          child: Text('Get data')),
      const SizedBox(height: 30),
      ElevatedButton(
          onPressed: () {
            log.d('debug');
            log.e('error');
            log.i('info');
          },
          child: const Text('Logger demo'))
    ]));
  }
}
