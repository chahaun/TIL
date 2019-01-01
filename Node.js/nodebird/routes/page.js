const express = require('express');
const router = express.Router();
router.get('/profile', (req, res) => {      // 주소가 /profile로 시작하면 렌더링 시작
    res.render('profile', { title: '내 정보 - NodeBird', user: null});  // profile.pug에 객체를 동봉해서 렌더링
});

// 주소가 /join으로 시작하면 join.pug에 렌더링
router.get('/join', (req, res) => {
    res.render('join', {
        title: '회원가입 - NodeBird',
        user: null,
        joinError: req.flash('joinError'),  // 로그인 에러시 에러메세지 출력
    });
});

// 주소가 / 로 시작하면 main.pug에 렌더링
router.get('/', (req, res, next) => {
    res.render('main', {
        title: 'NodeBird',
        twits: [],
        user: null,
        joinError: req.flash('joinError'),
    });
});

module.exports = router;    // 라우터 변수를 모듈로 적용