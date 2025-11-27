// using db from '../db/schema';
// service Ecomerce {
//         entity Store as projection on db.Store;
//         entity Products as projection on db.Products;
//         entity Employee as projection on db.Employee;
//         entity Customer as projection on db.Customer;
//         entity Orders as projection on db.Orders;
//         entity Delivery as projection on db.Delivery;
//         entity Payment as projection on db.Payment;

// }

using { sap.capire.Bank as my } from '../db/schema';
service AdminService @(requires:'authenticated-user') { 
  entity Books as projection on my.Books;
  entity Authors as projection on my.Authors;
}