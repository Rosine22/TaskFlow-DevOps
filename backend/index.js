const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (_, res) => res.send('TaskFlow backend running!'));

app.listen(3000, () => console.log('Server started on port 3000'));
