const express = require('express');
const passport = require('passport');
const bcrypt = require('bcryptjs');
const { isLoggedIn, isNotLoggedIn } = require('./middlewares');
const { User } = require('../models');

const router = express.Router();
router.post('/join', isNotLoggedIn, async (req, res, next) => {
    const { email, nick, password } = req.body;     // email, nick, password 데이터를 받아온다
    try {
        const exUser = await User.find({ where: { email } });   // DB에서 입력한 email값이 있는지 확인
        if(exUser) {    // 이메일이 이미 존재하면
            req.flash('joinError', '이미 가입된 이메일입니다.');   // 일회성 에러메세지 출력
            return res.redirect('/join');   // 다시 /join으로 이동
        }
        const hash = await bcrypt.hash(password, 12);   // 존재하지 않으면 비밀번호를 암호화한다. 12번 반복암호화
        await User.create({     // 사용자정보 생성
            email,
            nick,
            password: hash, // 암호화한 비밀번호
        });
        return res.redirect('/');   // 생성 후 루트페이지로 이동
    } catch (error) {
        console.error(error);
        return next(error);
    }
});

router.post('/login', isNotLoggedIn, (req, res, next) => {
    // passport.authenticate('local') 미들웨어가 로컬 로그인 전략을 수행한다. 미들웨어에 사용자 정의 기능을 추가하려고 한다.
    passport.authenticate('local', (authError, user, info) => {
        if(authError) {
            console.error(authError);
            return next(authError);
        }
        if(!user) {     // 존재하는 user가 아니라면 오류출력
            req.flash('loginError', info.message);
            return res.redirect('/');
        }
        return req.login(user, (loginError) => {    // req.login으로 user을 로그인시킨다.
            if(loginError) {
                console.error(loginError);
                return next(loginError);
            }
            return res.redirect('/');   // 로그인 후 루트페이지로 이동
        });
    })(req, res, next); // 미들웨어 내의 미들웨어는 이걸 붙여야한다.
});
router.get('/logout', isLoggedIn, (req, res) => {   // 로그인 상태이면서 /logout페이지를 호출하면
    req.logout();       // 로그아웃 시킨다. req.user 객체를 제거한다.
    req.session.destroy();  // 세션을 끊는다. req.session 객체의 내용을 제거하는 것이다.
    res.redirect('/');  // 이후 루트페이지로 이동
});

router.get('/kakao', passport.authenticate('kakao')); // 카카오 로그인 창으로 리다이렉트를 하고, 결과를 callback으로 받는다.

router.get('/kakao/callback', passport.authenticate('kakao', {  // 받은 결과를 처리한다.
    failureRedirect: '/',  // 로그인을 실패했을 때 루트페이지로 가도록 설정한다
}), (req, res) => { // 로그인에 성공했을때
    res.redirect('/');   // 성공했다면 루트페이지로 가도록 설정한다
});

module.exports = router;