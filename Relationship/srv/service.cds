using db from '../db/schema';
service ProductOrdes {
    entity Customers as projection on db.Customers;
    entity Orders as projection on db.Orders;
    entity Foo as projection on db.Payments;
}