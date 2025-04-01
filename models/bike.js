// models/bike.js
const mongoose = require('../db');

const bikeSchema = new mongoose.Schema({
    name: String,
    price: Number,
    description: String,
});

const Bike = mongoose.model('Bike', bikeSchema);

module.exports = Bike;

