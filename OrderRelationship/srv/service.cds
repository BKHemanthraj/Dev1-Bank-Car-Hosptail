using db from '../db/schema';
// service Orders {
//     entity orders as projection on db.Orders;
//     entity Item as projection on db.OrderItem;


// }

// service ProductOrder {
//         entity Customer as projection on db.Customer;
//         entity Orders as projection on db.Orders;
//         entity Payment as projection on db.Payment;
//         entity Products as projection on db.Products;
// }

// service Ecomerce {
        

//         @odata.draft.enabled
//         entity Store    as projection on db.Store;
//         // @odata.draft.enabled
//         entity Customer as projection on db.Customer;
//         entity Products as projection on db.Products;
//         entity Employee as projection on db.Employee;
//         entity Orders   as projection on db.Orders;
//         entity Delivery as projection on db.Delivery;
//         entity Payment  as projection on db.Payment;
//         function greet(name: String) returns String;
//                 action Wish(name: String) returns String;
//                action getCustomerOrdersTotal(CusId: String) returns Decimal(12,2);


// }

service Ecomerce {
  @odata.draft.enabled
  entity Store    as projection on db.Store;
    entity Employee as projection on db.Employee;
     entity Products as projection on db.Products;
  
 
  
  entity Orders   as projection on db.Orders;
  entity Delivery as projection on db.Delivery;
  entity Payment  as projection on db.Payment;
  // @odata.draft.enabled
  entity Customer as projection on db.Customer;

  // server action we'll implement
  function Total(CusId: String) returns Decimal(12,2);
}
