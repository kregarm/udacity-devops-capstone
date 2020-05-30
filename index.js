let express = require('express');

let app = express();

app.get('/', (req, res) => {
    res.send('Hello world from simple Node server')
})

app.listen(8080, () => {
    console.log('running')
})