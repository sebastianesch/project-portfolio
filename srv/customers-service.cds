using { projectportfolio.db as db } from '../db/schema';

service CustomersService {

    @readonly entity Projects as projection on db.Projects;
    entity Customers as projection on db.Customers;

}