sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/StoreList",
	"project1/test/integration/pages/StoreObjectPage",
	"project1/test/integration/pages/EmployeeObjectPage"
], function (JourneyRunner, StoreList, StoreObjectPage, EmployeeObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheStoreList: StoreList,
			onTheStoreObjectPage: StoreObjectPage,
			onTheEmployeeObjectPage: EmployeeObjectPage
        },
        async: true
    });

    return runner;
});

