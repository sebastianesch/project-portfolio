const cds = require('@sap/cds')

const log = cds.log('customers-service')

module.exports = async (srv) => {

    /* Get the Projects entity definition from the db/schema.cds file to interact with the database */
    const { Projects } = cds.entities

    /* This 'on' READ handler replaces the default CAP logic. */
    srv.on('READ', 'Projects', async (request) => {
        log.info('on READ Projects - data:', request.data, ' - params:', request.params)
        const result = await cds.run(request.query)
        request.reply(result)
    })

    srv.before('READ', 'Customers', async (request) => {
        log.info('on READ Projects - data:', request.data, ' - params:', request.params)
        if (request.data.ID) {
            // see https://cap.cloud.sap/docs/node.js/cds-ql for reference
            // 'one' indicates that the query returns only one result - so the returned result is an object instead of a list
            // with template strings you can write "sql-like" syntax
            const customerProjects = await SELECT.one.from(Projects).columns`count(*) as count`.where({customer_ID : request.data.ID })
            log.info('customers has', customerProjects.count, 'projects')
        }
    })

    srv.after('READ', 'Customers', async (result, request) => {
        log.info('after READ Projects - result:', result.length ? result.length : result , '- data:', request.data, '- params:', request.params)
        if (request.data.ID) {
            const rowCount = await UPDATE(Projects).set`modifiedAt = ${new Date()}`.where({customer_ID: request.data.ID})
            log.info('updated', rowCount, 'projects')
        }
    })

}