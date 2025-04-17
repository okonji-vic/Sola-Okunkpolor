import 'dart:html';

class Storage {
  // Data stored in local storage persists indefinitely until explicitly deleted by the user or cleared by the website. It is not tied to a specific session or expiration time and remains available even after the browser is closed and reopened.
  void save_data_in_local_storage(String key, String value) {
    window.localStorage[key] = value;
  }

  dynamic get_data_from_local_storage(String key) {
    return window.localStorage[key];
  }

  void clear_local_storage() {
    window.localStorage.clear();
  }

//SESSION
// Data stored in session storage is available only for the duration of the page session. It is cleared when the browser tab or window is closed, and each new tab or window session gets its own separate session storage instance.
  void save_data_in_session_storage(String key, String value) {
    window.sessionStorage[key] = value;
  }

  dynamic get_data_from_session_storage(String key) {
    return window.sessionStorage[key];
  }

  void clear_session_storage() {
    window.sessionStorage.clear();
  }


}
