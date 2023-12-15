const express = require('express');
const app = express();
const port = 3000;

// Version should be set via environment variable
const version = process.env.APP_VERSION;

app.get('/', (req, res) => {
  res.send(`Version: ${version}`);
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
