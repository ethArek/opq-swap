const express = require('express');
const app = express();
const exphbs = require('express-handlebars');

const PORT = 3000;

app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(PORT, () => {
  console.log(`listening on port: ${PORT}`);
});
