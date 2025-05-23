abstract class AddressStates {}

class InitialState extends AddressStates {}

class AddressAddedSuccessfully extends AddressStates {
  final Map<String, dynamic> data;
  AddressAddedSuccessfully(this.data);
}
