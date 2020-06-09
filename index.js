let express = require("express");

let app = express();

app.get("/", (req, res) => {
    console.log("Incoming request");
    res.send("After deploy");
});

app.listen(8080, () => {
    console.log("running with a new image");
});