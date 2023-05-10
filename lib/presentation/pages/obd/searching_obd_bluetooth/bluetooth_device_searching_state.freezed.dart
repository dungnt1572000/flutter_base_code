// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_device_searching_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothDeviceSearchState {
  Set<CustomDevicesBluetooth> get listDevice =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothDeviceSearchStateCopyWith<BluetoothDeviceSearchState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDeviceSearchStateCopyWith<$Res> {
  factory $BluetoothDeviceSearchStateCopyWith(BluetoothDeviceSearchState value,
          $Res Function(BluetoothDeviceSearchState) then) =
      _$BluetoothDeviceSearchStateCopyWithImpl<$Res,
          BluetoothDeviceSearchState>;
  @useResult
  $Res call({Set<CustomDevicesBluetooth> listDevice});
}

/// @nodoc
class _$BluetoothDeviceSearchStateCopyWithImpl<$Res,
        $Val extends BluetoothDeviceSearchState>
    implements $BluetoothDeviceSearchStateCopyWith<$Res> {
  _$BluetoothDeviceSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listDevice = null,
  }) {
    return _then(_value.copyWith(
      listDevice: null == listDevice
          ? _value.listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as Set<CustomDevicesBluetooth>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothDeviceSearchCopyWith<$Res>
    implements $BluetoothDeviceSearchStateCopyWith<$Res> {
  factory _$$_BluetoothDeviceSearchCopyWith(_$_BluetoothDeviceSearch value,
          $Res Function(_$_BluetoothDeviceSearch) then) =
      __$$_BluetoothDeviceSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<CustomDevicesBluetooth> listDevice});
}

/// @nodoc
class __$$_BluetoothDeviceSearchCopyWithImpl<$Res>
    extends _$BluetoothDeviceSearchStateCopyWithImpl<$Res,
        _$_BluetoothDeviceSearch>
    implements _$$_BluetoothDeviceSearchCopyWith<$Res> {
  __$$_BluetoothDeviceSearchCopyWithImpl(_$_BluetoothDeviceSearch _value,
      $Res Function(_$_BluetoothDeviceSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listDevice = null,
  }) {
    return _then(_$_BluetoothDeviceSearch(
      listDevice: null == listDevice
          ? _value._listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as Set<CustomDevicesBluetooth>,
    ));
  }
}

/// @nodoc

class _$_BluetoothDeviceSearch implements _BluetoothDeviceSearch {
  _$_BluetoothDeviceSearch(
      {final Set<CustomDevicesBluetooth> listDevice = const {}})
      : _listDevice = listDevice;

  final Set<CustomDevicesBluetooth> _listDevice;
  @override
  @JsonKey()
  Set<CustomDevicesBluetooth> get listDevice {
    if (_listDevice is EqualUnmodifiableSetView) return _listDevice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_listDevice);
  }

  @override
  String toString() {
    return 'BluetoothDeviceSearchState(listDevice: $listDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothDeviceSearch &&
            const DeepCollectionEquality()
                .equals(other._listDevice, _listDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listDevice));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothDeviceSearchCopyWith<_$_BluetoothDeviceSearch> get copyWith =>
      __$$_BluetoothDeviceSearchCopyWithImpl<_$_BluetoothDeviceSearch>(
          this, _$identity);
}

abstract class _BluetoothDeviceSearch implements BluetoothDeviceSearchState {
  factory _BluetoothDeviceSearch(
          {final Set<CustomDevicesBluetooth> listDevice}) =
      _$_BluetoothDeviceSearch;

  @override
  Set<CustomDevicesBluetooth> get listDevice;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothDeviceSearchCopyWith<_$_BluetoothDeviceSearch> get copyWith =>
      throw _privateConstructorUsedError;
}
