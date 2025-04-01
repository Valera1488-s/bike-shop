// app.js
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('./db');
const Bike = require('./models/bike');

const app = express();
const port = 3000;

app.use(bodyParser.json());

// CREATE
app.post('/bikes', async (req, res) => {
    try {
        const bike = new Bike(req.body);
        await bike.save();
        res.status(201).send(bike);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

// READ ALL
app.get('/bikes', async (req, res) => {
    try {
        const bikes = await Bike.find();
        res.send(bikes);
    } catch (error) {
        res.status(500).send(error.message);
    }
});

// READ ONE
app.get('/bikes/:id', async (req, res) => {
    try {
        const bike = await Bike.findById(req.params.id);
        if (!bike) return res.status(404).send('Bike not found');
        res.send(bike);
    } catch (error) {
        res.status(500).send(error.message);
    }
});

// UPDATE
app.put('/bikes/:id', async (req, res) => {
    try {
        const bike = await Bike.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!bike) return res.status(404).send('Bike not found');
        res.send(bike);
    } catch (error) {
        res.status(400).send(error.message);
    }
});

// DELETE
app.delete('/bikes/:id', async (req, res) => {
    try {
        await Bike.findByIdAndDelete(req.params.id);
        res.send('Bike deleted successfully');
    } catch (error) {
        res.status(500).send(error.message);
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

