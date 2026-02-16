import QtQuick
import QtQuick.Layouts
import Quickshell
import Niri

Item {

  Niri {
    id: niri
    Component.onCompleted: connect()

    onConnected: {
      console.log("✓ Connected to niri")
      statusText.text = "Connected"
      statusText.color = "green"
    }

    onDisconnected: {
      console.log("✗ Disconnected from niri")
      statusText.text = "Disconnected"
      statusText.color = "red"
    }

    onErrorOccurred: function(error) {
      console.log("✗ Error:", error)
      statusText.text = "Error: " + error
      statusText.color = "red"
    }

    onFocusedWindowChanged: {
      console.log("Focused window changed:", niri.focusedWindow?.title)
    }
  }

  Repeater {
    model: Quickshell.screens

    Item {
      required property var modelData
      readonly property string outputName: modelData.name

      PanelWindow {
        screen: modelData
        color: Qt.rgba(0,0,0,0)

        exclusiveZone: 0
        exclusionMode: ExclusionMode.Normal
        implicitWidth: 10

        anchors {
          left: true
          top: true
          bottom: true
        }

        ColumnLayout {
          anchors {
            centerIn: parent
          }
          spacing: 8

          Repeater {
            model: niri.workspaces

            delegate: Rectangle {
              Layout.preferredWidth: 8
              Layout.preferredHeight: 32
              Layout.alignment: Qt.AlignHCenter
              radius: 4
              visible: model.output === outputName

              color: model.isActive ? "white" : "grey"

              Text {
                  anchors.centerIn: parent
                  text: model.id
                  font.pixelSize: 10
                  color: model.isActive ? "black" : "white"
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
              }

              MouseArea {
                anchors.fill: parent
                onClicked: niri.focusWorkspaceById(model.id)
              }
            }
          }
        }
      }

      PanelWindow {
        screen: modelData
        color: Qt.rgba(0,0,0,0)

        exclusiveZone: 0
        exclusionMode: ExclusionMode.Normal
        implicitHeight: 10

        anchors {
          left: true
          right: true
          bottom: true
        }

        Row {
          anchors.centerIn: parent

          Repeater {
            model: niri.workspaces

            delegate: Row {
              property var ws: model
              spacing: 8

              Repeater {
                model: niri.windows
                property var ws: model

                delegate: Rectangle {
                  property var win: model

                  implicitWidth: 32
                  implicitHeight: 8
                  radius: 4
                  visible: ws.id     === win.workspaceId &&
                           ws.output === outputName &&
                           ws.isActive

                  color: model.isFocused ? "white" : "grey"

                  Text {
                      anchors.centerIn: parent
                      text: model.id
                      font.pixelSize: 10
                      color: model.isFocused ? "black" : "white"
                      horizontalAlignment: Text.AlignHCenter
                      verticalAlignment: Text.AlignVCenter
                  }

                  MouseArea {
                    anchors.fill: parent
                    onClicked: niri.focusWindow(model.id)
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
