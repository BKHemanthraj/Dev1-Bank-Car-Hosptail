sap.ui.define([], function () {
    'use strict';

    return {
        
        onPress: function () {
debugger
            var name  = this.byId("nameInput").getValue();
            var age   = this.byId("ageInput").getValue();
            var phone = this.byId("phoneInput").getValue();
            var id    = this.byId("userIdInput").getValue();

            console.log("Name:", name);
            console.log("Age:", age);
            console.log("Phone:", phone);
            console.log("ID:", id);
        }
    };
});
