sap.ui.define([
    // "sap/m/MessageToast"
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
        SumCalculation: async function(oContext, aSelectedContexts) {
            // MessageToast.show("Custom handler invoked.");
                  // MessageToast.show("Custom handler invoked.");
           
            // var url = window.location.href;
            // console.log(url); // this is url past in the chatgpt
            // const id = url.match(/Customer\('([^']+)'\)/)[1];  
            debugger
            var Vist = sap.ui.core.Element.getElementById(
                "hosptial::PatientsObjectPage--fe::FormContainer::GeneratedFacet1::FormElement::DataField::PatientID::Field-display" )  // <<< change only this line
            const id = Vist.getBindingContext().getObject("PatientID");
            console.log("PatientID:", Vist);
            let oModel = sap.ui.core.Element.getElementById("hosptial::PatientsObjectPage--fe::table::patientsTovisits::LineItem::Vistor-toolbar").getModel();
            let oFunc = oModel.bindContext(`/Total(...)`); // functions name is there in service
            oFunc.setParameter("PatientID", id)  
            await oFunc.execute(); // finally trigger the frontend part
            const result =oFunc.getBoundContext().getObject();
            console.log("reult:",result)
            const T=result.Total;
            console.log('Total Sum is :', T)
            sap.m.MessageBox.success('Total Sum is' +T)
        }
    };
});