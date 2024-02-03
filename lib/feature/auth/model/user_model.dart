import 'package:bende_fazla/feature/auth/model/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? username;
  String? email;
  String? profileImageUrl;
  String? phoneNumber;
  Location? location;
  bool? isAdmin;
  bool? isActive;
  int? donated;
  int? received;
  int? totalProduct;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.profileImageUrl,
    this.phoneNumber,
    this.location,
    this.isAdmin = false,
    this.isActive = false,
    this.donated = 0,
    this.received = 0,
    this.totalProduct = 0,
  });

  UserModel copyWith({
    String? uid,
    String? username,
    String? email,
    String? profileImageUrl,
    String? phoneNumber,
    Location? location,
    bool? isAdmin,
    bool? isActive,
    int? donated,
    int? received,
    int? totalProduct,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      isAdmin: isAdmin ?? this.isAdmin,
      isActive: isActive ?? this.isActive,
      donated: donated ?? this.donated,
      received: received ?? this.received,
      totalProduct: totalProduct ?? this.totalProduct,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'phoneNumber': phoneNumber,
      'location': location?.toJson(),
      'isAdmin': isAdmin,
      'isActive': isActive,
      'donated': donated,
      'received': received,
      'totalProduct': totalProduct,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return UserModel(
      uid: data?['uid'] as String?,
      username: data?['username'] as String?,
      email: data?['email'] as String?,
      profileImageUrl: data?['profileImageUrl'] as String?,
      phoneNumber: data?['phoneNumber'] as String?,
      location: data?['location'] == null ? null : Location.fromJson(data?['location'] as Map<String, dynamic>),
      isActive: data?['isActive'] as bool?,
      donated: data?['donated'] as int?,
      received: data?['received'] as int?,
      totalProduct: data?['totalProduct'] as int?,
    );
  }
}
