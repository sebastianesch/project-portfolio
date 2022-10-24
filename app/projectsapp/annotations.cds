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
    }
) {
    ID @UI.Hidden : true @UI.HiddenFilter;
};