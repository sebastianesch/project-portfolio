using CustomersService as service from '../../srv/customers-service';

annotate service.Customers with @(
    UI : {

        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>customer}',
            TypeNamePlural : '{i18n>customers}',
            Title: { Value : name },
            Description: { Value : industry }
        },

        LineItem : [
            {
                Value : name,
                ![@UI.Importance] : #High
            },
            {
                Value : industry
            },
            {
                Value : country
            }
        ],

        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            SortOrder : [
                {
                    Property : name
                }
            ]
        },

        FieldGroup #CustomerData : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    Value : name,
                    Label : '{i18n>name}'
                },
                {
                    Value : industry,
                    Label : '{i18n>industry}'
                },
                {
                    Value : country,
                    Label : '{i18n>country}'
                }
            ]
        },

        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#CustomerData'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'projects/@UI.LineItem',
                Label : '{i18n>projects}'
            }
        ],
    }
) {
    ID @UI.Hidden : true @UI.HiddenFilter;
};

annotate service.Projects with @(
    UI : {
        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>project}',
            TypeNamePlural : '{i18n>projects}'
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
                Value : type_code
            }
        ],

        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            SortOrder : [
                { Property : name }
            ]
        }
    }
) {
    type @(
        Common : {
            Text: type.name,
            TextArrangement : #TextOnly
        }
    );
};

