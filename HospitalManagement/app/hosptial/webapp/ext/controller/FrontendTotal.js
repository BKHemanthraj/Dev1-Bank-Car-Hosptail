sap.ui.define([
    "sap/m/MessageBox"
], function (MessageBox) {
    'use strict';

    return {
        FrontendTotal: function (oContext, aSelectedContexts) {
            debugger;

            const orders =
                sap.ui.core.Element.getElementById("hosptial::PatientsObjectPage--fe::table::patientsTovisits::LineItem::Vistor-innerTable")
                    .getItems();
            let sum = 0;
            for (let order of orders) {
                let b = order.getBindingContext().getObject();
                sum += b.Total;
            }
            if (sum === 0) {
                sap.m.MessageBox.warning("No Amount.");
                return;
            }
            sap.m.MessageBox.success("Total amount: " + sum);
        }
    };
});
