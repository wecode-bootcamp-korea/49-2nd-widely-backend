const express = require('express');
const { userController } = require('../controllers');

const router = express.Router();

router.post('/signup', userController.signup);
router.post('/login', userController.login);
router.get('/find-id', userController.findId);
router.post('/find-password', userController.findPassword);

module.exports = router;
