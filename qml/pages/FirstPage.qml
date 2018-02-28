import QtQuick 2.0
import Sailfish.Silica 1.0
import uithemer.themescripts 1.0
import "../components"

Page
{
    id: firstpage
    ThemePack { id: themePack }

    BusyIndicator { id: busyindicator; running: false; size: BusyIndicatorSize.Large; anchors.centerIn: parent }

    Connections
    {
        function notify() {
            busyindicator.running = false;
        }

        target: themePack
        onIconsFetched: notify()
    }

    SilicaFlickable
    {
        anchors.fill: parent
        anchors.bottomMargin: Theme.paddingLarge
        contentHeight: content.height
        enabled: !busyindicator.running
        opacity: busyindicator.running ? 0.0 : 1.0

        Column
        {
            id: content
            width: parent.width
            spacing: Theme.paddingMedium

           PageHeader { title: qsTr("Companion app") }

            Item {
                height: appicon.height + Theme.paddingMedium
                width: parent.width

                Image { id: appicon; anchors.horizontalCenter: parent.horizontalCenter; source: "../../appinfo.png" }
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - (x * 2)
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                text: qsTr("Thank you for using my companion app!")
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - (x * 2)
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                text: qsTr("Released under the GNU GPLv3 license.")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sources")
                onClicked: Qt.openUrlExternally("https://github.com/fravaccaro/harbour-themepack-companion")
            }

            SectionHeader { text: qsTr("Icon request") }

            Label {
                x: Theme.paddingLarge
                width: parent.width - (x * 2)
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                text: qsTr("From here you can request missing icons for your favorite apps.")
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - (x * 2)
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                text: qsTr("This will open your e-mail client, from which you can send me the name of the apps you would like to be included in this theme.")
                onLinkActivated: Qt.openUrlExternally(link)
             }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Request icons")
                onClicked: {
                        busyindicator.running = true;
                        themePack.fetchIcons();
                }
            }

            SectionHeader { text: qsTr("Developers") }

              Label {
                  x: Theme.paddingLarge
                  width: parent.width - (x * 2)
                  wrapMode: Text.Wrap
                  textFormat: Text.RichText
                  text: qsTr("If you want to create a theme compatible with UI Themer, please read the documentation.")
               }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Documentation")
                  onClicked: Qt.openUrlExternally("https://fravaccaro.github.io/themepacksupport-sailfishos/docs/getstarted.html")
              }

              SectionHeader { text: qsTr("Support") }

              Label {
                  x: Theme.paddingLarge
                  width: parent.width - (x * 2)
                  wrapMode: Text.Wrap
                  text: qsTr("If you like my work and want to buy me a beer, feel free to do it!")
              }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Donate")
                  onClicked: Qt.openUrlExternally("https://www.paypal.me/#")
              }

              SectionHeader { text: qsTr("Translations") }

              AboutLanguage { text: "Deutsch" }
              AboutTranslator { text: "Translator name" }
              Item { width: parent.width; height: Theme.paddingLarge }

              AboutLanguage { text: "Italiano" }
              AboutTranslator { text: "Translator name" }
              Item { width: parent.width; height: Theme.paddingLarge }

              Label {
                  x: Theme.paddingLarge
                  width: parent.width - (x * 2)
                  wrapMode: Text.Wrap
                  textFormat: Text.RichText
                  text: qsTr("Request a new language or contribute to existing languages on the Transifex project page.")
                  onLinkActivated: Qt.openUrlExternally(link)
              }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Transifex")
                  onClicked: Qt.openUrlExternally("https://www.transifex.com/#")
              }

        }

        VerticalScrollDecorator { }
    }
}
