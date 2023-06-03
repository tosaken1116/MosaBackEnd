import express, { Request, Response } from "express";
import bodyParser from "body-parser";
import path from "path";


const app = express();
const port = 8000;

app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Hello, world!");
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
