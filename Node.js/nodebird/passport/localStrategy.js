const LocalStrategy = require('passport-local').Strategy;   // Strategy생성자를 사용한다.
const bcrypt = require('bcryptjs');

const { User } = require('../models');

module.exports = (passport) => {
    passport.use(new LocalStrategy({    // 첫번째 인자는 전략에 관한 설정
        usernameField: 'email',         // req.body.email에 이메일이 담겨오므로 email로 설정
        passwordField: 'password',      // req.body.password에 비밀번호가 담겨오므로 password로 설정
    }, async (email, password, done) => {   // 두번째 인자는 실제 전략을 수행하는 async 함수. 마지막 done 함수는 passport.authenticate의 콜백함수이다.
        try {
            const exUser = await User.find({ where: { email }});    // 이메일을 이용해 사용자 정보를 받아온다
            if (exUser) {   // 사용자가 존재한다면
                const result = await bcrypt.compare(password, exUser.password); // 입력받은 비밀번호와 DB의 비밀번호를 비교한다
                if(result) done(null, exUser);  // result가 true이면 done함수로 사용자정보를 넣어 보낸다. 아래의 자세한 설명을 보자.
                else done(null, false, { message: '비밀번호가 일치하지 않습니다'});  // false라면 비밀번호가 다르므로 에러메세지를 보낸다.
            } else {        // 사용자가 존재하지 않으면
                done(null, false, { message: '가입되지 않은 회원입니다.' });
            }
        } catch (error) {   // 에러메세지 처리
            console.error(error);
            done(error);
        }
    }));
};
/*
done(null, exUser)로 사용자정보를 넣어서 passport.authenticate 메서드로 보내면 이 메서드의 authError 매개변수에는 null이, user 매개변수에는 exUser 정보가 들어간다.
만약 done(null, false, { message: '비밀번호가 일치하지 않습니다'})가 보내지면 authError에는 null이, user에는 false가, info에 message 내용이 들어간다.
auth 라우터를 연결해야 코드가 동작한다.
 */