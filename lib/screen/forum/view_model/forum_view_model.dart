import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/forum_services/forum_services.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class ForumViewModel with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final ForumServices _forumServices = ForumServices();
  final ProfileService _profileServices = ProfileService();

  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;

  ForumModels? _forumList;
  ForumModels? get forumList => _forumList;

  ForumModels? _myForumList;
  ForumModels? get myForumList => _myForumList;

  List<String> kategoriListMap = [];

  String _searchText = '';
  String get searchText => _searchText;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged(String value) {
    _searchText = value;
    notifyListeners();
  }

  void toggleCategory(String kategori) {
    if (kategoriListMap.contains(kategori)) {
      kategoriListMap.remove(kategori);
    } else {
      kategoriListMap.add(kategori);
    }
    notifyListeners();
  }

  Future<void> getForumList() async {
    try {
      _forumList = await _forumServices.getListForum();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMyForumList() async {
    try {
      _myForumList = await _forumServices.getListMyForum(patientId: _profileList?.response?.first.id ?? '');
      print(_profileList?.response?.first.id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProfile({required BuildContext context}) async {
    try {
      _profileList = await _profileServices.getProfileModel(context: context);
    } catch (e) {
      print(e);
    }
  } 
}
