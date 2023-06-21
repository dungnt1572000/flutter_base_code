class AppConstant {
  AppConstant._private();

  static const String mapUrlTheme =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png?layers=H';

  static const double latitude = 10.762622;
  static const double longitude = 106.660172;

  static const String homeInstruction = '''
  1. If you choose two locations and navigate to the OBD view, we will use the second location to calculate the distance and duration.\n
  2. Use the "Find Way" button to get directions. You can check the distance and duration between the two locations.\n
  3. Please grant internet access and permissions for optimal performance.\n
  4. If you want to clear all markers, tap the map once if there are two existing markers, or tap it twice if there is one existing marker.
      ''';

  static const String bluetoothSearching = '''
  This app uses the Bounded Device and Discovery Device to display information.\n
  In case you cannot connect to the OBD, please follow these steps: manually connect to the OBD, then disconnect and return to the app, and finally connect again.
  ''';
}
