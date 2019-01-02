const local = require('./localStrategy');
const kakao = require('./kakaoStrategy');
const { User } = require('../models');

module.exports = (passport) => {
    passport.serializeUser((user, done) => {    // req.session 객체에 어떤 데이터를 저장할 지 선택한다. user을 매개변수로 받은 후 done함수로 넘길 때 두번째인자 user.id를 넘긴다.
        done(null, user.id);    // 첫번째 인자는 에러발생시, 두번째 인자는 사용자 정보중 id만 저장하도록 한다. 모두 저장하면 용량커지고, 일관성에 문제가 발생하므로.
    });

    passport.deserializeUser((id, done) => {    // 매 요청시 실행됨. passport.session()이 이 메서드를 호출한다. 세션에 저장한 id를 받아서 사용자 정보를 조회.
        User.find({
            where: { id },  // 사용자 id에 대해 조회. include 부분은 팔로워와 팔로잉에 대해서도 조회한다.
            include: [{
                model: User,    // users 테이블 참조
                attributes: ['id', 'nick'], // 테이블의 id, nick 애트리뷰트 참조. 비밀번호를 조회하는 것을 방지하기 위해서이다.
                as: 'Followers',
            }, {
                model: User,
                attributes: ['id', 'nick'],
                as: 'Followings',
            }],
        })     // id를 이용하여 DB에서 사용자정보 조회
            .then(user => done(null, user))     // 조회한 정보는 req.user에 저장하며, done함수에서 user의 정보를 가져온다.
            .catch(err => done(err));
    });

    local(passport);
    kakao(passport);
};