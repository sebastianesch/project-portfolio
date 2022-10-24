using ProjectsService as service from '../../srv/projects-service';

annotate service.Projects with @(

    UI : {
        HeaderInfo : {
            TypeName : '{i18n>project}',
            TypeNamePlural : '{i18n>projects}',
            Title : { Value : name },
            Description : { Value : type.name }
        },

        LineItem : [
            { 
                Value : name,
                ![@UI.Importance]: #High
            },
            {
                Value : startDate
            },
            {
                Value : endDate
            },
            {
                Value : customer_ID
            },
            {
                Value : type_code
            }
        ],

        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            SortOrder : [
                { Property : name }
            ]
        },

        SelectionFields : [
            startDate, endDate, customer_ID, type_code
        ]
    }
) {
    ID @UI.Hidden : true @UI.HiddenFilter;
    type @(
        Common : {
            Text: type.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues : true,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'ProjectTypes',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : type_code,
                        ValueListProperty : 'code'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    }
                ]
            }
        }
    );
    customer @(
        Common : {
            Text: customer.name,
            TextArrangement : #TextOnly,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Customers',
                SearchSupported : true,
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : customer_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'industry'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'country'
                    }
                ]
            }
        }
    )
};

annotate service.Customers with @(

) {
    ID @UI.Hidden @UI.HiddenFilter;
};

annotate service.ProjectTypes with @(

) {
    code @UI.Hidden @UI.HiddenFilter
};


