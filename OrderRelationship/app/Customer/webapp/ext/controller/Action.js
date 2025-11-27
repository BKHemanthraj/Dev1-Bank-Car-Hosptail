 
sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';
 
    return {
        action: async function (oContext, aSelectedContexts) {
           
            // MessageToast.show("Custom handler invoked.");
           
            // var url = window.location.href;
            // console.log(url); // this is url past in the chatgpt
            // const id = url.match(/Customer\('([^']+)'\)/)[1];  
    debugger
            var Object = sap.ui.core.Element.getElementById(
                "project2::CustomerObjectPage--fe::FormContainer::GeneratedFacet1::FormElement::DataField::CusId::Field-display"   // <<< change only this line
            );
            const id = Object.getBindingContext().getObject("CusId");

            console.log("CusId:", Object);


            let oModel = sap.ui.core.Element.getElementById("project2::CustomerObjectPage--fe::ObjectPageDynamicHeaderTitle-_actionsToolbar").getModel();
            let oFunc = oModel.bindContext('/Total(...)'); // functions name is there in service
            oFunc.setParameter("CusId", id)  
            await oFunc.execute(); // finally trigger the frontend part
            const result =oFunc.getBoundContext().getObject();
            console.log("reult:",result)
            const T=result.TotalAmount;
            console.log('Total Sum is :', T)
            MessageToast.show('Total Sum is' +T)
        }
    };
});