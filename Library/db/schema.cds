// namespace db;
// entity Doctor {
//     key doctorID:String(36);
//         doctorName:String(100);
//         appointments:Composition of many Appointment on appointments.appointmentToDoctor=$self;
// }
// entity Appointment {
//     key appointmentID:String(36);   
//     key doctorID:String(36);   
//         appointmentDate:Date;
//         appointmentTime:Time;
//         appointmentToDoctor:Association to one Doctor on appointmentToDoctor.doctorID=doctorID;
//         patientSnapshots:Composition of many PatientSnapshot on patientSnapshots.snapshotToAppointment=$self;
// }
// entity PatientSnapshot {
//     key snapshotID:String(36);   
//     key appointmentID:String(36);   
//         patientName:String(100);
//         patientDOB:Date;
//         snapshotToAppointment : Association to one Appointment on snapshotToAppointment.appointmentID=appointmentID;
// }



namespace db;

entity Store {
    key StoreID:String(36);
        StoreName:String(20);
        Address:String(50);
        StoresConvert: Composition of many Products on StoresConvert.ProductsConvert=$self;
        StoreTOEmployee:Composition of many Employee on StoreTOEmployee.EmployeeToProduct=$self;
}

entity Products {
    key PID:String(36);
    key StoreID:String;
        PName:String(200);
        Price:Decimal(12,2);
        Stock:Boolean;
        ProductsConvert:Association to one Store on ProductsConvert.StoreID=StoreID;
        ProductToOrders:Composition of one Orders on ProductToOrders.OrdersToProduct=$self;
        // ProductToEmploye:
}
entity Employee {
    key EmpId:String(36);
    key StoreID:String;
    key DeliveryID:String(36);
        FirstName:String(100);
        LastName:String(100);
        Place:String;
        EmployeeToProduct:Association to one Store on EmployeeToProduct.StoreID=StoreID;
        EmployeeToDelivery:Composition of many Delivery on EmployeeToDelivery.EmpId = EmpId;
        // Employe to Delivered
        // Delivereds:Association to many Delivery on Delivereds.EmpId=EmpId;
}

entity Customer {
    key CusId:String(36);
CustomerName:String(200);
        Email:String(200);
        Phone:String(30);
        CustomerToOrders:Composition of many Orders on CustomerToOrders.OrdersToCustomer=$self;
}

entity Orders {
    key OrderID:String(36);
    key CusId:String(36);@readonly
    key PID:String(36);
        OrderDate:Timestamp;
        Status:String(50);
        TotalAmount:Decimal(12,2);
        OrdersToCustomer:Association to one Customer on OrdersToCustomer.CusId=CusId;
        OrdersToProduct:Association to many Products on OrdersToProduct.PID=PID;
        OrdersToPayment  : Composition of one Payment on OrdersToPayment.PaymentToOrders=$self;                       
        OrdersTODelivery:Composition of one Delivery on OrdersTODelivery.DeliveredToOrder=$self;
}

entity Delivery {
    key DeliveryID : String(36);
    key EmpId:String(36);
    key OrderID:String(36);
        DeliveryAddress: String(500);
        DeliveryDate   : Timestamp;
        DeliveredAt    : Timestamp;
        DeliveredToEmployee:Association to one Employee on DeliveredToEmployee.EmpId=EmpId;
        DeliveredToOrder:Association to one Orders on DeliveredToOrder.OrderID=OrderID;
        // Employees:Composition of one Employee on Employees.Delivereds=$self;
        

}

entity Payment {
    key PaymentID:String(36);
    key OrderID:String(36);
        PaidAmount:Decimal(12,2);
        Method:String(50);
        PaymentToOrders : Association to one Orders on PaymentToOrders.OrderID=OrderID;
                              
}







