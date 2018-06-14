set names utf8;
set foreign_key_checks=0;

drop database if exists Regalo;
create database if not exists Regalo;

use Regalo;


/*-----------------会員情報-------------------*/

create table user_info(

id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint not null default 0 comment "性別",
email varchar(32) not null comment "メールアドレス",
status tinyint not null default 0 comment "ステータス",
total_price int default 0 comment "累計購入金額",
rank int default 0 comment "会員ランク",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日"
)

default charset=utf8
comment="会員情報テーブル";

insert into user_info values
(1,"guest","guest","ゲスト","ユーザー","げすと","ゆーざー",0,"guest@gmail.com",0,0,0,0,now(),now()),
(2,"admin","admin","管理","管理","かんり","かんり",0,"admin@gmail.com",0,0,0,0,now(),now());




/*-----------------商品情報-------------------*/

create table product_info(

id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) not null comment "商品名かな",
product_description varchar(255) not null comment"商品詳細",
category_id int not null not null comment "カテゴリID",
price int comment "価格",
product_stock int comment "在庫",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
release_date datetime not null comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint not null default 0 comment "ステータス",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル";

insert into product_info values
(1,1,"猫ギフト","ねこぎふと","とってもかわいい猫です",1,1000,50,"./images","neko.jpg",now(),"発売会社",0,now(),now()),
(2,2,"猫酒","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","neko1.jpg",now(),"発売会社",0,now(),now()),
(3,3,"猫飯","ねこめし","猫です",3,500000,15,"./images","neko.jpg",now(),"発売会社",0,now(),now()),
(4,4,"猫酒2","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai1.jpg",now(),"発売会社",0,now(),now()),
(5,5,"猫酒3","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai2.jpg",now(),"発売会社",0,now(),now()),
(6,6,"猫酒4","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai3.jpg",now(),"発売会社",0,now(),now()),
(7,7,"猫酒5","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai4.jpg",now(),"発売会社",0,now(),now()),
(8,8,"猫酒6","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai5.jpg",now(),"発売会社",0,now(),now()),
(9,9,"猫酒7","ねこさけ","こちらを見ている猫です",1,5000,15,"./images","sozai6.jpg",now(),"発売会社",0,now(),now()
);





/*-----------------カート情報-------------------*/

create table cart_info(

id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
temp_user_id varchar(16) comment "仮ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)

default charset=utf8
comment ="カート情報テーブル";




/*-------------------購入履歴情報-------------------*/

create table purchase_history_info(

id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
destination_id int not null comment "宛先情報ID",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)

default charset=utf8
comment="購入履歴情報テーブル";





/*-----------------宛先情報-------------------*/

create table destination_info(

id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) not null comment "メールアドレス",
tel_number varchar(13) not null comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日"
)


default charset=utf8
comment="宛先情報テーブル";

insert into destination_info values
(1,"guest","ゲスト","ユーザー","げすと","ゆーざー","guest@gmail.com","080-1234-5678","東京都千代田区三番町１ー１　ＫＹ三番町ビル１Ｆ",now(),"0000-00-00 00:00:00");




/*-----------------カテゴリマスターテーブル-------------------*/

create table m_category(

id int primary key not null comment "ID",
category_id int not null unique comment "カテゴリーID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
insert_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)


default charset=utf8
comment="カテゴリマスターテーブル";

insert into m_category values
(1,1,"ALL  ITEM","食料品、雑貨、酒全てのカテゴリーが対象となります",now(),null),
(2,2,"FOOD","食料品に関するカテゴリーが対象となります",now(),null),
(3,3,"WINE","雑貨に関するカテゴリーが対象となります",now(),null),
(4,4,"ACCESSORIES","酒に関するカテゴリーが対象となります",now(),null),
(5,5,"WATCH","時計に関するカテゴリーが対象となります",now(),null)
;




