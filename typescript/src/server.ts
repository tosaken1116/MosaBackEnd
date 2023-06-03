const express = require('express');
import { Request, Response } from "express";
const app = express()

const port = 8000

app.get('/', (req: Request, res: Response) => {
  res.send('hello!');
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});