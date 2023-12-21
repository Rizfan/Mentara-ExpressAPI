const express = require('express');
const router = express.Router();
//import express validator
const { body, validationResult } = require('express-validator');
//import database
const connection = require('../config/database');
 
/**
 * INDEX POSTS
 */
router.get('/', function (req, res) {
    //query
    connection.query('SELECT * FROM users ORDER BY id desc', function (err, rows) {
        if (err) {
            return res.status(500).json({
                status: false,
                message: 'Internal Server Error',
            })
        } else {
            return res.status(200).json({
                status: true,
                message: 'List Data User',
                data: rows
            })
        }
    });
});

router.get('/questions', function (req, res) {
    //query
    connection.query('SELECT * FROM question ORDER BY RAND() LIMIT 10', function (err, rows) {
        if (err) {
            return res.status(500).json({
                error: true,
                message: 'Internal Server Error',
            })
        } else {
            return res.status(200).json({
                error: false,
                message: 'Questions fetched successfully',
                listQuestion: rows
            })
        }
    });
});

router.get('/questions/result', function (req, res) {
    //query
    connection.query("SELECT resultId, DATE_FORMAT(resultDate, '%d %M %Y') as resultDate, resultQuestionnaire FROM questionnaireresult ORDER BY resultDate DESC", function (err, rows) {
        if (err) {
            return res.status(500).json({
                error: true,
                message: 'Internal Server Error',
            })
        } else {
            return res.status(200).json({
                error: false,
                message: 'Results fetched successfully',
                listResult: rows
            })
        }
    });
});

router.post('/questions/result',[
    body('resultId').notEmpty(),
], (req, res) => {
    
        const errors = validationResult(req);
    
        if (!errors.isEmpty()) {
            return res.status(422).json({
                error: true,
                message: 'Result ID is empty',
            });
        }
    
        //define formData
        let formData = {
            resultId: req.body.resultId,
        }
    
        // insert query
        connection.query(`SELECT * FROM questionnaireresult WHERE resultId = '${formData.resultId}'`, function (err, rows) {
            //if(err) throw err
            if (err) {
                return res.status(500).json({
                    error: true,
                    message: 'Internal Server Error',
                })
            } else {
                if (rows.length <= 0) {
                    return res.status(404).json({
                        error: true,
                        message: 'Result not found',
                    })
                } else {
                    return res.status(201).json({
                        error: false,
                        message: 'Result fetched successfully',
                        result: rows[0]
                    })
                }
            }
        })
});

router.get('/questions/result/:id', function (req, res) {
    //query
    connection.query(`SELECT * FROM questionnaireresult WHERE resultId = ${req.params.id}`, function (err, rows) {
        if (err) {
            return res.status(500).json({
                error: true,
                message: 'Internal Server Error',
            })
        } else {
            return res.status(200).json({
                error: false,
                message: 'Result fetched successfully',
                result: rows[0]
            })
        }
    });
});

/**
 * STORE POST
 */
router.post('/register', [

    //validation
    body('name').notEmpty(),
    body('noTelp').notEmpty(),
    body('email').notEmpty(),
    body('password').notEmpty()

], (req, res) => {

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        return res.status(422).json({
            errors: errors.array()
        });
    }

    //define formData
    let formData = {
        name: req.body.name,
        noTelp: req.body.noTelp,
        email: req.body.email,  
        password: req.body.password
    }

    // insert query
    connection.query('INSERT INTO users SET ?', formData, function (err, rows) {
        //if(err) throw err
        if (err) {
            return res.status(500).json({
                status: false,
                message: 'Internal Server Error',
            })
        } else {
            return res.status(201).json({
                status: true,
                message: 'Insert Data Successfully',
                data: rows[0]
            })
        }
    })

});

/**
 * SHOW POST
 */
router.get('/(:id)', function (req, res) {

    let id = req.params.id;

    connection.query(`SELECT * FROM users WHERE id = ${id}`, function (err, rows) {

        if (err) {
            return res.status(500).json({
                status: false,
                message: 'Internal Server Error',
            })
        }

        // if post not found
        if (rows.length <= 0) {
            return res.status(404).json({
                status: false,
                message: 'Data Post Not Found!',
            })
        }
        // if post found
        else {
            return res.status(200).json({
                status: true,
                message: 'Detail Data Post',
                data: rows[0]
            })
        }
    })
})

router.post('/login', [
    
    //validation
    body('email').notEmpty(),
    body('password').notEmpty()

], (req, res) => {

    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        return res.status(422).json({
            status: false,
            message: 'Email or Password is empty',
        });
    }

    //define formData
    let formData = {
        email: req.body.email,
        password: req.body.password
    }

    // insert query
    connection.query(`SELECT * FROM users WHERE email = '${formData.email}' AND password = '${formData.password}'`, function (err, rows) {
        //if(err) throw err
        if (err) {
            return res.status(500).json({
                status: false,
                message: 'Internal Server Error',
            })
        } else {
            if (rows.length <= 0) {
                return res.status(404).json({
                    error: true,
                    message: 'Email or Password is wrong',
                })
            } else {
                return res.status(201).json({
                    error: false,
                    message: 'Login Successfully',
                    loginResult: {
                        userId : rows[0].id,
                        name : rows[0].name,
                        noTelp : rows[0].noTelp,
                        email : rows[0].email,
                        token : "wehfiwkefnsokds",
                        balance : rows[0].balance,
                    }
                })
            }
        }
    })

});


module.exports = router;