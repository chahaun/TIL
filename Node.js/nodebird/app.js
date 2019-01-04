const express = require('express');
const cookieParser = require('cookie-parser');
const morgan = require('morgan');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash'); // passport를 이용해 로그인 구현할 때 일회성 메시지 표현(에러메시지 등)
const passport = require('passport');
require('dotenv').config();     // 비밀키가 .env파일에 있는데 dotenv가 그 파일을 읽어 process.env 객체에 넣는다

const pageRouter = require('./routes/page');  // 페이지 관련 라우터
const authRouter = require('./routes/auth');  // 로컬로그인 및 카카오로그인 인증페이지 라우터
const postRouter = require('./routes/post');  // 이미지업로드, 게시글업로드, 해시태그 검색 부분 라우터
const userRouter = require('./routes/user');  // 팔로우 관련 라우터
const { sequelize } = require('./models');  // 모델과 서버를 연결
const passportConfig = require('./passport'); // passport 폴더 내 index.js 불러옴

const app = express(); // 익스프레스를 사용
sequelize.sync();  // 모델 싱크작업
passportConfig(passport);  // 모듈과 폴더 연결

app.set('views', path.join(__dirname, 'views'));  // 템플릿 파일들이 위치한 폴더를 views로 지정
app.set('view engine', 'pug');   // 템플릿 엔진은 pug를 사용
app.set('port', process.env.PORT || 8001); // 지정된 포트가 env에 있으면 그거쓰고, 아니면 8001번 사용

// 미들웨어 구성
app.use(morgan('dev')); // 요청에 대한 정보를 콘솔에 기록
app.use(express.static(path.join(__dirname, 'public')));    // 정적 파일들이 담긴 폴더위치를 지정. public으로 지정한다
app.use('/img', express.static(path.join(__dirname, 'uploads')));  // 업로드한 이미지를 제공하는 폴더를 /img 에 대해서 라우터설정
app.use(express.json());
app.use(express.urlencoded({ extended: false}));
app.use(cookieParser(process.env.COOKIE_SECRET));   // .env 파일의 COOKIE_SECRET에 대한 쿠키 값을 얻어온다.
app.use(session({
    resave: false,      // 세션을 언제나 저장할지를 false로
    saveUninitialized: false,   // 세션 저장하기 전에 초기화하지 않은 상태로 저장을 false로
    secret: process.env.COOKIE_SECRET,  // .env 파일의 COOKIE_SECRET에 대한 쿠키 값을 얻어온다.
    cookie: {
        httpOnly: true,     // 자바스크립트를 사용하지 않음
        secure: false,      // HTTPS를 사용하지 않음
    },
}));
app.use(flash());      // passport의 flash(일회성 메시지 출력기능) 사용
app.use(passport.initialize()); // 요청(req객체)에 passport설정을 심는다
app.use(passport.session()); // req.session객체에 passport 정보를 저장한다. 그러므로 세션 뒤에 위치한다.
app.use('/', pageRouter);   // 주소가 '/'로 시작하면 page.js를 호출
app.use('/auth', authRouter); // 주소가 '/auth'로 시작하는 카카오로그인이며 auth.js 호출
app.use('/post', postRouter); // /post에 대해 post.js 호출
app.use('/user', userRouter); // /user에 대해 user.js 호출

// 라우터 이후에 404 에러 처리
app.use((req, res, next) => {
    const err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// 에러 핸들러
app.use((err, req, res) => {
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500);
    res.render('error');
});

// 마지막으로 응답 진행
app.listen(app.get('port'), () => {
    console.log(app.get('port'), '번 포트에서 대기 중...');
});

