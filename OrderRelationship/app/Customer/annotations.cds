using Ecomerce as service from '../../srv/service';
annotate service.Customer with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CusId',
                Value : CusId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CustomerName',
                Value : CustomerName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Phone',
                Value : Phone,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Orders',
            ID : 'Orders1',
            Target : 'CustomerToOrders/@UI.LineItem#Orders',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'CusId',
            Value : CusId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CustomerName',
            Value : CustomerName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Phone',
            Value : Phone,
        },
    ],
    UI.FieldGroup #Orders : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.Identification : [
        
    ],
);

annotate service.Orders with @(
    UI.LineItem #Orders : [
        {
            $Type : 'UI.DataField',
            Value : CusId,
            Label : 'CusId',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderDate,
            Label : 'OrderDate',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : 'OrderID',
        },
        {
            $Type : 'UI.DataField',
            Value : PID,
            Label : 'PID',
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : TotalAmount,
            Label : 'TotalAmount',
        },
        {
            $Type : 'UI.DataField',
            Value : StoreID,
            Label : 'StoreID',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Delivery',
            ID : 'Delivery',
            Target : 'OrdersToProduct/@UI.LineItem#Delivery2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Payment',
            ID : 'Payment',
            Target : '@UI.FieldGroup#Payment',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CusId,
                Label : 'CusId',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderDate,
                Label : 'OrderDate',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderID,
                Label : 'OrderID',
            },
            {
                $Type : 'UI.DataField',
                Value : PID,
                Label : 'PID',
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : TotalAmount,
                Label : 'TotalAmount',
            },
        ],
    },
    UI.FieldGroup #Payment : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OrdersToPayment.Method,
                Label : 'Method',
            },
            {
                $Type : 'UI.DataField',
                Value : OrdersToPayment.OrderID,
                Label : 'OrderID',
            },
            {
                $Type : 'UI.DataField',
                Value : OrdersToPayment.PaidAmount,
                Label : 'PaidAmount',
            },
            {
                $Type : 'UI.DataField',
                Value : OrdersToPayment.PaymentID,
                Label : 'PaymentID',
            },
        ],
    },
);

annotate service.Products with @(
    UI.LineItem #Delivery : [
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveryAddress,
            Label : 'DeliveryAddress',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveryDate,
            Label : 'DeliveryDate',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveryID,
            Label : 'DeliveryID',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.EmpId,
            Label : 'EmpId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.OrderID,
            Label : 'OrderID',
        },
    ],
    UI.LineItem #Delivery1 : [
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.DeliveryID,
            Label : 'DeliveryID',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.EmpId,
            Label : 'EmpId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.FirstName,
            Label : 'FirstName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.LastName,
            Label : 'LastName',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.Place,
            Label : 'Place',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.Employees.StoreID,
            Label : 'StoreID',
        },
    ],
    UI.LineItem #Delivery2 : [
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.CusId,
            Label : 'CusId',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.OrderDate,
            Label : 'OrderDate',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.OrderID,
            Label : 'OrderID',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.PID,
            Label : 'PID',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.Status,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductToOrders.OrdersTODelivery.DeliveredToOrder.TotalAmount,
            Label : 'TotalAmount',
        },
    ],
);

annotate service.Orders with {
    CusId @Common.FieldControl : #ReadOnly
};

