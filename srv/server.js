const proxy = require('@cap-js-community/odata-v2-adapter')
const cds = require('@sap/cds')

cds.on('bootstrap', app => {
    app.use(proxy())
})

if (process.env.NODE_ENV !== 'production') {
    const { cds_launchpad_plugin } = require('cds-launchpad-plugin');
    cds.once('bootstrap', app => {
        const handler = new cds_launchpad_plugin();
        app.use(handler.setup({theme: 'sap_horizon'}))
    })
}

module.exports = cds.server

