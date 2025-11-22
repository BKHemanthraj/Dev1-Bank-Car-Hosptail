sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project2/test/integration/pages/CustomerList",
	"project2/test/integration/pages/CustomerObjectPage",
	"project2/test/integration/pages/OrdersObjectPage"
], function (JourneyRunner, CustomerList, CustomerObjectPage, OrdersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project2') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomerList: CustomerList,
			onTheCustomerObjectPage: CustomerObjectPage,
			onTheOrdersObjectPage: OrdersObjectPage
        },
        async: true
    });

    return runner;
});

