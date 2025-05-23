import 'package:fashionista/cubits/address_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(InitialState());

  void addAddress(Map<String, dynamic> data) {
    emit(AddressAddedSuccessfully(data));
  }
}
