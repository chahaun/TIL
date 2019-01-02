const KakaoStrategy = require('passport-kakao').Strategy;   // Strategy생성자를 사용한다.

const { User } = require('../models');

module.exports = (passport) => {
    passport.use(new KakaoStrategy({    // 첫번째 인자는 전략에 관한 설정
        clientID: process.env.KAKAO_ID, // 카카오에서 발급해주는 아이디. 노출되면 안되므로 env에 설정. 나중에 발급받아 .env파일에 넣을것이다.
        callbackURL: '/auth/kakao/callback',    // 카카오로부터 인증결과를 받을 라우터 주소. 라우터 작성 시에 이 주소를 사용한다. KakaoDevelopers 페이지의 Redirect Path경로와도 일치해야 한다.
    }, async (accessToken, refreshToken, profile, done) => {   // 카카오는 인증 후 callbackURL로 accessToken, refreshToken, profile를 보내준다.
        try {
            const exUser = await User.find({ where: { snsId: profile.id, provider: 'kakao' }});    // 이메일을 이용해 사용자 정보를 받아온다
            if (exUser) {   // 사용자가 존재한다면
                done(null, exUser);  // done함수를 호출해서 exUser을 passport.authenticate 메서드로 보냄.
            } else {        // 사용자가 존재하지 않으면
                const newUser = await User.create({  // 회원가입을 진행한다. profile에서 정보를 꺼내와서 회원가입을 진행하면 된다.
                    email: profile._json && profile._json.kaccount_email,
                    nick: profile.displayName,
                    snsId: profile.id,
                    provider: 'kakao', // 데이터 제공자
                });
                done(null, newUser);  // newUser을 passport.authenticate 메서드로 보냄.
            }
        } catch (error) {   // 에러메세지 처리
            console.error(error);
            done(error);
        }
    }));
};