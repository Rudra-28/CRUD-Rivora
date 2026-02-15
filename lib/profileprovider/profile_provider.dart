import 'package:flutter/widgets.dart';
import 'package:rivoratechfe/model/profilemodel.dart';
import 'package:rivoratechfe/services/profileservices.dart';

class ProfileProvider with ChangeNotifier{
  final Profileservices _service= Profileservices();

  List<Profilemodel> _profiles = [];
  bool _isLoading = false;

  List<Profilemodel> get profiles => _profiles;
  bool get isLoading => _isLoading;

  Future<void> fetchProfiles() async {
      _profiles = await _service.getProfiles();
      notifyListeners();
  }

  Future<void> addProfile(Profilemodel profile) async {
    await _service.addProfile(profile);
    await fetchProfiles();
  }


  Future<void> updateProfile(String id, Profilemodel profile) async {
    await _service.updateProfile(id, profile);
    await fetchProfiles();
  }

  Future<void> deleteProfile(String id) async {
    await _service.deleteProfile(id);
    _profiles.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}