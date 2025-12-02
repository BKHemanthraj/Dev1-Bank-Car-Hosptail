sap.ui.define([
    "sap/m/Dialog",
    "sap/m/List",
    "sap/m/StandardListItem",
    "sap/m/Button",
    "sap/m/library"
], function (Dialog, List, StandardListItem, Button, mobileLibrary) {
    "use strict";

    var ButtonType = mobileLibrary.ButtonType;

    return {
        // Used by: press="handler.onPress"
        onPress: function (oEvent) {
            if (!this.oDefaultDialog) {
                this.oDefaultDialog = new Dialog({
                    title: "Available Products",
                    content: new List({
                        items: {
                            path: "/ProductCollection",    // your model must have this
                            template: new StandardListItem({
                                title: "{Name}",
                                counter: "{Quantity}"
                            })
                        }
                    }),
                    beginButton: new Button({
                        type: ButtonType.Emphasized,
                        text: "OK",
                        press: function () {
                            this.oDefaultDialog.close();
                        }.bind(this)
                    }),
                    endButton: new Button({
                        text: "Close",
                        press: function () {
                            this.oDefaultDialog.close();
                        }.bind(this)
                    })
                });

                // In FE fragments, this.getView usually doesn't exist – this check is safe
                if (this.getView) {
                    this.getView().addDependent(this.oDefaultDialog);
                }
            }

            this.oDefaultDialog.open();
        },

        // Optional: used by second button press="handler.onDefaultDialogPress"
        onDefaultDialogPress: function (oEvent) {
            // If you want same behaviour, just call onPress
            this.onPress(oEvent);
        }
    };
});
