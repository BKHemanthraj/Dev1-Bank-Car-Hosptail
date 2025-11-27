sap.ui.define([
    "sap/m/MessageBox"
], function(MessageBox) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        ContentDiaply: function(oContext, aSelectedContexts) {
            debugger
            var A = sap.ui.core.Element.getElementById("project2::CustomerObjectPage--fe::CustomAction::AA")._buttonPressed
            var B = sap.ui.core.Element.getElementById("project2::CustomerObjectPage--fe::CustomAction::BB")._buttonPressed
            var C = sap.ui.core.Element.getElementById("project2::CustomerObjectPage--fe::CustomAction::CC")._buttonPressed

            if(A===0 && B===false && C===false){
                MessageBox.information("Button A is pressed")
            }
             else if(A===false && B===0 && C===false){
                MessageBox.information("Button B is pressed")
            }
             else if(A===false && B===false && C===0){
                MessageBox.information("Button C is pressed")
            }




            

        }
    };
});
