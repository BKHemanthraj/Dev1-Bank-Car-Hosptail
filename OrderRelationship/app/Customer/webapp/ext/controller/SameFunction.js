sap.ui.define([
    "sap/m/MessageToast"
], function() {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        ButtonA: function () {
        alert("Button A is clicked");
    },

    ButtonB: function () {
        alert("Button B is clicked");
    },

    ButtonC: function () {
        alert("Button C is clicked");
    }
    };
});
