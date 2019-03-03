import QtQuick 2.0
import Sailfish.Silica 1.0
import uithemer.themescripts 1.0
import "../components"

Page
{
    id: firstpage
    focus: true
    ThemePack { id: themePack }


    Keys.onPressed: {
        handleKeyPressed(event);
    }

    function handleKeyPressed(event) {

        if (event.key === Qt.Key_Down) {
            flickable.flick(0, - firstpage.height);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Up) {
            flickable.flick(0, firstpage.height);
            event.accepted = true;
        }

        if (event.key === Qt.Key_PageDown) {
            flickable.scrollToBottom();
            event.accepted = true;
        }

        if (event.key === Qt.Key_PageUp) {
            flickable.scrollToTop();
            event.accepted = true;
        }
    }

    BusyState { id: busyindicator; }

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
        id: flickable
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

            LabelText {
                text: qsTr("Thank you for using my companion app!")
            }

            LabelText {
                text: qsTr("Released under the GNU GPLv3 license.")
            }

            LabelSpacer { }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sources")
                onClicked: Qt.openUrlExternally("https://github.com/uithemer/harbour-themepack-companion")
            }

            SectionHeader { text: qsTr("Icon request") }

            LabelText {
                text: qsTr("From here you can request missing icons for your favorite apps.")
            }

            LabelText {
                text: qsTr("This will open your e-mail client, from which you can send me the name of the apps you would like to be included in this theme.")
             }

            LabelText {
                text: qsTr("By requesting new icons, you accept sending the name of the unthemed apps installed on your device, along with your e-mail address. This data will be used by me only for the intended purpose and NEVER disclosed to thirdy parties. Your app names and e-mail address will be deleted right after.")
             }

            LabelSpacer { }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Request icons")
                onClicked: {
                        busyindicator.running = true;
                        themePack.fetchIcons();
                }
            }

            SectionHeader { text: qsTr("Developers") }

            LabelText {
                  text: qsTr("If you want to create a theme compatible with UI Themer, please read the documentation.")
               }

            LabelSpacer { }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Documentation")
                  onClicked: Qt.openUrlExternally("https://uithemer.github.io/themepacksupport-sailfishos/docs/getstarted.html")
              }

              SectionHeader { text: qsTr("Support") }

              LabelText {
                  text: qsTr("If you like my work and want to buy me a beer, feel free to do it!")
              }

              LabelSpacer { }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Donate")
                  onClicked: Qt.openUrlExternally("https://www.paypal.me/#")
              }

              SectionHeader { text: qsTr("Credits") }

              LabelText {
                  text: qsTr("Keyboard navigation based on the one on <a href='https://github.com/Wunderfitz/harbour-piepmatz'>Piepmatz</a> by Sebastian Wolf.")
               }

              SectionHeader { text: qsTr("Translations") }

              DetailItem {
                  label: "Italiano"
                  value: "Francesco Vaccaro"
              }

              DetailItem {
                  label: "Language"
                  value: "Translator"
              }

              LabelText {
                  text: qsTr("Request a new language or contribute to existing languages on the Transifex project page.")
              }

              LabelSpacer { }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Transifex")
                  onClicked: Qt.openUrlExternally("https://www.transifex.com/#")
              }

              Item {
                  width: parent.width
                  height: Theme.paddingLarge
              }

        }

        VerticalScrollDecorator { }
    }
}
