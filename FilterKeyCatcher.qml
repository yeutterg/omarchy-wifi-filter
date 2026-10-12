import QtQuick

// PanelKeyCatcher variant for the Wi-Fi panel with type-to-filter: printable
// keys build a filter instead of driving vim-style navigation, so arrows
// navigate, Backspace edits the filter, Delete forgets, and Ctrl+R / Ctrl+W
// keep the refresh / Wi-Fi toggle shortcuts that r / w used to be.
Item {
  id: root

  property bool blocked: false

  signal moveRequested(int dx, int dy)
  signal activateRequested()
  signal returnRequested()
  signal closeRequested()
  signal deleteRequested()
  signal tabRequested(int direction)
  signal textKey(string text)
  signal backspaceRequested()
  signal shortcut(string key)

  focus: true
  Keys.priority: Keys.BeforeItem
  Keys.onPressed: function(event) {
    if (blocked) return

    var ctrl = event.modifiers & Qt.ControlModifier
    if (event.key === Qt.Key_Escape) { closeRequested(); event.accepted = true; return }
    if (event.key === Qt.Key_Tab || event.key === Qt.Key_Backtab) {
      tabRequested((event.modifiers & Qt.ShiftModifier) || event.key === Qt.Key_Backtab ? -1 : 1)
      event.accepted = true
      return
    }
    if (event.key === Qt.Key_Down) { moveRequested(0, 1); event.accepted = true; return }
    if (event.key === Qt.Key_Up) { moveRequested(0, -1); event.accepted = true; return }
    if (event.key === Qt.Key_Right) { moveRequested(1, 0); event.accepted = true; return }
    if (event.key === Qt.Key_Left) { moveRequested(-1, 0); event.accepted = true; return }
    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
      returnRequested(); activateRequested(); event.accepted = true; return
    }
    if (event.key === Qt.Key_Backspace) { backspaceRequested(); event.accepted = true; return }
    if (event.key === Qt.Key_Delete) { deleteRequested(); event.accepted = true; return }
    if (ctrl && (event.key === Qt.Key_R || event.key === Qt.Key_W)) {
      shortcut(event.key === Qt.Key_R ? "r" : "w"); event.accepted = true; return
    }
    if (ctrl || (event.modifiers & Qt.AltModifier)) return
    if (event.text && event.text.length === 1 && event.text >= " ") {
      textKey(event.text); event.accepted = true
    }
  }
}
