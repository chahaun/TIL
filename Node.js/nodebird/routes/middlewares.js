// isLoggedIn 미들웨어 생성
exports.isLoggedIn = (req, res, next) => {
    if(req.isAuthenticated()) {     // 로그인 중이면 true 아니면 false
        next();
    } else {
        res.status(403).send('로그인 필요');
    }
};

// isNotLoggedIn 미들웨어 생성
exports.isNotLoggedIn = (req, res, next) => {
    if(!req.isAuthenticated()) {
        next();
    } else {
        res.redirect('/');
    }
};

// 이러한 로그인 여부로만 미들웨어를 만들 수 있는것이 아니라, 팔로잉여부나 관리자여부 등으로도 만들 수 있다.