const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

// Serve static files (for our HTML page)
app.use(express.static("public"));

// API endpoint
app.get("/api/hello", (req, res) => {
  res.json({
    message: "Hello world nvim from your Dev Container!",
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || "development",
  });
});

// Health check endpoint
app.get("/api/health", (req, res) => {
  res.json({ status: "OK", uptime: process.uptime() });
});

app.listen(port, "0.0.0.0", () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
  console.log(`📦 Running inside dev container!`);
});
