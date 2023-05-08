class CustomDevicesBluetooth{
  final String name;
  final String address;
  CustomDevicesBluetooth(this.name,this.address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CustomDevicesBluetooth && runtimeType == other.runtimeType && name == other.name && address == other.address;
}