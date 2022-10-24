namespace projectportfolio.db;
using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

entity Projects : cuid, managed {
    name : String not null @title: '{i18n>name}';
    startDate : Date not null @title: '{i18n>startDate}';
    endDate : Date @title: '{i18n>endDate}';
    description: String @title: '{i18n>description}';
    customer : Association to Customers @title: '{i18n>customer}';
    type : Association to ProjectTypes @title: '{i18n>type}';
}

entity Customers : cuid, managed {
    name : String not null @title: '{i18n>name}';
    industry : String @title: '{i18n>industry}';
    country : String @title: '{i18n>country}';
    projects : Association to many Projects on projects.customer = $self @title: '{i18n>projects}';
}

entity ProjectTypes : CodeList {
    key code : String(10) @title: '{i18n>code}';
}