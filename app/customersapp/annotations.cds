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
    }
) {
    ID @UI.Hidden : true @UI.HiddenFilter;
};
