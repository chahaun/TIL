const express = require('express');

const { isLoggedIn } = require('./middlewares');
const { User } = require('../models');

const router = express.Router();

router.post('/:id/follow', isLoggedIn, async (req, res, next) => {  // :id 부분은 req.params.id 이다.
    try {
        const user = await User.find({ where: { id: req.user.id }}); // 접속한 사용자(자신)을 users 테이블에서 조회한 후 user 변수에 저장
        await user.addFollowing(parseInt(req.params.id, 10));  // 팔로우할 사용자를 팔로잉한다. 현재 로그인한 사용자와 관계를 짓는다. 10진법을 사용하는 parseInt
        res.send('success');
    } catch (error) {
        console.error(error);
        next(error);
    }
});

module.exports = router;