import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider with ChangeNotifier {
  List<RemoteMessage> _notifications = [];
  int _unreadCount = 0;

  List<RemoteMessage> get notifications => _notifications;
  int get unreadCount => _unreadCount;
  bool get hasNewNotification => _unreadCount > 0;

  void addNotification(RemoteMessage message) {
    _notifications.insert(0, message);
    _unreadCount++;
    notifyListeners();
  }

  void markAllAsRead() {
    _unreadCount = 0;
    notifyListeners();
  }
}
