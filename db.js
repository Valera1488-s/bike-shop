// db.js
const mongoose = require('mongoose');

const mongoURI = process.env.MONGO_URI || 'mongodb://localhost:27017/bike-shop';

mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/bike-shop', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function () {
    console.log('Connected to MongoDB');
});

module.exports = mongoose;
