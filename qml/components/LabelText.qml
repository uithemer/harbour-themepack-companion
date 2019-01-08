import QtQuick 2.0
import Sailfish.Silica 1.0

Label {
    x: Theme.paddingLarge
    width: parent.width - (x * 2)
    wrapMode: Text.Wrap
    textFormat: Text.RichText
    font.pixelSize: Theme.fontSizeSmall
    onLinkActivated: Qt.openUrlExternally(link)
}
