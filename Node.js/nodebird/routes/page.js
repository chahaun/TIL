const express = require('express');
const { isLoggedIn, isNotLoggedIn } = require('./middlewares'); // 미들웨어 모듈을 불러옴
const { Post, User } = require('../models');  // 모델에서 Post와 User 모듈을 불러옴

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

// 주소가 / 로 시작하면(메인페이지라면) main.pug에 렌더링
router.get('/', (req, res, next) => {
    res.render('main', {
        title: 'NodeBird',
        twits: [],
        user: req.user,
        joinError: req.flash('joinError'),
    });
});

// 또한 메인페이지를 로딩할 때 메인페이지의 게시글도 함께 로딩한다
router.get('/', (req, res, next) => {
    // DB의 posts 테이블에서 게시글 데이터를 찾는다
    Post.findAll({
        include: {        // JOIN 기능
            model: User,  // users 테이블을 참조한다
            attributes: ['id', 'nick'],  // users 테이블의 id, nick 애트리뷰트를 참조한다
        },
        order: [['createdAt', DESC]],  // 정렬은 createdAt에 대해 내림차순으로 정렬 검색한다. (생성일자 최신순)
    }) .then((posts) => {    // posts는 조회한 결과이다.
        res.render('main', {          // 메인페이지 렌더링할 때 아래 객체를 동봉한다.
            title: 'NodeBird',   // 타이틀 지정
            twits: posts,       // 조회한 결과는 twits에 저장된다.
            user: req.user,     // user은 접속한 사용자명 저장 
            loginError: req.flash('loginError'),  // 에러메세지
        });
    }) .catch((error) => {
        console.error(error);
        next(error);
    });
});

module.exports = router;    // 라우터 변수를 모듈로 적용