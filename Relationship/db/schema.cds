namespace db;

entity Customer {
    key CusId : String(36);
    CustomerName : String(200);
    Email        : String(200);
    Phone        : String(30);

    customerToOrders : Composition of many Orders on customerToOrders.CustomerID = $self;
}

entity Store {
    key StoreID : String(36);
    StoreName   : String(200);
    Address     : String(500);

    storeToEmployees : Composition of many Employee on storeToEmployees.Store = $self;

    storeDetail : Association to one StoreDetail on storeDetail.Store = $self;
}

entity StoreDetail {
    key Store : String(36);               -- PK is also FK to Store (enforces 1:1)
    OpenedDate : Date;
    Manager    : String(150);
    ExtraInfo  : String;
}

entity Employee {
    key EmpId : String(36);
    FirstName : String(100);
    LastName  : String(100);
    HireDate  : Date;

    -- many employees -> one store (association to parent)
    Store : Association to one Store on Store.StoreID = EmpId?; 
    -- NOTE: if your CDS expects FK name different, use Store.StoreID = Store (or adjust accordingly)
}

entity Products {
    key PID : String(36);
    SKU     : String(100);
    PName   : String(200);
    Price   : Decimal(12,2);
    Stock   : Integer;

    -- an optional relationship to orderItems (many orderItems can reference this product)
    productToOrderItems : Association to many OrderItem on productToOrderItems.Product = $self;
}

entity Orders {
    key OrderID : String(36);
    OrderDate  : Timestamp;
    Status     : String(50);
    TotalAmount: Decimal(12,2);

    -- many orders -> one customer (association to parent)
    Customer : Association to one Customer on Customer.CusId = OrderID?; 
    -- (adjust RHS to the FK field name you choose; typical: Orders.Customer = Customer.CusId)

    -- one order has many order items (composition: order owns its order items)
    OrderToOrderItem : Composition of many OrderItem on OrderToOrderItem.Order = $self;

    -- one order -> one payment (composition 1:1)
    orderToPayment : Composition of one Payment on orderToPayment.Order = $self;

    -- one order -> one delivery (composition 1:1)
    orderToDelivery : Composition of one Delivery on orderToDelivery.Order = $self;
}

entity OrderItem {
    key OrderItemID : String(36);
    Quantity        : Integer;
    PriceEach       : Decimal(12,2);

    -- many-to-one -> Orders
    Order   : Association to one Orders on Order.OrderID = OrderItemID?; 
    -- many-to-one -> Products
    Product : Association to one Products on Product.PID = OrderItemID?;
    -- NOTE: replace the `= OrderItemID?` RHSs with the appropriate FK attribute naming in your system,
    -- e.g. Order.OrderID = Order (if you store FK as Order in OrderItem) or Order.OrderID = OrderIDFk
}

entity Payment {
    key PaymentID : String(36);
    PaidAmount   : Decimal(12,2);
    PaidAt       : Timestamp;
    Method       : String(50);

    -- 1:1: Payment is composed by Order (Order owns the Payment). To reference back:
    PaymentToOrder : Association to one Orders on PaymentToOrder.OrderID = PaymentID?; 
    -- adjust RHS/FK to fit your naming convention
}

entity Delivery {
    key DeliveryID : String(36);
    DeliveryAddress: String(500);
    DeliveryDate   : Timestamp;
    DeliveredAt    : Timestamp;

    -- 1:1: Delivery is composed by Order (Order owns Delivery)
    DeliveryToOrder : Association to one Orders on DeliveryToOrder.OrderID = DeliveryID?;
}

