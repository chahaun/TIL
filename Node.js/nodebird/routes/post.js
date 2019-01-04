const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const { Post, Hashtag, User } = require('../models');
const { isLoggedIn } = require('./middlewares');

const router = express.Router();
// 이미지를 서버 디스크에 저장한다. 서버에 문제가 생길경우 데이터가 없어질 수 있으며 AWS 등의 클라우드 서비스를 사용하는것이 좋다. multer-s3나 multer-google-storage 모듈을 사용한다.
fs.readdir('uploads', (error) => {      // 이미지를 업로드할 폴더 지정. 폴더가 없으면 생성
    if(error) {
        console.error('uploads 폴더가 없어 uploads 폴더를 생성합니다...');
        fs.mkdirSync('uploads');  // 동기적으로 폴더를 생성
    }
});

// 미들웨어를 만드는 upload 객체. single, array, fields, none 메서드 등을 가지고있다.
// single은 하나의 이미지 업로드할 때 사용하며, req.file 객체를 생성한다.
// array, fields는 여러개의 이미지를 업로드할 때 사용하며, req.files 객체를 생성한다. 두개의 차이점은 업로드한 body속성 개수이다. 속성하나-여러이미지(array) / 여러속성-이미지하나(fields)
// none은 이미지를 올리지 않고 데이터만 multipart 형식으로 전송했을때 사용한다.
const upload = multer({     // multer의 옵션으로 storage(파일 저장방식과 경로), limits가 있다. 
    storage: multer.diskStorage({  // 이미지가 서버 디스크에 저장되도록 한다.
        destination(req, file, cb) {    // 옵션은 저장경로를 설정하며,
            cb(null, 'uploads/');
        },
        filename(req, file, cb) {       // 파일명은 기존이름+업로드날짜+기존 확장자
            const ext = path.extname(file.originalname);  // 파일의 기존확장자를 받아온다
            cb(null, path.basename(file.originalname, ext) + new Date().valueOf() + ext);  // 변경해서 저장한다.
        },
    }),
    limits: { fileSize: 5*1024*1024 }, // 최대 이미지 파일용량 허용치(바이트) : 5MB로 설정
});

// 이미지 업로드 처리 라우터
router.post('/img', isLoggedIn, upload.single('img'), (req, res) => {   // single 메서드를 이용한다. 페이지는 AJAX로 이미지를 보낼 때 img로 보내고 있다.
    console.log(req.file);
    res.json({url: `/img/${req.file.filename}`}); // 클라이언트로 filename을 보내서 게시글을 등록할 때 사용하도록 한다.
});

// 게시글 업로드 처리 라우터
const upload2 = multer();
router.post('/', isLoggedIn, upload2.none(), async (req, res, next) => {  // nonde 메서드로 이미지가 없는 게시글형태이다. 이미지 주소가 온것이고, 데이터가 온게 아니기 때문이다.
    try {
        const post = await Post.create({  // 게시글을 DB에 저장한다.
            content: req.body.content,  // 게시글 내용
            img: req.body.url,  // 이미지 주소
            userId: req.user.id,  // 사용자 id
        });
        const hashtags = req.body.content.match(/#[^\s]*/g);  // 게시글에서 해시태그를 정규표현식으로 추출해낸다.
        if (hashtags) { // 해시태그가 존재한다면
            const result = await Promise.all(hashtags.map(tag => Hashtag.findOrCreate({ // 변경된 해시태그를 DB에 찾은 후 hashtags 테이블에 저장한다.
                where: { title: tag.slice(1).toLowerCase() },  // 태그의 2번째 문자열부터 모두 소문자로 변경 후 검색한다
            })));
            await post.addHashtags(result.map(r => r[0]));  // 게시글과 해시태그의 관계를 PostHashtag 테이블에 넣는다.
        }
        res.redirect('/');
    } catch (error) {
        console.error(error);
        next(error);
    }
});

// 해시태그 검색 라우터
router.get('/hashtag', async (req, res, next) => {
    const query = req.query.hashtag;   // 해시태그 이름을 받아서 저장
    if(!query) {
        return res.redirect('/');   // 해시태그가 빈 문자열이면 메인페이지로 돌아감
    }
    try {
        const hashtag = await Hashtag.find({ where: { title: query }});   // hashtags 테이블에서 해당 해시태그가 있는지 확인 후 저장
        let posts = [];  // 게시글을 저장할 배열생성
        if (hashtag) { // 해시태그가 있으면
            posts = await hashtag.getPosts({ include: [{ model: User }]});  //getPosts는 시퀄라이즈에서 제공하는 메서드로, 모든 게시글을 가져온다. 이때 user 모델을 JOIN한다.
        }
        // 메인페이지 렌더링
        return res.render('main', {
            title: `${query} | NodeBird`,   // 타이틀은 해시태그가 존재하면 그걸로, 아니면 NodeBird로 저장
            user: req.user,
            twits: posts,   // 조회된 게시글만 twits에 저장
        });
    } catch (e) {
        console.error(e);
        return next(e);
    }
});

router.post('/:id/like', async (req, res, next) => {
    try {
        const post = await Post.find({ where: { id: req.params.id }});
        await post.addLiker(req.user.id);
        res.send('OK');
    } catch (error) {
        console.error(error);
        next(error);
    }
});
router.delete('/:id/like', async (req, res, next) => {
    try {
        const post = await Post.find({ where: { id: req.params.id }});
        await post.removeLiker(req.user.id);
        res.send('OK');
    } catch (error) {
        console.error(error);
        next(error);
    }
});

module.exports = router;