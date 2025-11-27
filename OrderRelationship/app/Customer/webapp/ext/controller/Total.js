sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        Total: function(oContext, aSelectedContexts) {
            debugger
          var orders = sap.ui.core.Element.getElementById(
              "project2::CustomerObjectPage--fe::table::CustomerToOrders::LineItem::Orders-innerTable"
          ).getItems();
        var sum=0
          for (let order of orders) {

              var b = order.getBindingContext().getObject();

              sum += Number(b.TotalAmount)
          }

          // 5. Show result
          alert("Total Amount = " + sum);

        }
    };
});

 
