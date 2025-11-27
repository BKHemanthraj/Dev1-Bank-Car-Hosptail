using db from '../db/schema';
// service Hospital {
//     entity Docter as projection on db.Doctor;
//     entity Appointment as projection on db.Appointment;
//     entity PatientSnapshot as projection on db.PatientSnapshot;
    

// }


service Ecomerce {
        

        @odata.draft.enabled
        entity Store    as projection on db.Store;
        @odata.draft.enabled
        entity Customer as projection on db.Customer;
        entity Products as projection on db.Products;
        entity Employee as projection on db.Employee;
        entity Orders   as projection on db.Orders;
        entity Delivery as projection on db.Delivery;
        entity Payment  as projection on db.Payment;
        // function greet(name: String) returns String;
                // action Wish(name: String) returns String;


}
