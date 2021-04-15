//~ This file contains all the operations that needes to be performed on application start

class Init {
  static Future initialize() async {
    await _loadSettings();
    await _registerServices();
    await _loadData();
  }

  static Future _registerServices() async {
    //* services like can connect to server are initialized here
    Future.delayed(const Duration(seconds: 1));
  }

  static Future _loadSettings() async {
    //* settings like user type and other are initialized here
    Future.delayed(const Duration(seconds: 1));
  }

  static Future _loadData() async {
    //* Data like Notifications etc.. and other are initialized here
    Future.delayed(const Duration(seconds: 1));
  }
}
