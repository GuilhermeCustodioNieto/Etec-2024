import express from 'express'

import path from 'path'

const app = express()

app.use(express.static('public'))

app.get(`/`, (req, res) => {
    let index = path.resolve('./view/index.html')
    res.sendFile(index)
})

app.listen(3000, ()=> {
    console.log(`Funfou`);
})