const express = require('express')
const nodeHtmlToImage = require("node-html-to-image");
const app = express()
const port = '8080'

app.use(express.json())

app.get('/',  async (req, res) => {
  try {
    const response = await fetch("https://www.stadtradeln.de/fileadmin/radelkalender/embed/radelmeter-team.php?sr_team_id=83474&L=2");
    const html = await response.text();
    const image = await nodeHtmlToImage({
      type: 'jpeg',
      quality: 100,
      output: './image.jpeg',
      selector: 'div.center-block',
      html: html
    });
    res.status(200).send(image);
  } catch (e) {
    res.status(500).send(e)
  }
});

app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
});