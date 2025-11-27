sap.ui.define([
    "sap/m/MessageBox"
], function (Messagebox) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        handle: function (oContext, aSelectedContexts) {
            debugger
            const name = prompt("Enter name:");

if (name === null || name === "") {
    sap.m.MessageBox.warning("Please enter the name");
} 
else {
    const btn = sap.ui.core.Element.getElementById(
        "project2::CustomerObjectPage--fe::CustomAction::Button"
    );

    if (btn) {
        btn.setText(name);
    } else {
        sap.m.MessageBox.alert("Button ID not found");
    }
}

        }

    };
});