
CREATE DATABASE `ssafit`;
USE `ssafit`;

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`comment_id`	BIGINT PRIMARY KEY AUTO_INCREMENT,
	`user_id`	BIGINT	NOT NULL,
	`video_article_id`	BIGINT	NOT NULL,
	`comment_content`	TEXT	NOT NULL,
	`write_date` TIMESTAMP	NOT NULL DEFAULT NOW(),
	`views`	VARCHAR(255) NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS `video_article`;

CREATE TABLE `video_article` (
	`video_article_id`	BIGINT PRIMARY KEY AUTO_INCREMENT,
	`video_article_title`	VARCHAR(255) NOT NULL,
	`video_article_part`	VARCHAR(20)	NOT NULL,
	`video_article_channel`	VARCHAR(20)	NOT NULL,
	`video_article_url`	TEXT	NOT NULL,
	`video_article_views`	INT	NULL COMMENT '유튜브조회수'
);

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`user_id`	BIGINT PRIMARY KEY AUTO_INCREMENT,
	`user_email`	VARCHAR(20)	NOT NULL	COMMENT '로그인 아이디',
	`user_password`	VARCHAR(20)	NOT NULL,
	`user_nickname`	VARCHAR(10)	NOT NULL
);

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
	`admin _id`	INT	PRIMARY KEY AUTO_INCREMENT,
	`admin_login_id`	VARCHAR(20)	NOT NULL,
	`admin_password`	VARCHAR(20)	NOT NULL
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_users_TO_review_1` FOREIGN KEY (
	`user_id`
    

)
REFERENCES `users` (
	`user_id`
) ON DELETE CASCADE;


ALTER TABLE `comment`ADD CONSTRAINT `FK_video_article_TO_review_1` FOREIGN KEY (
	`video_article_id`
)
REFERENCES `video_article` (
	`video_article_id`
);


INSERT INTO video_article (video_article_title, video_article_part, video_article_channel, video_article_url, video_article_views)
VALUES 
("전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/gMaB-fG4u4g", 0),
("하루 15분! 전신 칼로리 불태우는 다이어트 운동", "전신", "ThankyouBUBU", "https://www.youtube.com/embed/swRNeYw1JkY", 0),
("상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/54tTYO-vU2E", 0),
("상체비만 다이어트 최고의 운동 [상체 핵매운맛]", "상체", "ThankyouBUBU", "https://www.youtube.com/embed/QqqZH3j_vH0", 0),
("하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]", "하체", "김강민", "https://www.youtube.com/embed/tzN6ypk6Sps", 0),
("저는 하체 식주의자 입니다", "하체", "GYM종국", "https://www.youtube.com/embed/u5OgcZdNbMo", 0),
("11자복근 복부 최고의 운동 [복근 핵매운맛]", "복부", "ThankyouBUBU", "https://www.youtube.com/embed/PjGcOP-TQPE", 0),
("(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)", "복부", "SomiFit", "https://www.youtube.com/embed/7TLk7pscICk", 0);

INSERT INTO admin VALUES(1,"admin1234","admin1234");



SELECT * FROM video_article; 



SELECT * FROM users;
SELECT * FROM comment;
INSERT INTO comment (user_id, video_article_id,comment_content)
VALUES (1,1,"집에가고 싶어");



SELECT * FROM admin;