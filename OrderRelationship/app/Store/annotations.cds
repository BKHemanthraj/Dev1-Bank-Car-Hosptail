using Ecomerce as service from '../../srv/service';
annotate service.Store with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'StoreID',
                Value : StoreID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StoreName',
                Value : StoreName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Address',
                Value : Address,
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
            Label : 'Products',
            ID : 'Products',
            Target : 'StoresConvert/@UI.LineItem#Products',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employe Deatils',
            ID : 'EmployeDeatils',
            Target : 'StoreTOEmployee/@UI.LineItem#EmployeDeatils',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'StoreID',
            Value : StoreID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'StoreName',
            Value : StoreName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Address',
            Value : Address,
        },
    ],
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
);

annotate service.Products with @(
    UI.LineItem #Products : [
        {
            $Type : 'UI.DataField',
            Value : PID,
            Label : 'PID',
        },
        {
            $Type : 'UI.DataField',
            Value : PName,
            Label : 'PName',
        },
        {
            $Type : 'UI.DataField',
            Value : Price,
            Label : 'Price',
        },
        {
            $Type : 'UI.DataField',
            Value : Stock,
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataField',
            Value : StoreID,
            Label : 'StoreID',
        },
    ]
);

annotate service.Employee with @(
    UI.LineItem #EmployeDeatils : [
        {
            $Type : 'UI.DataField',
            Value : EmpId,
            Label : 'EmpId',
        },
        {
            $Type : 'UI.DataField',
            Value : FirstName,
            Label : 'FirstName',
        },
        {
            $Type : 'UI.DataField',
            Value : LastName,
            Label : 'LastName',
        },
        {
            $Type : 'UI.DataField',
            Value : Place,
            Label : 'Place',
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
            Label : 'Delivery',
            ID : 'Delivery',
            Target : 'EmployeeToDelivery/@UI.LineItem#Delivery',
        },
    ],
);

annotate service.Delivery with @(
    UI.LineItem #Delivery : [
        {
            $Type : 'UI.DataField',
            Value : DeliveredAt,
            Label : 'DeliveredAt',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliveryAddress,
            Label : 'DeliveryAddress',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliveryDate,
            Label : 'DeliveryDate',
        },
        {
            $Type : 'UI.DataField',
            Value : DeliveryID,
            Label : 'DeliveryID',
        },
        {
            $Type : 'UI.DataField',
            Value : EmpId,
            Label : 'EmpId',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : 'OrderID',
        },
    ]
);

annotate service.Store with {
    StoreName @(
        Common.FieldControl : #Mandatory,
        )
};

