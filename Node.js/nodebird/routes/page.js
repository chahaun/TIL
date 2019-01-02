const express = require('express');
const { isLoggedIn, isNotLoggedIn } = require('./middlewares'); // 미들웨어 모듈을 불러옴

const router = express.Router();
router.get('/profile', isLoggedIn, (req, res) => {      // 주소가 /profile로 시작하면서 isLoggedIn이 next()일때 렌더링 시작
    res.render('profile', { title: '내 정보 - NodeBird', user: req.user });  // profile.pug에 나의 프로필 객체를 동봉해서 렌더링
});

// 주소가 /join으로 시작하면서 isNotLoggedIn이 next()일때 join.pug에 렌더링. 로그인을 하지 않은 상태이므로 회원가입 해야한다.
router.get('/join', isNotLoggedIn, (req, res) => {
    res.render('join', {
        title: '회원가입 - NodeBird',
        user: req.user,
        joinError: req.flash('joinError'),  // 로그인 에러시 에러메세지 출력
    });
});

// 주소가 / 로 시작하면 main.pug에 렌더링
router.get('/', (req, res, next) => {
    res.render('main', {
        title: 'NodeBird',
        twits: [],
        user: req.user,
        joinError: req.flash('joinError'),
    });
});

module.exports = router;    // 라우터 변수를 모듈로 적용