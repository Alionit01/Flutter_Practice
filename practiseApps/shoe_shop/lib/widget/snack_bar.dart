import 'package:flutter/material.dart';

SnackBar successSnackBar() => SnackBar(
      backgroundColor: const Color.fromARGB(255, 187, 102, 117),
      content: const Text('Successfully Added!'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );

SnackBar failedSnackBar() => SnackBar(
      backgroundColor: Colors.red[800],
      content: const Text('Already Added!'),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Got it',
        onPressed: () {},
      ),
    );
