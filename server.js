const express = require("express");
const os = require("os");
const path = require("path");

const app = express();
const PORT = 80;

app.use(express.static(path.join(__dirname)));

app.get("/api/container-info", (req, res) => {
  res.json({
    hostname: os.hostname(),
    platform: os.platform(),
    architecture: os.architecture(),
    nodeVersion: process.version,
    uptimeSeconds: Math.floor(process.uptime()),
    serverTime: new Date().toISOString()
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});