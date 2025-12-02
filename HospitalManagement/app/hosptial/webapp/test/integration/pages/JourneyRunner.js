sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"hosptial/test/integration/pages/PatientsList",
	"hosptial/test/integration/pages/PatientsObjectPage",
	"hosptial/test/integration/pages/VisitsObjectPage"
], function (JourneyRunner, PatientsList, PatientsObjectPage, VisitsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('hosptial') + '/test/flp.html#app-preview',
        pages: {
			onThePatientsList: PatientsList,
			onThePatientsObjectPage: PatientsObjectPage,
			onTheVisitsObjectPage: VisitsObjectPage
        },
        async: true
    });

    return runner;
});

