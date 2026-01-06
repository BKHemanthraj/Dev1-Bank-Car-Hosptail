sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Input",
    "sap/m/Label",
    "sap/m/VBox",
    "sap/m/HBox",
    "sap/m/MessageToast",
    "sap/ui/thirdparty/jquery"
], function (Dialog, Button, Input, Label, VBox, HBox, MessageToast, jQuery) {
    "use strict";

    // CHANGE THIS TO YOUR SERVICE NAME
    var SERVICE_ROOT = "/odata/v4/my/Patients";

    return {

        AjaxCustomButton: function () {
            var oDialog;

            // --- INPUT FIELDS ---
            var oName  = new Input({ width: "200px", placeholder: "Enter Patient Name" });
            var oAge   = new Input({ type: "Number", width: "200px", placeholder: "Enter Age" });
            var oPhone = new Input({ width: "200px", maxLength: 10, placeholder: "Enter 10-digit Phone" });

            var oSaveBtn, oDraftBtn;

            // --- VALIDATION (NO trim) ---
            function validate() {
                var bNameValid  = oName.getValue() !== "";
                var bAgeValid   = oAge.getValue() !== "";
                var bPhoneValid = /^[0-9]{10}$/.test(oPhone.getValue());

                var bValid = bNameValid && bAgeValid && bPhoneValid;

                if (oSaveBtn)  oSaveBtn.setEnabled(bValid);
                if (oDraftBtn) oDraftBtn.setEnabled(bValid);
            }

            [oName, oAge, oPhone].forEach(function (oInput) {
                oInput.attachLiveChange(validate);
            });

            // --- AJAX POST helper ---
            function savePatient(sStatus) {
                var oPayload = {
                    PatientName:  oName.getValue(),
                    PatientAge:   Number(oAge.getValue()),
                    PatientPhone: oPhone.getValue(),
                    Status:       sStatus   // "ACTIVE" or "DRAFT"
                };

                jQuery.ajax({
                    url: SERVICE_ROOT + "/Patients",
                    method: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(oPayload),

                    success: function (oData) {
                        var sId = oData?.PatientID ?? "?";
                        MessageToast.show(sStatus + " saved. PatientID = " + sId);

                        if (oDialog) oDialog.close();
                    },
                    error: function (xhr) {
                        MessageToast.show("Error: " + xhr.responseText);
                    }
                });
            }

            // --- SAVE BUTTON ---
            oSaveBtn = new Button({
                text: "Save",
                enabled: false,
                press: function () { savePatient("ACTIVE"); }
            });

            // --- DRAFT BUTTON ---
            oDraftBtn = new Button({
                text: "Draft",
                enabled: false,
                press: function () { savePatient("DRAFT"); }
            });

            // --- CANCEL BUTTON ---
            var oCancelBtn = new Button({
                text: "Cancel",
                press: function () { oDialog.close(); }
            });

            // --- LAYOUT ---
            var oVBox = new VBox({
                items: [
                    new HBox({ items: [ new Label({ text: "Name:", width: "120px" }),  oName ] }),
                    new HBox({ items: [ new Label({ text: "Age:", width: "120px" }),   oAge ] }),
                    new HBox({ items: [ new Label({ text: "Phone:", width: "120px" }), oPhone ] })
                ]
            });

            oDialog = new Dialog({
                title: "Enter Patient Details",
                contentWidth: "420px",
                content: [oVBox],
                buttons: [oSaveBtn, oDraftBtn, oCancelBtn],
                afterClose: function () { oDialog.destroy(); }
            });

            oDialog.open();
        }
    };
});
