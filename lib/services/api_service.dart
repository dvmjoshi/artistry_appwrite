import 'dart:async';
import 'dart:ffi';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:artistry_appwrite/model/artisty_data.dart';

import 'package:artistry_appwrite/services/app_constant.dart';

class ApiService {
  static ApiService? _instance;
  late final Client _client;
  late final Account _account;
  late final Database _database;
  late List<Artisty> _artisty;
  String? _query;
  List<Artisty>? _searchResults;
  List<Artisty> get artistys => _artisty;
  String collectionID = "616fc852dd40e";
  List<Artisty>? get searchResults => _searchResults;

  set query(String query) {
    _query = query;
    searchArt();
  }

  ApiService.internal() {
    _client = Client(
      endPoint: AppConstant().endpoint,
    ).setProject(AppConstant().projectId);
    _account = Account(_client);
    _database = Database(_client);
    _artisty = [];
    artistyData();
  }
  static ApiService? get instance {
    _instance ??= ApiService.internal();
    return _instance!;
  }

  Future login({required String email, required String password}) {
    return _account.createSession(email: email, password: password);
  }

  Future signup({required String email, required String password}) {
    return _account.create(email: email, password: password);
  }

  Future<User> getUser() async {
    final res = await _account.get();
    return User.fromMap(res.toMap());
  }

  Future logout() {
    return _account.deleteSession(sessionId: "current");
  }

  Future oAuthLogin(String provider) {
    return _account.createOAuth2Session(provider: provider);
  }

  Future<List<Artisty>?> artistyData() async {
    try {
      final res = await _database.listDocuments(collectionId: collectionID);

      _artisty = List<Artisty>.from(
          res.documents.map((e) => Artisty.fromJson(e.data)));
    } catch (e) {
      print(e);
    }
  }

  Future addArt(Artisty artisty) async {
    try {
      final res = await _database.createDocument(
          collectionId: collectionID,
          data: artisty.toJson(),
          read: ['*'],
          write: ['*']);
      artistys.add(Artisty.fromJson(res.data));
      print(res);
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  Future updateArt(Artisty artisty) async {
    try {
      final res = await _database.updateDocument(
          collectionId: collectionID,
          documentId: artisty.id.toString(),
          data: artisty.toJson(),
          read: ['*'],
          write: ['*']);
      Artisty updated = Artisty.fromJson(res.data);
      _artisty = List.from(
          _artisty.map((art) => art.id == updated.id ? updated : art));
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  Future deleteArt(Artisty artisty) async {
    try {
      await _database.deleteDocument(
          collectionId: collectionID, documentId: artisty.id.toString());
      _artisty =
          List<Artisty>.from(_artisty.where((art) => art.id != artisty.id));
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  Future searchArt() async {
    try {
      final res = await _database.listDocuments(
          collectionId: collectionID, search: _query);
      _searchResults = List<Artisty>.from(
          res.documents.map((e) => Artisty.fromJson(e.data)));
    } catch (e) {
      print(e);
    }
  }
}
