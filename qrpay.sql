/*
Navicat PGSQL Data Transfer

Source Server         : 二测
Source Server Version : 90505
Source Host           : 192.168.66.185:5432
Source Database       : qrpay
Source Schema         : qrpay

Target Server Type    : PGSQL
Target Server Version : 90505
File Encoding         : 65001

Date: 2019-04-16 09:49:48
*/


-- ----------------------------
-- Sequence structure for qrpay_label_id_seq
-- ----------------------------
DROP SEQUENCE "qrpay"."qrpay_label_id_seq";
CREATE SEQUENCE "qrpay"."qrpay_label_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 14
 CACHE 1;
SELECT setval('"qrpay"."qrpay_label_id_seq"', 14, true);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."admin_user";
CREATE TABLE "qrpay"."admin_user" (
"admin_user_id" varchar(100) COLLATE "default" NOT NULL,
"admin_user_name" varchar(100) COLLATE "default",
"admin_nick_name" varchar(100) COLLATE "default",
"password" varchar(255) COLLATE "default",
"cellphone" varchar(50) COLLATE "default",
"avatar" varchar(255) COLLATE "default",
"email" varchar(50) COLLATE "default",
"register_date" timestamp(6),
"register_source" int8 DEFAULT 0,
"last_lng" float8 DEFAULT 0,
"last_lat" float8 DEFAULT 0,
"status" int8 DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."admin_user" IS '后台用户表';
COMMENT ON COLUMN "qrpay"."admin_user"."admin_user_id" IS '主键';
COMMENT ON COLUMN "qrpay"."admin_user"."admin_user_name" IS '名称';
COMMENT ON COLUMN "qrpay"."admin_user"."admin_nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."admin_user"."password" IS '密码';
COMMENT ON COLUMN "qrpay"."admin_user"."cellphone" IS '手机';
COMMENT ON COLUMN "qrpay"."admin_user"."avatar" IS '头像';
COMMENT ON COLUMN "qrpay"."admin_user"."email" IS '邮箱';
COMMENT ON COLUMN "qrpay"."admin_user"."register_date" IS '注册日期';
COMMENT ON COLUMN "qrpay"."admin_user"."register_source" IS '注册来源';
COMMENT ON COLUMN "qrpay"."admin_user"."last_lng" IS '最近经度';
COMMENT ON COLUMN "qrpay"."admin_user"."last_lat" IS '最近纬度';
COMMENT ON COLUMN "qrpay"."admin_user"."status" IS '状态(1：有效)';
COMMENT ON COLUMN "qrpay"."admin_user"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."admin_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."admin_user"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."admin_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."admin_user"."delete_flag" IS '删除标记';
COMMENT ON COLUMN "qrpay"."admin_user"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."admin_user"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for bmb_member
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_member";
CREATE TABLE "qrpay"."bmb_member" (
"mid" numeric(20) NOT NULL,
"mb_phone" varchar(100) COLLATE "default" NOT NULL,
"mb_name" varchar(100) COLLATE "default",
"mb_password" varchar(100) COLLATE "default",
"mb_salt" varchar(50) COLLATE "default",
"mb_type" numeric(2) NOT NULL,
"mb_realname" varchar(50) COLLATE "default",
"mb_identity" varchar(100) COLLATE "default",
"mb_idcert_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_idcert_time" timestamp(6),
"mb_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_birthday" timestamp(6),
"mb_sex" numeric(2),
"mb_photo" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"de_mer_id" numeric(20) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_member" IS '会员表';
COMMENT ON COLUMN "qrpay"."bmb_member"."mid" IS '会员ID';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_phone" IS '用户手机号（业务员的直接填id）';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_name" IS '用户名';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_password" IS '用户密码';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_salt" IS '密码加密字符串';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_type" IS '账号类型（0：店主；1收银员）';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_realname" IS '用户真实姓名';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_identity" IS '用户身份证号码';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_idcert_status" IS '身份认证状态（0未认证；1已认证）';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_idcert_time" IS '用户实名时间';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_status" IS '会员状态(0:正常:1:冻结;2:注销)';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_birthday" IS '出生年月日';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_sex" IS '用户性别（0男；1：女）';
COMMENT ON COLUMN "qrpay"."bmb_member"."mb_photo" IS '用户图像地址';
COMMENT ON COLUMN "qrpay"."bmb_member"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_member"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_member"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."bmb_member"."de_mer_id" IS '用户关联默认商户ID';

-- ----------------------------
-- Table structure for bmb_member_mer
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_member_mer";
CREATE TABLE "qrpay"."bmb_member_mer" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_member_mer" IS 'B端用户商户关联表';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."mid" IS '会员ID';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_member_mer"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for bmb_mer_setcd
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_mer_setcd";
CREATE TABLE "qrpay"."bmb_mer_setcd" (
"id" numeric(20) NOT NULL,
"cd_code" varchar(100) COLLATE "default" NOT NULL,
"cd_val" numeric(20) NOT NULL,
"cd_des" varchar(100) COLLATE "default" NOT NULL,
"cd_status" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_mer_setcd" IS '商户扣率套餐代码表';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."cd_code" IS '扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."cd_val" IS '扣率（0.01%=1）';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."cd_des" IS '扣率描述';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."cd_status" IS '启用状态（0：启用；1：禁用）';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_mer_setcd"."del_flag" IS '删除状态（0：未删除,1：已删除）';

-- ----------------------------
-- Table structure for bmb_pushrelation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_pushrelation";
CREATE TABLE "qrpay"."bmb_pushrelation" (
"id" numeric(20) NOT NULL,
"registrationid" varchar(100) COLLATE "default" NOT NULL,
"mid" numeric(20),
"alias" varchar(100) COLLATE "default",
"tag" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"mer_id" numeric(20) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_pushrelation" IS '极光注册设备和用户关联信息表';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."registrationid" IS '极光注册ID';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."mid" IS '用户MID';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."alias" IS '别名';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."tag" IS '标签(半角逗号隔开)';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."bmb_pushrelation"."mer_id" IS '商户ID';

-- ----------------------------
-- Table structure for bmb_voucher_day
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_voucher_day";
CREATE TABLE "qrpay"."bmb_voucher_day" (
"id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"biz_day" numeric(20) NOT NULL,
"dispose_type" numeric(2) NOT NULL,
"vou_amount" numeric(20) NOT NULL,
"set_cd" varchar(50) COLLATE "default" NOT NULL,
"set_cd_val" numeric(20) NOT NULL,
"pay_amount" numeric(20) NOT NULL,
"status" numeric(2) NOT NULL,
"refused" varchar(200) COLLATE "default",
"check_mid" numeric(20),
"check_name" varchar(50) COLLATE "default",
"check_time" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"biz_type" numeric(2) DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_voucher_day" IS '商户优惠券使用日汇总表';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."biz_day" IS '交易发生日(yyyyMMdd)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."dispose_type" IS '处理方式（0系统跑批；1人工补录-防止统计少了和唯一索引）';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."vou_amount" IS '交易优惠券汇总金额(1000倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."set_cd" IS '扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."set_cd_val" IS '扣率套餐值(100倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."pay_amount" IS '应付商户金额(1000倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."status" IS '审核状态（0未审核；1审核通过；2审核拒绝）';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."refused" IS '拒绝原因';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."check_mid" IS '审核人ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."check_name" IS '审核人名称';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."check_time" IS '审核时间';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day"."biz_type" IS '业务类型（1优惠券+首减、2：平台折扣）';

-- ----------------------------
-- Table structure for bmb_voucher_day_dtl
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmb_voucher_day_dtl";
CREATE TABLE "qrpay"."bmb_voucher_day_dtl" (
"id" numeric(20) NOT NULL,
"pid" numeric(20),
"order_id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"biz_day" numeric(20) NOT NULL,
"dispose_type" numeric(2) NOT NULL,
"biz_type" numeric(2) NOT NULL,
"vou_amount" numeric(20) NOT NULL,
"set_cd" varchar(50) COLLATE "default" NOT NULL,
"set_cd_val" numeric(20) NOT NULL,
"pay_amount" numeric(20) NOT NULL,
"fee_amount" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmb_voucher_day_dtl" IS '商户优惠券使用日汇总明细表';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."pid" IS '汇总表主键ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."order_id" IS '订单ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."biz_day" IS '交易发生日(yyyyMMdd)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."dispose_type" IS '处理方式（0系统跑批；1人工补录-防止统计少了和唯一索引）';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."biz_type" IS '业务类型（1优惠券+首减、2：平台折扣）';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."vou_amount" IS '交易优惠券金额(1000倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."set_cd" IS '扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."set_cd_val" IS '扣率套餐值(100倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."pay_amount" IS '应付商户金额(1000倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."fee_amount" IS '手续费金额(1000倍)';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmb_voucher_day_dtl"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for bmer_indus
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_indus";
CREATE TABLE "qrpay"."bmer_indus" (
"id" numeric(20) NOT NULL,
"indus_id" numeric(20) NOT NULL,
"indus_name" varchar(100) COLLATE "default" NOT NULL,
"wx_indus_id" varchar(100) COLLATE "default" NOT NULL,
"wx_indus_name" varchar(100) COLLATE "default" NOT NULL,
"ali_indus_id" varchar(100) COLLATE "default" NOT NULL,
"ali_indus_name" varchar(100) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_indus" IS '行业对照表';
COMMENT ON COLUMN "qrpay"."bmer_indus"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."bmer_indus"."indus_id" IS '立码惠行业ID';
COMMENT ON COLUMN "qrpay"."bmer_indus"."indus_name" IS '立码惠行业名称';
COMMENT ON COLUMN "qrpay"."bmer_indus"."wx_indus_id" IS '微信行业ID';
COMMENT ON COLUMN "qrpay"."bmer_indus"."wx_indus_name" IS '微信行业名称';
COMMENT ON COLUMN "qrpay"."bmer_indus"."ali_indus_id" IS '支付宝行业ID';
COMMENT ON COLUMN "qrpay"."bmer_indus"."ali_indus_name" IS '支付宝行业名称';
COMMENT ON COLUMN "qrpay"."bmer_indus"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_indus"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_indus"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for bmer_merchant
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_merchant";
CREATE TABLE "qrpay"."bmer_merchant" (
"id" numeric(20) NOT NULL,
"mer_mid" numeric(20) NOT NULL,
"mer_name" varchar(50) COLLATE "default",
"mer_fullname" varchar(100) COLLATE "default",
"mer_province_code" numeric(20),
"mer_province_name" varchar(100) COLLATE "default",
"mer_city_code" numeric(20),
"mer_city_name" varchar(100) COLLATE "default",
"mer_county_code" varchar(50) COLLATE "default",
"mer_county_name" varchar(100) COLLATE "default",
"mer_address" varchar(200) COLLATE "default",
"mer_lng" varchar(100) COLLATE "default",
"mer_lat" varchar(100) COLLATE "default",
"mer_indus_one" numeric(20),
"mer_indus_two" numeric(20),
"act_type" numeric(2),
"act_province_code" numeric(20),
"act_province_name" varchar(100) COLLATE "default",
"act_city_code" numeric(20),
"act_city_name" varchar(100) COLLATE "default",
"act_county_code" varchar(50) COLLATE "default",
"act_county_name" varchar(100) COLLATE "default",
"act_person_name" varchar(100) COLLATE "default",
"act_bankname" varchar(200) COLLATE "default",
"act_bankcode" varchar(100) COLLATE "default",
"act_bankinter_name" varchar(200) COLLATE "default",
"act_bankinter_no" varchar(100) COLLATE "default",
"act_bankcard_no" varchar(200) COLLATE "default",
"act_person_type" numeric(2),
"act_person_id" varchar(200) COLLATE "default",
"act_person_id_date" timestamp(6),
"license_type" numeric(2),
"license_no" varchar(100) COLLATE "default",
"license_date_type" numeric(2),
"license_date" timestamp(6),
"artif_name" varchar(100) COLLATE "default",
"artif_id" varchar(200) COLLATE "default",
"artif_id_date" timestamp(6),
"contact_person" varchar(100) COLLATE "default",
"contact_phone" varchar(100) COLLATE "default",
"contact_email" varchar(100) COLLATE "default",
"rem_id" numeric(20),
"rem_name" varchar(100) COLLATE "default",
"mer_input_type" numeric(2),
"mer_status" numeric(2) NOT NULL,
"discount" numeric(20),
"set_cd" varchar(100) COLLATE "default",
"set_note" varchar(100) COLLATE "default",
"wx_set_cd" varchar(100) COLLATE "default",
"wx_set_note" varchar(100) COLLATE "default",
"ali_set_cd" varchar(100) COLLATE "default",
"ali_set_note" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"result_code" varchar(50) COLLATE "default",
"result_msg" varchar(50) COLLATE "default",
"mer_cd" varchar(50) COLLATE "default",
"contract_no" varchar(100) COLLATE "default",
"verify_no" varchar(50) COLLATE "default",
"reason" varchar(200) COLLATE "default",
"mer_type" numeric(2) DEFAULT 1,
"mer_top" numeric(2) DEFAULT 0,
"authoriz_status" numeric(2) DEFAULT 0,
"mer_third_id" numeric(20) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_merchant" IS '商户基本信息表';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_mid" IS '商户所属用户MID（商户会员表MID）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_name" IS '商户名（简称）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_fullname" IS '商户全称（营业执照上名称）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_province_code" IS '商户省code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_province_name" IS '商户省名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_city_code" IS '商户市code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_city_name" IS '商户市名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_county_code" IS '商户区code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_county_name" IS '商户区名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_address" IS '商户详细地址';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_lng" IS '商户经度';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_lat" IS '商户纬度';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_indus_one" IS '商户所属一级行业';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_indus_two" IS '商户所属二级行业';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_type" IS '结算对公对私结算（1.对公；2.对私）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_province_code" IS '结算户省code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_province_name" IS '结算户名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_city_code" IS '结算户市code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_city_name" IS '结算户市名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_county_code" IS '结算户区code';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_county_name" IS '结算户区名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_person_name" IS '结算户开户名-结算人姓名';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_bankname" IS '结算户开户行名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_bankcode" IS '结算户开户行代码';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_bankinter_name" IS '结算户开户支行名称';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_bankinter_no" IS '结算户开户支行联行号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_bankcard_no" IS '结算户银行卡号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_person_type" IS '结算人是否法人';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_person_id" IS '结算人身份证号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."act_person_id_date" IS '结算人身份证到期时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."license_type" IS '证件类型：（0营业执照）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."license_no" IS '营业执照号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."license_date_type" IS '营业执照有效期类型(0：有到期时间；2：长期；3：无有效期)';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."license_date" IS '营业执照有效期';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."artif_name" IS '法人姓名';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."artif_id" IS '法人身份证号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."artif_id_date" IS '法人身份证到期时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."contact_person" IS '联系人';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."contact_phone" IS '联系人电话';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."contact_email" IS '联系人邮箱';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."rem_id" IS '推荐人ID';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."rem_name" IS '推荐人姓名';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_input_type" IS '商户录入途径（0.系统；1.脚本导入）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_status" IS '商户状态（0；新增；1：一审通过；2：一审拒绝;3：二审通过;4：二审拒绝;5.已提交三方文本资料；6.已生成电子合约；7.已签订电子合约；8：已上传影像文件；9：三方审核通过；10：三方审核拒绝）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."discount" IS '显示折扣（95=9.5折）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."set_cd" IS '扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."set_note" IS '扣率套餐代码内容';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."wx_set_cd" IS '微信扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."wx_set_note" IS '微信扣率套餐内容';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."ali_set_cd" IS '支付宝扣率套餐代码';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."ali_set_note" IS '支付宝扣率套餐内容';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."result_code" IS '富友错误代码, 000000成功,其他失败';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."result_msg" IS 'result_msg';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_cd" IS '收款商户号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."contract_no" IS '富有电子协议号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."verify_no" IS '收款商户号';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."reason" IS '编辑推荐理由';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_type" IS '商户类型（1：普通，2：精选）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_top" IS '置顶（0：不置顶，1：置顶）';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."authoriz_status" IS '微信公众号授权状态0：未授权 1：已授权';
COMMENT ON COLUMN "qrpay"."bmer_merchant"."mer_third_id" IS '报给第3方的id(原用的是id字段)';

-- ----------------------------
-- Table structure for bmer_merchant_check
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_merchant_check";
CREATE TABLE "qrpay"."bmer_merchant_check" (
"id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"check_type" numeric(2) NOT NULL,
"check_key" varchar(100) COLLATE "default" NOT NULL,
"check_des" varchar(200) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_merchant_check" IS '商户审核标记表';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."check_type" IS '类型（1：文本；2：照片）';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."check_key" IS '字段名（文本存字段名；照片存biztype+pictype）';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."check_des" IS '原因描述';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_merchant_check"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for bmer_msg
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_msg";
CREATE TABLE "qrpay"."bmer_msg" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"msg_text" varchar(200) COLLATE "default" NOT NULL,
"highligh" numeric(2) NOT NULL,
"msg_type" numeric(2) NOT NULL,
"msg_status" numeric(2) NOT NULL,
"msg_check_des" varchar(100) COLLATE "default",
"msg_check_time" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"highligh_old" numeric(2),
"msg_use_status" numeric(2),
"mer_id" numeric(20) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_msg" IS '商户通知信息表';
COMMENT ON COLUMN "qrpay"."bmer_msg"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."bmer_msg"."mid" IS '商户mid';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_text" IS '通知内容文本';
COMMENT ON COLUMN "qrpay"."bmer_msg"."highligh" IS '是否高亮显示（0：不高亮；1：高亮）';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_type" IS '消息类型（0：促销站内信）';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_status" IS '消息状态（0：新增；1：审核通过；2：审核拒绝）';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_check_des" IS '审核描述（拒绝原因）';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_check_time" IS '审核时间';
COMMENT ON COLUMN "qrpay"."bmer_msg"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_msg"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_msg"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."bmer_msg"."highligh_old" IS '发布时是否选择高亮（0：不高亮；1：高亮）';
COMMENT ON COLUMN "qrpay"."bmer_msg"."msg_use_status" IS '通知启用状态  0未启用   1启用';

-- ----------------------------
-- Table structure for bmer_pic
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_pic";
CREATE TABLE "qrpay"."bmer_pic" (
"id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"biz_type" numeric(2) NOT NULL,
"pic_type" numeric(4) NOT NULL,
"pic_url" varchar(500) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_pic" IS '商户照片';
COMMENT ON COLUMN "qrpay"."bmer_pic"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."bmer_pic"."mer_id" IS '所属商户ID';
COMMENT ON COLUMN "qrpay"."bmer_pic"."biz_type" IS '业务类别(1.新增商户)';
COMMENT ON COLUMN "qrpay"."bmer_pic"."pic_type" IS '照片类别';
COMMENT ON COLUMN "qrpay"."bmer_pic"."pic_url" IS '照片地址';
COMMENT ON COLUMN "qrpay"."bmer_pic"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_pic"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_pic"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for bmer_qrcode
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."bmer_qrcode";
CREATE TABLE "qrpay"."bmer_qrcode" (
"id" numeric(20) NOT NULL,
"qrcode" varchar(100) COLLATE "default" NOT NULL,
"mer_id" numeric(20) NOT NULL,
"batch" numeric(2) NOT NULL,
"status" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."bmer_qrcode" IS '二维码表';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."qrcode" IS '二维码编码';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."mer_id" IS '所属商户ID';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."batch" IS '批次表id';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."status" IS '二维码状态二维码状态（0-未激活；1-已激活；2-已失效）';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."bmer_qrcode"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_alipay
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_alipay";
CREATE TABLE "qrpay"."cmb_alipay" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mb_alipay_openid" varchar(50) COLLATE "default" NOT NULL,
"mb_alipay_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_alipay_photo" varchar(50) COLLATE "default" DEFAULT 0,
"mb_alipay_name" varchar(100) COLLATE "default" DEFAULT 0,
"mb_alipay_bindtime" timestamp(6) DEFAULT now() NOT NULL,
"mb_alipay_unbindtime" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_alipay" IS '会员支付宝关联表';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_openid" IS '支付宝用户标识(openID)';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_status" IS '支付宝绑定状态';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_photo" IS '支付宝图像地址';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_name" IS '支付宝名称';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_bindtime" IS '绑定时间';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."mb_alipay_unbindtime" IS '解绑时间';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_alipay"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_cashback
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_cashback";
CREATE TABLE "qrpay"."cmb_cashback" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"source_id" numeric(20) NOT NULL,
"amount" numeric(20) NOT NULL,
"activity_id" numeric(20) NOT NULL,
"type" numeric(2),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_cashback" IS '返现记录表';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."id" IS '主键';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."source_id" IS '返现来源ID';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."amount" IS '返现金额';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."activity_id" IS '10000:邀请好友返现活动 10001:注册返券活动 10002:单笔交易满额返券活动 10003:线下发券活动 10004:分销推广活动';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."type" IS '返现业务类型:-1:未知活动类型 1:邀请好友返现活动 2 分销推广活动';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_cashback"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_fund_act
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_fund_act";
CREATE TABLE "qrpay"."cmb_fund_act" (
"mid" numeric(20) NOT NULL,
"amount" numeric(20) DEFAULT 0 NOT NULL,
"freeze_amount" numeric(20) DEFAULT 0 NOT NULL,
"total_amount" numeric(20) DEFAULT 0 NOT NULL,
"fund_status" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_fund_act" IS '用户资金账户表';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."amount" IS '可用余额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."freeze_amount" IS '冻结金额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."total_amount" IS '总金额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."fund_status" IS '资金账户状态(0:正常:1:冻结;2:注销)';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_fund_act"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_fund_act_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_fund_act_detail";
CREATE TABLE "qrpay"."cmb_fund_act_detail" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"before_amount" numeric(20) DEFAULT 0 NOT NULL,
"after_amount" numeric(20) DEFAULT 0 NOT NULL,
"business_amount" numeric(20) DEFAULT 0 NOT NULL,
"fund_type" numeric(2) DEFAULT 0 NOT NULL,
"business_type" numeric(2) DEFAULT 0 NOT NULL,
"remark" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"flow_code" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_fund_act_detail" IS '用户资金记录表';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."before_amount" IS '变动前可用余额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."after_amount" IS '变动后可用余额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."business_amount" IS '变动金额';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."fund_type" IS '资金类型(0:提现)';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."business_type" IS '变动类型( 0:收入 ,1:支出)';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."remark" IS '备注';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_fund_act_detail"."flow_code" IS '流水号';

-- ----------------------------
-- Table structure for cmb_member
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_member";
CREATE TABLE "qrpay"."cmb_member" (
"mid" numeric(20) NOT NULL,
"mb_phone" varchar(100) COLLATE "default" NOT NULL,
"mb_name" varchar(500) COLLATE "default",
"mb_password" varchar(100) COLLATE "default",
"mb_pay_pwd" varchar(100) COLLATE "default",
"mb_salt" varchar(50) COLLATE "default",
"mb_realname" varchar(50) COLLATE "default",
"mb_identity" varchar(100) COLLATE "default",
"mb_idcert_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_idcert_time" timestamp(6),
"mb_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_birthday" timestamp(6),
"mb_birthday_type" numeric(2),
"mb_sex" numeric(2),
"mb_recommend_code" varchar(50) COLLATE "default" NOT NULL,
"mb_photo" varchar(100) COLLATE "default",
"mb_school" varchar(100) COLLATE "default",
"mb_grade" varchar(25) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"mb_vipcard" numeric(20),
"mb_reg_type" numeric(20),
"mb_type" numeric(20) DEFAULT 1,
"merid" numeric(20),
"mb_encrypt_key" varchar(250) COLLATE "default",
"nick_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_member" IS '会员表';
COMMENT ON COLUMN "qrpay"."cmb_member"."mid" IS '会员ID';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_phone" IS '用户手机号';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_name" IS '用户名(预留)';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_password" IS '用户密码(预留)';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_pay_pwd" IS '用户支付密码';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_salt" IS '密码加密字符串';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_realname" IS '用户真实姓名';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_identity" IS '用户身份证号码';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_idcert_status" IS '身份认证状态 0未认证1已认证';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_idcert_time" IS '用户实名时间';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_status" IS '会员状态(0:正常:1:冻结;2:注销)';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_birthday" IS '出生年月日';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_birthday_type" IS '出生年月日获取方式（0：身份证解析；1：自填）';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_sex" IS '用户性别（0男；1：女）';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_recommend_code" IS '用户推荐码';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_photo" IS '用户图像地址';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_school" IS '用户学校';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_grade" IS '用户年级';
COMMENT ON COLUMN "qrpay"."cmb_member"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_member"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_member"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_vipcard" IS '会员卡号';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_reg_type" IS '1.普通注册/h5分享注册，2：公众号注册，3：扫码注册，4：普通注册，5：app，6：小程序:，8：拼团，7：文章分享注册。9，助力注册，11，相亲活动注册，12 红包活动，13，14 学子卡活动报名，15邂逅之时注册页面，17邂逅之时抢票页面， 25圣诞注册';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_type" IS '1:普通用户，2：代理机构，3：商户';
COMMENT ON COLUMN "qrpay"."cmb_member"."merid" IS 'B端，商户表ID';
COMMENT ON COLUMN "qrpay"."cmb_member"."mb_encrypt_key" IS '加密的key值';
COMMENT ON COLUMN "qrpay"."cmb_member"."nick_name" IS '用户昵称';

-- ----------------------------
-- Table structure for cmb_member_action
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_member_action";
CREATE TABLE "qrpay"."cmb_member_action" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"biz_type" numeric(2) NOT NULL,
"biz_ip" varchar(100) COLLATE "default",
"phone_model" varchar(50) COLLATE "default",
"networktype" numeric(2),
"imei" varchar(100) COLLATE "default",
"imsi" varchar(100) COLLATE "default",
"vendor" varchar(100) COLLATE "default",
"uuid" varchar(100) COLLATE "default",
"os_language" varchar(100) COLLATE "default",
"os_version" varchar(100) COLLATE "default",
"os_name" varchar(100) COLLATE "default",
"os_vendor" varchar(100) COLLATE "default",
"longitude" varchar(100) COLLATE "default",
"latitude" varchar(100) COLLATE "default",
"webchat_openid" varchar(100) COLLATE "default",
"alipay_openid" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"fy_webchat_openid" varchar(100) COLLATE "default",
"province_name" varchar(200) COLLATE "default",
"city_name" varchar(200) COLLATE "default",
"parse_num" numeric(20) DEFAULT 0,
"new_province_name" varchar(100) COLLATE "default",
"new_city_name" varchar(100) COLLATE "default",
"wx_app_unionid" varchar(100) COLLATE "default",
"qq_app_unionid" varchar(100) COLLATE "default",
"wx_minicode_openid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_member_action" IS '会员行为信息记录表';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."biz_type" IS '业务类型（1：注册）';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."biz_ip" IS 'IP地址';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."phone_model" IS '手机型号';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."networktype" IS '网络类型';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."imei" IS '设备的国际移动设备身份码';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."imsi" IS '设备的国际移动用户识别码';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."vendor" IS '设备的生产厂商';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."uuid" IS '设备的唯一标识';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."os_language" IS '系统语言信息';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."os_version" IS '系统版本信息';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."os_name" IS '当前操作系统的名称';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."os_vendor" IS '当前操作系统的供应商名称';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."longitude" IS '精度';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."latitude" IS '纬度';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."webchat_openid" IS '微信唯一标示';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."alipay_openid" IS '支付宝唯一标示';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."fy_webchat_openid" IS '富友appid的微信openid';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."province_name" IS '所在省名称';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."city_name" IS '所在城市名称';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."parse_num" IS 'IP解析次数';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."new_province_name" IS '最新省份';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."new_city_name" IS '最新城市';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."wx_app_unionid" IS '微信Unionid 和openid不同在于（不同的公众号登录openid不同，但unionid是唯一的）';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."qq_app_unionid" IS 'QQ唯一标识ID';
COMMENT ON COLUMN "qrpay"."cmb_member_action"."wx_minicode_openid" IS '小程序openId';

-- ----------------------------
-- Table structure for cmb_member_address_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_member_address_record";
CREATE TABLE "qrpay"."cmb_member_address_record" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"new_province_name" varchar(100) COLLATE "default",
"new_city_name" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_member_address_record" IS '用户最新城市定位记录表';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."new_province_name" IS '最新省份';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."new_city_name" IS '最新城市';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_member_address_record"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_member_closure
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_member_closure";
CREATE TABLE "qrpay"."cmb_member_closure" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"closure_remark" varchar(50) COLLATE "default",
"closure_reason" varchar(200) COLLATE "default",
"closure_end_time" timestamp(6),
"status" numeric(2) NOT NULL,
"systerm_id" numeric(20),
"systerm_name" varchar(50) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_member_closure" IS '用户状态封禁流水表';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."mid" IS '用户id';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."closure_remark" IS '封禁备注';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."closure_reason" IS '封禁原因';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."closure_end_time" IS '封禁到期时间';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."status" IS '状态(0:封禁，1:解封)';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."systerm_id" IS '操作人id（0为跑批）';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."systerm_name" IS '操作人姓名';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_member_closure"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_member_limit
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_member_limit";
CREATE TABLE "qrpay"."cmb_member_limit" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"opt_type" numeric(2) DEFAULT 1 NOT NULL,
"limit_date" date,
"used_num" numeric(8) DEFAULT 0,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_member_limit" IS '用户操作限制表';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."opt_type" IS '操作类型（1：头像修改；2：昵称修改）';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."limit_date" IS '限制日期';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."used_num" IS '已使用次数';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_member_limit"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_order
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_order";
CREATE TABLE "qrpay"."cmb_order" (
"id" numeric(20) NOT NULL,
"order_amount" numeric(20) NOT NULL,
"discount" numeric(20) NOT NULL,
"dis_aft_amount" numeric(20) NOT NULL,
"voucher_amount" numeric(20) NOT NULL,
"vou_aft_amount" numeric(20) NOT NULL,
"voucher_id" numeric(20),
"mid" numeric(20) NOT NULL,
"pay_type" numeric(2) NOT NULL,
"pay_act_id" varchar(50) COLLATE "default" NOT NULL,
"mer_id" numeric(20) NOT NULL,
"mer_cd" varchar(50) COLLATE "default" NOT NULL,
"status" numeric(2) DEFAULT 0 NOT NULL,
"pay_status" numeric(2) DEFAULT 0 NOT NULL,
"result_code" varchar(50) COLLATE "default",
"result_msg" varchar(200) COLLATE "default",
"sdk_appid" varchar(50) COLLATE "default",
"sdk_timestamp" varchar(100) COLLATE "default",
"sdk_noncestr" varchar(100) COLLATE "default",
"sdk_package" varchar(200) COLLATE "default",
"sdk_signtype" varchar(100) COLLATE "default",
"sdk_paysign" varchar(1000) COLLATE "default",
"sdk_partnerid" varchar(100) COLLATE "default",
"reserved_fy_order_no" varchar(100) COLLATE "default",
"reserved_fy_settle_dt" varchar(50) COLLATE "default",
"reserved_transaction_id" varchar(100) COLLATE "default",
"reserved_fy_trace_no" varchar(100) COLLATE "default",
"reserved_channel_order_id" varchar(100) COLLATE "default",
"pay_result_code" varchar(50) COLLATE "default",
"pay_result_msg" varchar(200) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"mer_indus_one" numeric(20),
"fy_webchat_openid" varchar(100) COLLATE "default",
"sub_amount" numeric(20) DEFAULT 0 NOT NULL,
"sub_aft_amount" numeric(20) DEFAULT 0 NOT NULL,
"act_id" numeric(20) DEFAULT 0 NOT NULL,
"mer_third_id" numeric(20) DEFAULT 0 NOT NULL,
"dis_act_id" numeric(20) DEFAULT 0,
"plat_discount" numeric(20) DEFAULT 0,
"plat_amount" numeric(20) DEFAULT 0,
"is_max" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_order" IS '优惠券批次';
COMMENT ON COLUMN "qrpay"."cmb_order"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_order"."order_amount" IS '订单原始金额';
COMMENT ON COLUMN "qrpay"."cmb_order"."discount" IS '订单折扣（95=9.5折）';
COMMENT ON COLUMN "qrpay"."cmb_order"."dis_aft_amount" IS '订单折扣后金额（发送到富有的金额）';
COMMENT ON COLUMN "qrpay"."cmb_order"."voucher_amount" IS '优惠券抵用金额';
COMMENT ON COLUMN "qrpay"."cmb_order"."vou_aft_amount" IS '最终支付金额（调起微信/支付宝实扣的金额）';
COMMENT ON COLUMN "qrpay"."cmb_order"."voucher_id" IS '使用的抵用券ID';
COMMENT ON COLUMN "qrpay"."cmb_order"."mid" IS '付款账户MID';
COMMENT ON COLUMN "qrpay"."cmb_order"."pay_type" IS '付款方式（1：微信；2：支付宝）';
COMMENT ON COLUMN "qrpay"."cmb_order"."pay_act_id" IS '付款账户openid/buyer_id';
COMMENT ON COLUMN "qrpay"."cmb_order"."mer_id" IS '收款商户id';
COMMENT ON COLUMN "qrpay"."cmb_order"."mer_cd" IS '收款商户号';
COMMENT ON COLUMN "qrpay"."cmb_order"."status" IS '订单状态';
COMMENT ON COLUMN "qrpay"."cmb_order"."pay_status" IS '支付状态';
COMMENT ON COLUMN "qrpay"."cmb_order"."result_code" IS '富友错误代码, 000000成功,其他失败';
COMMENT ON COLUMN "qrpay"."cmb_order"."result_msg" IS '富友错误代码描述';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_appid" IS '公众号id';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_timestamp" IS '时间戳，自1970年1月1日 0点0分0秒以来的秒数';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_noncestr" IS '随机字符串';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_package" IS '订单性情扩展字符串';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_signtype" IS '签名方式, trade_type为JSAPI、LETPAY时才返回';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_paysign" IS '签名';
COMMENT ON COLUMN "qrpay"."cmb_order"."sdk_partnerid" IS 'trade_type为APP时才返回';
COMMENT ON COLUMN "qrpay"."cmb_order"."reserved_fy_order_no" IS '富友生成的订单号,需要商户与商户订单号进行关联';
COMMENT ON COLUMN "qrpay"."cmb_order"."reserved_fy_settle_dt" IS '富友清算日';
COMMENT ON COLUMN "qrpay"."cmb_order"."reserved_transaction_id" IS '渠道交易流水号, trade_type为FWC时返回（用于调起支付）';
COMMENT ON COLUMN "qrpay"."cmb_order"."reserved_fy_trace_no" IS '富友系统内部追踪号';
COMMENT ON COLUMN "qrpay"."cmb_order"."reserved_channel_order_id" IS '条码流水号，用户账单二维码对应的流水';
COMMENT ON COLUMN "qrpay"."cmb_order"."pay_result_code" IS '微信/支付宝错误代码';
COMMENT ON COLUMN "qrpay"."cmb_order"."pay_result_msg" IS '微信/支付宝错误代码描述';
COMMENT ON COLUMN "qrpay"."cmb_order"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_order"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_order"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_order"."mer_indus_one" IS '一级商户所属行业分类';
COMMENT ON COLUMN "qrpay"."cmb_order"."fy_webchat_openid" IS '富友appid的微信唯一标识';
COMMENT ON COLUMN "qrpay"."cmb_order"."sub_amount" IS '减单金额';
COMMENT ON COLUMN "qrpay"."cmb_order"."sub_aft_amount" IS '减单后金额';
COMMENT ON COLUMN "qrpay"."cmb_order"."act_id" IS '活动id（首减）';
COMMENT ON COLUMN "qrpay"."cmb_order"."mer_third_id" IS '报给第三方的字段';
COMMENT ON COLUMN "qrpay"."cmb_order"."dis_act_id" IS '平台折扣活动-活动ID';
COMMENT ON COLUMN "qrpay"."cmb_order"."plat_discount" IS '平台折扣活动-平台折扣率（折扣2折=20）冗余,因为又上限，实际无用';
COMMENT ON COLUMN "qrpay"."cmb_order"."plat_amount" IS '平台折扣活动-平台补贴金额';
COMMENT ON COLUMN "qrpay"."cmb_order"."is_max" IS '平台折扣活动-是否触发上限金额(0:未触发，1:已触发)';

-- ----------------------------
-- Table structure for cmb_pushrelation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_pushrelation";
CREATE TABLE "qrpay"."cmb_pushrelation" (
"id" numeric(20) NOT NULL,
"registrationid" varchar(100) COLLATE "default" NOT NULL,
"mid" numeric(20),
"alias" varchar(100) COLLATE "default",
"tag" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_pushrelation" IS 'C端极光推送注册表';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."registrationid" IS '极光注册id';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."alias" IS '别名';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."tag" IS '标签(半角逗号隔开)';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_pushrelation"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_qq
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_qq";
CREATE TABLE "qrpay"."cmb_qq" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mb_qq_unionid" varchar(50) COLLATE "default" NOT NULL,
"mb_qq_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_qq_photo" varchar(200) COLLATE "default" DEFAULT 0,
"mb_qq_name" varchar(100) COLLATE "default" DEFAULT 0,
"mb_qq_bindtime" timestamp(6) DEFAULT now() NOT NULL,
"mb_qq_unbindtime" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_qq" IS '会员QQ关联表';
COMMENT ON COLUMN "qrpay"."cmb_qq"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_unionid" IS 'QQ用户标识(unionid)';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_status" IS 'QQ绑定状态';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_photo" IS 'QQ图像地址';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_name" IS 'QQ名称';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_bindtime" IS '绑定时间';
COMMENT ON COLUMN "qrpay"."cmb_qq"."mb_qq_unbindtime" IS '解绑时间';
COMMENT ON COLUMN "qrpay"."cmb_qq"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_qq"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_qq"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_recommend
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_recommend";
CREATE TABLE "qrpay"."cmb_recommend" (
"id" numeric(20) NOT NULL,
"recommend_mid" numeric(20) NOT NULL,
"passive_mid" numeric(20) NOT NULL,
"recommend_type" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_recommend" IS '用户推荐关系表';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."recommend_mid" IS '推荐人MID';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."passive_mid" IS '被推荐人MID';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."recommend_type" IS '推荐方式（0：H5自动；1：H5手动填入）';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_recommend"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_sms_code
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_sms_code";
CREATE TABLE "qrpay"."cmb_sms_code" (
"id" numeric(20) NOT NULL,
"mid" numeric(20),
"mb_phone" varchar(50) COLLATE "default" NOT NULL,
"sms_code" varchar(25) COLLATE "default" NOT NULL,
"sms_type" numeric(2) DEFAULT 0 NOT NULL,
"sms_status" numeric(2) DEFAULT 0 NOT NULL,
"sms_err_count" numeric(8) DEFAULT 0 NOT NULL,
"sms_code_type" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_sms_code" IS '短信验证码表';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."mb_phone" IS '用户手机号码';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."sms_code" IS '短信验证码';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."sms_type" IS '短信业务类型（0：注册,1:登录，2：找回交易密码）';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."sms_status" IS '使用状态(0:未使用，1：已使用)';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."sms_err_count" IS '发送错误次数（为防止一直刷验证码）';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."sms_code_type" IS '短信类型（0文本 1语音）';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_sms_code"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_voucher
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_voucher";
CREATE TABLE "qrpay"."cmb_voucher" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"betch" varchar(100) COLLATE "default" NOT NULL,
"use_amount" numeric(20) NOT NULL,
"amount" numeric(20) NOT NULL,
"start_time" timestamp(6),
"end_time" timestamp(6),
"use_status" numeric(2),
"use_time" timestamp(6),
"get_type" numeric(2),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"activity_id" numeric(20),
"source_id" numeric(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_voucher" IS '优惠券批次';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."mid" IS '用户MID';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."betch" IS '批次编号';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."use_amount" IS '使用最低满足金额';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."amount" IS '实际面额';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."start_time" IS '可使用区间开始时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."end_time" IS '可使用区间结束时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."use_status" IS '使用状态（0：未使用；1：使用中：2：已使用）';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."use_time" IS '使用时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."get_type" IS '获得方式（1：注册；）';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."activity_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."cmb_voucher"."source_id" IS '券来源id';

-- ----------------------------
-- Table structure for cmb_voucher_batch
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_voucher_batch";
CREATE TABLE "qrpay"."cmb_voucher_batch" (
"id" numeric(20) NOT NULL,
"betch" varchar(100) COLLATE "default" NOT NULL,
"betch_name" varchar(100) COLLATE "default" NOT NULL,
"use_des" varchar(500) COLLATE "default" NOT NULL,
"use_amount" numeric(20) NOT NULL,
"amount" numeric(20) NOT NULL,
"date_type" numeric(2) NOT NULL,
"start_time" timestamp(6),
"end_time" timestamp(6),
"end_day" numeric(20),
"is_num" numeric(2) NOT NULL,
"total_num" numeric(20),
"over_num" numeric(20),
"betch_status" numeric(2) NOT NULL,
"user_id" numeric(20),
"user_name" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for cmb_voucher_batch_mer
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_voucher_batch_mer";
CREATE TABLE "qrpay"."cmb_voucher_batch_mer" (
"id" numeric(20) NOT NULL,
"merid" numeric(20) NOT NULL,
"batch" varchar(100) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"type" numeric(2) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_voucher_batch_mer" IS '优惠券批次商户关联表';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."id" IS '主键id';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."merid" IS '商户id';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."batch" IS '批次号';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_voucher_batch_mer"."type" IS '1:商户可以；2：商户不可以';

-- ----------------------------
-- Table structure for cmb_voucher_sendlog
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_voucher_sendlog";
CREATE TABLE "qrpay"."cmb_voucher_sendlog" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mb_vipid" numeric(20) NOT NULL,
"betch" varchar(100) COLLATE "default" NOT NULL,
"sendlog_betch" varchar(100) COLLATE "default" NOT NULL,
"send_status" numeric(2) DEFAULT 0 NOT NULL,
"send_time" timestamp(6),
"send_person_id" numeric(20),
"send_person_name" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_voucher_sendlog" IS '线下发送优惠券记录表';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."mid" IS '收券用户MID';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."mb_vipid" IS '收券用户学子卡号';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."betch" IS '券批次编号';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."sendlog_betch" IS '发送记录批次';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."send_status" IS '发送状态（0：新增；1：发券中；2：发券成功：3：发券失败）';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."send_time" IS '发送时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."send_person_id" IS '发送人id';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."send_person_name" IS '发送人名称';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_voucher_sendlog"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for cmb_webchat
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."cmb_webchat";
CREATE TABLE "qrpay"."cmb_webchat" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mb_wx_openid" varchar(50) COLLATE "default" NOT NULL,
"mb_wx_status" numeric(2) DEFAULT 0 NOT NULL,
"mb_wx_photo" varchar(200) COLLATE "default" DEFAULT 0,
"mb_wx_name" varchar(100) COLLATE "default" DEFAULT 0,
"mb_wx_bindtime" timestamp(6) DEFAULT now() NOT NULL,
"mb_wx_unbindtime" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"mb_wx_bind_type" numeric(2) DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."cmb_webchat" IS '会员微信关联表';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_openid" IS '微信用户标识(openID)';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_status" IS '微信绑定状态';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_photo" IS '微信图像地址';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_name" IS '微信名称';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_bindtime" IS '绑定时间';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_unbindtime" IS '解绑时间';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."cmb_webchat"."mb_wx_bind_type" IS '1:关联微信OPENID（扫码支付使用）,2.关联微信UnionID（主要给app绑定登录使用）,3.关联小程序openId';

-- ----------------------------
-- Table structure for fin_bank
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_bank";
CREATE TABLE "qrpay"."fin_bank" (
"bankid" numeric(20) NOT NULL,
"bank_name" varchar(50) COLLATE "default" NOT NULL,
"bank_unioncode" varchar(50) COLLATE "default",
"bank_pbccode" varchar(50) COLLATE "default",
"bank_icourl" varchar(500) COLLATE "default",
"bank_status" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_bank" IS '银行表';
COMMENT ON COLUMN "qrpay"."fin_bank"."bankid" IS '银行ID';
COMMENT ON COLUMN "qrpay"."fin_bank"."bank_name" IS '银行名称';
COMMENT ON COLUMN "qrpay"."fin_bank"."bank_unioncode" IS '清算联行号';
COMMENT ON COLUMN "qrpay"."fin_bank"."bank_pbccode" IS '央行行号';
COMMENT ON COLUMN "qrpay"."fin_bank"."bank_icourl" IS '银行图标url';
COMMENT ON COLUMN "qrpay"."fin_bank"."bank_status" IS '状态 1-有效 2-无效';
COMMENT ON COLUMN "qrpay"."fin_bank"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_bank"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_bank"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_bank_union
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_bank_union";
CREATE TABLE "qrpay"."fin_bank_union" (
"id" numeric(20) NOT NULL,
"union_code" varchar(50) COLLATE "default" NOT NULL,
"union_name" varchar(200) COLLATE "default",
"bank_code" varchar(50) COLLATE "default",
"city_code" varchar(50) COLLATE "default",
"bank_status" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_bank_union" IS '支行表';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."union_code" IS '支行联行号';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."union_name" IS '支行名称';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."bank_code" IS '银行代码（银行表央行号）';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."city_code" IS '城市代码（市）';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."bank_status" IS '状态 1-有效 2-无效';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_bank_union"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_bankcard_auth
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_bankcard_auth";
CREATE TABLE "qrpay"."fin_bankcard_auth" (
"id" numeric(20) NOT NULL,
"mid" numeric(20),
"checktype" numeric(2) NOT NULL,
"card_no" varchar(100) COLLATE "default" NOT NULL,
"bank_id" numeric(20) NOT NULL,
"realname" varchar(50) COLLATE "default",
"phone" varchar(100) COLLATE "default",
"identity" varchar(100) COLLATE "default",
"status" numeric(2) DEFAULT 0 NOT NULL,
"rtcode" varchar(50) COLLATE "default",
"rtmsg" varchar(1000) COLLATE "default",
"auth_code" varchar(50) COLLATE "default",
"bank_code" varchar(25) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_bankcard_auth" IS '鉴权记录表';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."mid" IS '发起验证人MID';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."checktype" IS '验证方式 1-三要素 2-四要素 3-五要素';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."card_no" IS '卡号';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."bank_id" IS '银行id';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."realname" IS '真实姓名';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."phone" IS '预留手机号';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."identity" IS '证件号码';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."status" IS '验证状态 0-新增 1-成功 2-失败 3-异常';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."rtcode" IS '返回编码';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."rtmsg" IS '返回文字';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."auth_code" IS '鉴权协议号';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."bank_code" IS '银行编码';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_bankcard_auth"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_mb_bankcard
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_mb_bankcard";
CREATE TABLE "qrpay"."fin_mb_bankcard" (
"bcid" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"card_no" varchar(100) COLLATE "default" NOT NULL,
"bank_id" numeric(20) NOT NULL,
"bank_name" varchar(50) COLLATE "default",
"realname" varchar(100) COLLATE "default",
"mb_phone" varchar(100) COLLATE "default",
"identity" varchar(100) COLLATE "default",
"card_status" numeric(2) DEFAULT 0 NOT NULL,
"card_valid" numeric(2) DEFAULT 0 NOT NULL,
"card_validtime" timestamp(6),
"province_code" varchar(25) COLLATE "default",
"city_code" varchar(25) COLLATE "default",
"city_name" varchar(50) COLLATE "default",
"branch_code" varchar(50) COLLATE "default",
"branch_name" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_mb_bankcard" IS '银行卡信息表';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."bcid" IS '银行卡ID';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."mid" IS '用户id';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."card_no" IS '卡号';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."bank_id" IS '银行ID';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."bank_name" IS '银行名称';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."realname" IS '持卡人姓名';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."mb_phone" IS '预留手机号';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."identity" IS '身份证号码';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."card_status" IS '状态 0-未启用 1-正常 2-冻结 ';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."card_valid" IS '是否验证 0-未验证 1-已验证 2-验证中';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."card_validtime" IS '卡验证时间';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."province_code" IS '省编码';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."city_code" IS '城市编码';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."city_name" IS '城市名称';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."branch_code" IS '支行联号';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."branch_name" IS '支行名称';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_mb_bankcard"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_mer_channel
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_mer_channel";
CREATE TABLE "qrpay"."fin_mer_channel" (
"channelid" numeric(20) NOT NULL,
"channelname" varchar(50) COLLATE "default" NOT NULL,
"status" numeric(2) NOT NULL,
"sort" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_mer_channel" IS '商户收款渠道表';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."channelid" IS '渠道ID';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."channelname" IS '渠道名称';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."status" IS '渠道状态（0：无效；1：有效）';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."sort" IS '渠道优先级';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_mer_channel"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_outcome
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_outcome";
CREATE TABLE "qrpay"."fin_outcome" (
"id" numeric(20) NOT NULL,
"code" varchar(30) COLLATE "default" NOT NULL,
"mid" numeric(20),
"mer_id" numeric(20),
"bcid" numeric(20),
"type" numeric(2) NOT NULL,
"from_code" numeric(20),
"status" numeric(2) NOT NULL,
"pay_status" numeric(2) NOT NULL,
"amount" numeric(20) NOT NULL,
"realamount" numeric(20) NOT NULL,
"poundage" numeric(20) NOT NULL,
"appid" numeric(2) DEFAULT 1,
"submit_time" timestamp(6),
"submit_id" numeric(20),
"submit_name" varchar(50) COLLATE "default",
"close_time" timestamp(6),
"close_name" varchar(50) COLLATE "default",
"succ_time" timestamp(6),
"create_name" varchar(50) COLLATE "default",
"channel_pay_status" numeric(2),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_outcome" IS '提现申请表';
COMMENT ON COLUMN "qrpay"."fin_outcome"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."fin_outcome"."code" IS '提现申请单号';
COMMENT ON COLUMN "qrpay"."fin_outcome"."mid" IS '用户ID（个人用户提现关联）';
COMMENT ON COLUMN "qrpay"."fin_outcome"."mer_id" IS '商户ID（商户结算关联用）';
COMMENT ON COLUMN "qrpay"."fin_outcome"."bcid" IS '银行卡id（个人用户提现关联）';
COMMENT ON COLUMN "qrpay"."fin_outcome"."type" IS '单据类型（1：商户结算；2.个人用户提现）';
COMMENT ON COLUMN "qrpay"."fin_outcome"."from_code" IS '来源单据号(商户结算填日结id 等)';
COMMENT ON COLUMN "qrpay"."fin_outcome"."status" IS '单据状态 0-新增 1-已审核 2-处理中 3-已完成 4-异常';
COMMENT ON COLUMN "qrpay"."fin_outcome"."pay_status" IS '付款状态 0-未付款 1-付款成功 2-付款失败 ';
COMMENT ON COLUMN "qrpay"."fin_outcome"."amount" IS '单据金额(含手续费)*1000储存';
COMMENT ON COLUMN "qrpay"."fin_outcome"."realamount" IS '实付金额(*1000储存)';
COMMENT ON COLUMN "qrpay"."fin_outcome"."poundage" IS '手续费(*1000储存)';
COMMENT ON COLUMN "qrpay"."fin_outcome"."appid" IS '客户端ID(0：系统；1:H5)';
COMMENT ON COLUMN "qrpay"."fin_outcome"."submit_time" IS '审核时间';
COMMENT ON COLUMN "qrpay"."fin_outcome"."submit_id" IS '审核人ID';
COMMENT ON COLUMN "qrpay"."fin_outcome"."submit_name" IS '审核人';
COMMENT ON COLUMN "qrpay"."fin_outcome"."close_time" IS '完成时间';
COMMENT ON COLUMN "qrpay"."fin_outcome"."close_name" IS '完成人';
COMMENT ON COLUMN "qrpay"."fin_outcome"."succ_time" IS '成功时间';
COMMENT ON COLUMN "qrpay"."fin_outcome"."create_name" IS '创建人';
COMMENT ON COLUMN "qrpay"."fin_outcome"."channel_pay_status" IS '到账状态 0-待确认 1-通过 2-拒绝 3-待处理';
COMMENT ON COLUMN "qrpay"."fin_outcome"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_outcome"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_outcome"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_outcome_batch
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_outcome_batch";
CREATE TABLE "qrpay"."fin_outcome_batch" (
"id" numeric(20) NOT NULL,
"batch_code" numeric(20) NOT NULL,
"status" numeric(2) NOT NULL,
"channelid" numeric(20) NOT NULL,
"batch_count" numeric(10) NOT NULL,
"batch_amount" numeric(20) NOT NULL,
"down_count" numeric(10),
"success_count" numeric(10),
"return_count" numeric(10),
"fail_count" numeric(10),
"paytype" numeric(2) NOT NULL,
"owner_id" numeric(20),
"owner_name" varchar(50) COLLATE "default",
"update_name" varchar(50) COLLATE "default",
"create_name" varchar(50) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_outcome_batch" IS '提现批次表';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."batch_code" IS '批次号';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."status" IS '批次状态 0-新增 1-处理中 2-已撤销 3-已完成 4-未生成';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."channelid" IS '付款渠道id';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."batch_count" IS '批次数量';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."batch_amount" IS '批次总金额';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."down_count" IS '下载次数 ';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."success_count" IS '成功数量';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."return_count" IS '完成数量';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."fail_count" IS '失败数量';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."paytype" IS '付款类型（1手动；）';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."owner_id" IS '领单人ID';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."owner_name" IS '领单人姓名';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."update_name" IS '更新人';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."create_name" IS '创建人';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_outcome_batch"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for fin_outcome_pay
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."fin_outcome_pay";
CREATE TABLE "qrpay"."fin_outcome_pay" (
"id" numeric(20) NOT NULL,
"code" varchar(30) COLLATE "default" NOT NULL,
"paytype" numeric(2) DEFAULT 1 NOT NULL,
"realname" varchar(100) COLLATE "default",
"cardno" varchar(100) COLLATE "default",
"idtype" numeric(4),
"identity" varchar(100) COLLATE "default",
"phone" varchar(100) COLLATE "default",
"channelid" numeric(20),
"bankid" numeric(20) NOT NULL,
"bankcode" varchar(20) COLLATE "default",
"provincename" varchar(20) COLLATE "default",
"cityname" varchar(50) COLLATE "default",
"citycode" varchar(20) COLLATE "default",
"branchcode" varchar(20) COLLATE "default",
"branchname" varchar(100) COLLATE "default",
"owner_id" numeric(20),
"ownername" varchar(50) COLLATE "default",
"batchcode" numeric(20),
"canpaytime" timestamp(6),
"batchstatus" numeric(2),
"paymid" numeric(20),
"paybcid" numeric(20),
"update_name" varchar(50) COLLATE "default",
"create_name" varchar(50) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."fin_outcome_pay" IS '付款记录表';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."code" IS '付款单据号';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."paytype" IS '付款类型（1手动；）';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."realname" IS '真实姓名';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."cardno" IS '银行卡号';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."idtype" IS '证件类型';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."identity" IS '证件号码';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."phone" IS '手机号码(预留手机号码)';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."channelid" IS '付款渠道id 预留';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."bankid" IS '银行ID';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."bankcode" IS '银行编码';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."provincename" IS '省';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."cityname" IS '城市名称';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."citycode" IS '城市编码';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."branchcode" IS '支行联行号';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."branchname" IS '支行名称';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."owner_id" IS '领单人ID';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."ownername" IS '领单人姓名';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."batchcode" IS '付款批次号';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."canpaytime" IS '最早付款时间';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."batchstatus" IS '付款批次状态';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."paymid" IS '付款账户mid';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."paybcid" IS '付款银行卡';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."update_name" IS '更新人';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."create_name" IS '创建人';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."fin_outcome_pay"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for jigsaw_activity
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_activity";
CREATE TABLE "qrpay"."jigsaw_activity" (
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(50) COLLATE "default" NOT NULL,
"activity_desc" text COLLATE "default",
"win_rule" text COLLATE "default",
"award_desc_url" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_activity" IS '拼图活动表';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."jigsaw_activity_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."jigsaw_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."activity_desc" IS '活动描述';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."win_rule" IS '获奖规则';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."award_desc_url" IS '奖励描述';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_activity_image
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_activity_image";
CREATE TABLE "qrpay"."jigsaw_activity_image" (
"jigsaw_activity_image_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"sort" numeric(2) NOT NULL,
"image_url" varchar(255) COLLATE "default" NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_activity_image" IS '拼图活动图片表';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."jigsaw_activity_image_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."jigsaw_activity_name" IS '拼图活动名称';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."image_url" IS '图片url';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_image"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_activity_prize
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_activity_prize";
CREATE TABLE "qrpay"."jigsaw_activity_prize" (
"jigsaw_activity_prize_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"award_id" numeric(20) NOT NULL,
"type" numeric(2) NOT NULL,
"jigsaw_activity_prize_name" varchar(100) COLLATE "default" NOT NULL,
"prize_desc" varchar(500) COLLATE "default",
"prize_level" numeric(2) NOT NULL,
"prize_count" numeric(10) NOT NULL,
"prize_show_count" numeric(10) DEFAULT 0,
"prize_remain_count" numeric(10),
"prize_today_count" numeric(10),
"prize_today_remain_count" numeric(10),
"prize_image_url" varchar(255) COLLATE "default",
"prize_win_chance" numeric(10,9),
"sort" numeric(2) NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_activity_prize" IS '拼图活动奖品表';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."jigsaw_activity_prize_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."jigsaw_activity_name" IS '拼图活动名称';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."award_id" IS '奖品Id（卡卷ID或优惠券ID）';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."type" IS '类型（1卡券,2线上优惠券）';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."jigsaw_activity_prize_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_desc" IS '奖品描述';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_level" IS '奖品等级';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_count" IS '奖品数量';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_show_count" IS '奖品数量(注水值)';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_remain_count" IS '奖品剩余数量';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_today_count" IS '当天可抽数量';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_today_remain_count" IS '当天可抽剩余数量';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_image_url" IS '奖品图片url';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."prize_win_chance" IS '中奖概率字段';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."sort" IS '产品显示排序（升序）';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_activity_prize"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_default_winner
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_default_winner";
CREATE TABLE "qrpay"."jigsaw_default_winner" (
"jigsaw_default_winner_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_default_winner" IS '拼图活动默认中奖白名单表';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."jigsaw_default_winner_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_default_winner"."delete_user" IS '删除者';

-- ----------------------------
-- Table structure for jigsaw_greeting
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_greeting";
CREATE TABLE "qrpay"."jigsaw_greeting" (
"jigsaw_greeting_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"greeting_text" varchar(500) COLLATE "default" NOT NULL,
"sort" numeric(2) NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_greeting" IS '拼图默认祝福语配置值表';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."jigsaw_greeting_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."greeting_text" IS '祝福语';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."sort" IS '排序（升序）';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_greeting"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_order
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_order";
CREATE TABLE "qrpay"."jigsaw_order" (
"jigsaw_order_id" varchar(50) COLLATE "default" NOT NULL,
"image_piece_count" numeric(2) NOT NULL,
"is_send_card" numeric(2) NOT NULL,
"greeting_text" varchar(500) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"jigsaw_activity_image_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_image_url" varchar(255) COLLATE "default" NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_order" IS '拼图用户订单表';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."jigsaw_order_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."image_piece_count" IS '拼图数量';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."is_send_card" IS '是否寄送贺卡';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."greeting_text" IS '祝福语';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."jigsaw_activity_name" IS '拼图活动名称';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."jigsaw_activity_image_id" IS '所选拼图图片的id';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."jigsaw_activity_image_url" IS '所选拼图图片的url';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_order"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_user_activity
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_user_activity";
CREATE TABLE "qrpay"."jigsaw_user_activity" (
"jigsaw_user_activity_id" varchar(255) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"play_count" numeric(10),
"success_play_count" numeric(10),
"fail_play_coun" numeric(10),
"can_lottery_count" numeric(10),
"had_lottery_count" numeric(10),
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_user_activity" IS '拼图用户活动表';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."jigsaw_user_activity_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."jigsaw_activity_id" IS '拼图活动id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."jigsaw_activity_name" IS '拼图活动名称';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."play_count" IS '已玩游戏次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."success_play_count" IS '成功次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."fail_play_coun" IS '失败次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."can_lottery_count" IS '可抽奖次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."had_lottery_count" IS '已抽奖次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_activity"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_user_lottery_chance_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_user_lottery_chance_record";
CREATE TABLE "qrpay"."jigsaw_user_lottery_chance_record" (
"jigsaw_user_lottery_chance_record_id" varchar(50) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"add_lottery_count" numeric(10) NOT NULL,
"chance_source" numeric(2) NOT NULL,
"source_user_id" numeric(20),
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_user_lottery_chance_record" IS '拼图用户抽奖次数流水表';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."jigsaw_user_lottery_chance_record_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."jigsaw_activity_id" IS '拼图活动主表id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."jigsaw_activity_name" IS '拼图活动主表名称';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."add_lottery_count" IS '增加抽奖次数';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."chance_source" IS '抽奖机会来源（1，自己完成拼图2、转发完成拼图）';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."source_user_id" IS '转发完成者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_chance_record"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for jigsaw_user_lottery_result
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."jigsaw_user_lottery_result";
CREATE TABLE "qrpay"."jigsaw_user_lottery_result" (
"jigsaw_user_lottery_result_id" varchar(50) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"jigsaw_activity_id" varchar(50) COLLATE "default" NOT NULL,
"jigsaw_activity_name" varchar(100) COLLATE "default",
"lottery_result" numeric(2) NOT NULL,
"jigsaw_activity_prize_id" varchar(50) COLLATE "default",
"jigsaw_activity_prize_name" varchar(100) COLLATE "default",
"prize_level" numeric(2),
"prize_desc" varchar(100) COLLATE "default",
"prize_image_url" varchar(100) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."jigsaw_user_lottery_result" IS '拼图用户抽奖结果表';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."jigsaw_user_lottery_result_id" IS '主键';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."jigsaw_activity_id" IS '拼图活动主表id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."jigsaw_activity_name" IS '拼图活动主表名称';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."lottery_result" IS '抽奖结果(1:没中奖，0:中奖)';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."jigsaw_activity_prize_id" IS '奖品id';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."jigsaw_activity_prize_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."prize_level" IS '奖品等级';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."prize_desc" IS '奖品描述';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."prize_image_url" IS '奖品图片url';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."update_user" IS '更新着';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."del_flag" IS '有效标记(0:有效, 1:无效)';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."jigsaw_user_lottery_result"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."message";
CREATE TABLE "qrpay"."message" (
"message_id" varchar(50) COLLATE "default" NOT NULL,
"message_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"message_text" varchar(500) COLLATE "default" DEFAULT NULL::character varying,
"message_type" int8 NOT NULL,
"trigger_content_id" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"trigger_content_status" int8,
"operation_reason" varchar(200) COLLATE "default" DEFAULT NULL::character varying,
"trigger_content_id_source" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"trigger_content_id_source_user_id" int8,
"target_user_id" int8 NOT NULL,
"message_unread" int8 DEFAULT 0,
"message_url" varchar(200) COLLATE "default" DEFAULT NULL::character varying,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT '2019-04-15 10:38:26.87209'::timestamp without time zone,
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT '2019-04-15 10:38:26.87209'::timestamp without time zone,
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "qrpay"."message"."message_id" IS '主键';
COMMENT ON COLUMN "qrpay"."message"."message_name" IS '消息名称';
COMMENT ON COLUMN "qrpay"."message"."message_text" IS '消息内容(可能为空)';
COMMENT ON COLUMN "qrpay"."message"."message_type" IS '消息类型';
COMMENT ON COLUMN "qrpay"."message"."trigger_content_id" IS '触发消息的内容Id(比如奖品主键)';
COMMENT ON COLUMN "qrpay"."message"."trigger_content_status" IS '触发消息的内容的状态(比如系统发奖:待领奖,已领奖)';
COMMENT ON COLUMN "qrpay"."message"."operation_reason" IS '操作原因(回复了你的评论,涉黄被删等)';
COMMENT ON COLUMN "qrpay"."message"."trigger_content_id_source" IS '触发消息的内容Id来源(因为什么发奖,比如微博点赞最高的获奖,对应的微博id)';
COMMENT ON COLUMN "qrpay"."message"."trigger_content_id_source_user_id" IS '触发消息的内容Id来源所属用户(这个微博是谁发的)';
COMMENT ON COLUMN "qrpay"."message"."target_user_id" IS '消息接收者Id';
COMMENT ON COLUMN "qrpay"."message"."message_unread" IS '消息未读(0:未读,1:已读)';
COMMENT ON COLUMN "qrpay"."message"."message_url" IS '消息跳转地址';
COMMENT ON COLUMN "qrpay"."message"."status" IS '有效状态(0:false,1:true)';
COMMENT ON COLUMN "qrpay"."message"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."message"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."message"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."message"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."message"."delete_flag" IS '删除标记(0:已删除,1:未删除)';
COMMENT ON COLUMN "qrpay"."message"."delete_user" IS '删除者';

-- ----------------------------
-- Table structure for microblog
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog";
CREATE TABLE "qrpay"."microblog" (
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(100) COLLATE "default",
"microblog_content" varchar(1000) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"tribe_id" varchar(50) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_name" varchar(50) COLLATE "default",
"comment_count" numeric(20) DEFAULT 0,
"show_comment_count" numeric(20) DEFAULT 0,
"like_count" numeric(20) DEFAULT 0,
"show_like_count" numeric(20) DEFAULT 0,
"resend_count" numeric(20) DEFAULT 0,
"show_resend_count" numeric(20) DEFAULT 0,
"share_count" numeric(20) DEFAULT 0,
"show_share_count" numeric(20) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"qrpay_article_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog" IS '微博（动态）表';
COMMENT ON COLUMN "qrpay"."microblog"."microblog_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog"."microblog_content" IS '微博内容';
COMMENT ON COLUMN "qrpay"."microblog"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."microblog"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."microblog"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog"."tribe_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."microblog"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."microblog"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."microblog"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."microblog"."comment_count" IS '评论数';
COMMENT ON COLUMN "qrpay"."microblog"."show_comment_count" IS '评论数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog"."like_count" IS '点赞数';
COMMENT ON COLUMN "qrpay"."microblog"."show_like_count" IS '点赞数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog"."resend_count" IS '转发数';
COMMENT ON COLUMN "qrpay"."microblog"."show_resend_count" IS '转发数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog"."share_count" IS '分享数';
COMMENT ON COLUMN "qrpay"."microblog"."show_share_count" IS '分享数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."microblog"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."microblog"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."microblog"."qrpay_article_id" IS '关联文章Id';

-- ----------------------------
-- Table structure for microblog_comment
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_comment";
CREATE TABLE "qrpay"."microblog_comment" (
"microblog_comment_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(100) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"comment_content" varchar(1000) COLLATE "default" NOT NULL,
"like_count" numeric(20) DEFAULT 0,
"show_like_count" numeric(20) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default" DEFAULT 0,
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"reply_microblog_comment_id" varchar(50) COLLATE "default",
"reply_user_id" varchar(50) COLLATE "default",
"reply_user_name" varchar(50) COLLATE "default",
"reply_user_cellphone" varchar(50) COLLATE "default",
"reply_nick_name" varchar(50) COLLATE "default",
"reply_user_avatar" varchar(255) COLLATE "default",
"image_url" varchar(255) COLLATE "default",
"reply_image_url" varchar(255) COLLATE "default",
"reply_comment_content" varchar(1000) COLLATE "default",
"floor" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_comment" IS '微博评论表';
COMMENT ON COLUMN "qrpay"."microblog_comment"."microblog_comment_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_comment"."microblog_id" IS '微博id';
COMMENT ON COLUMN "qrpay"."microblog_comment"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_comment"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."microblog_comment"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_comment"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."microblog_comment"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_comment"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_comment"."comment_content" IS '评论内容';
COMMENT ON COLUMN "qrpay"."microblog_comment"."like_count" IS '点赞数';
COMMENT ON COLUMN "qrpay"."microblog_comment"."show_like_count" IS '点赞数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_comment"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_comment"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_comment"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_comment"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_comment"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."microblog_comment"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."microblog_comment"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_comment"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_microblog_comment_id" IS '回复的评论id';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_user_id" IS '回复的评论用户id';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_user_name" IS '回复的评论用户名称';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_user_cellphone" IS '回复的评论用户手机';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_nick_name" IS '回复的评论昵称';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_user_avatar" IS '回复的评论用户头像';
COMMENT ON COLUMN "qrpay"."microblog_comment"."image_url" IS '评论图片';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_image_url" IS '回复的评论图片';
COMMENT ON COLUMN "qrpay"."microblog_comment"."reply_comment_content" IS '回复的评论内容';
COMMENT ON COLUMN "qrpay"."microblog_comment"."floor" IS '评论楼层';

-- ----------------------------
-- Table structure for microblog_comment_delete_log
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_comment_delete_log";
CREATE TABLE "qrpay"."microblog_comment_delete_log" (
"microblog_comment_delete_log_delete_log_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_comment_delete_log_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(300) COLLATE "default",
"user_id" numeric(20),
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"comment_content" varchar(1000) COLLATE "default" NOT NULL,
"like_count" numeric(20) DEFAULT 0,
"show_like_count" numeric(20) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default" DEFAULT 0,
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_flag" numeric(2) DEFAULT 0 NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"reply_microblog_comment_delete_log_id" varchar(50) COLLATE "default",
"reply_user_id" varchar(50) COLLATE "default",
"reply_user_name" varchar(50) COLLATE "default",
"reply_user_cellphone" varchar(50) COLLATE "default",
"reply_nick_name" varchar(50) COLLATE "default",
"reply_user_avatar" varchar(255) COLLATE "default",
"image_url" varchar(255) COLLATE "default",
"reply_comment_content" varchar(1000) COLLATE "default",
"reply_image_url" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_comment_delete_log" IS '微博评论表';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."microblog_comment_delete_log_delete_log_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."microblog_comment_delete_log_id" IS '评论id';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."microblog_id" IS '微博id';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."comment_content" IS '评论内容';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."like_count" IS '点赞数';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."show_like_count" IS '点赞数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_microblog_comment_delete_log_id" IS '回复的评论id';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_user_id" IS '回复的评论用户id';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_user_name" IS '回复的评论用户名称';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_user_cellphone" IS '回复的评论用户手机';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_nick_name" IS '回复的评论昵称';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_user_avatar" IS '回复的评论用户头像';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."image_url" IS '评论图片';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_comment_content" IS '回复的评论内容';
COMMENT ON COLUMN "qrpay"."microblog_comment_delete_log"."reply_image_url" IS '回复的评论图片';

-- ----------------------------
-- Table structure for microblog_comment_report
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_comment_report";
CREATE TABLE "qrpay"."microblog_comment_report" (
"microblog_comment_report_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_comment_id" varchar(50) COLLATE "default",
"user_id" int8 NOT NULL,
"report_reason" varchar(50) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int4 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_comment_report" IS '微博（动态）表的评论举报表';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."microblog_comment_report_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."microblog_comment_id" IS '评论id';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."user_id" IS '举报人id';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."report_reason" IS '举报原因';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."delete_flag" IS '删除标记';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_comment_report"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for microblog_delete_log
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_delete_log";
CREATE TABLE "qrpay"."microblog_delete_log" (
"microblog_delete_log_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(100) COLLATE "default",
"microblog_content" varchar(1000) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"tribe_id" varchar(50) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_name" varchar(50) COLLATE "default",
"comment_count" numeric(20) DEFAULT 0,
"show_comment_count" numeric(20) DEFAULT 0,
"like_count" numeric(20) DEFAULT 0,
"show_like_count" numeric(20) DEFAULT 0,
"resend_count" numeric(20) DEFAULT 0,
"show_resend_count" numeric(20) DEFAULT 0,
"share_count" numeric(20) DEFAULT 0,
"show_share_count" numeric(20) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"qrpay_article_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_delete_log" IS '微博（动态）表删除日志表';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."microblog_delete_log_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."microblog_id" IS '微博主键';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."microblog_content" IS '微博内容';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."tribe_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."comment_count" IS '评论数';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."show_comment_count" IS '评论数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."like_count" IS '点赞数';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."show_like_count" IS '点赞数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."resend_count" IS '转发数';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."show_resend_count" IS '转发数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."share_count" IS '分享数';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."show_share_count" IS '分享数(注水值)';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."microblog_delete_log"."qrpay_article_id" IS '关联文章Id';

-- ----------------------------
-- Table structure for microblog_image
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_image";
CREATE TABLE "qrpay"."microblog_image" (
"microblog_image_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(100) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"image_url" varchar(255) COLLATE "default" NOT NULL,
"image_num" numeric(5) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_data" timestamp(6) DEFAULT now() NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_image" IS '微博图片表';
COMMENT ON COLUMN "qrpay"."microblog_image"."microblog_image_id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."microblog_image"."microblog_id" IS '微博ID';
COMMENT ON COLUMN "qrpay"."microblog_image"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_image"."user_id" IS '用户ID';
COMMENT ON COLUMN "qrpay"."microblog_image"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_image"."user_cellphone" IS '用户手机(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."microblog_image"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_image"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_image"."image_url" IS '图片路径';
COMMENT ON COLUMN "qrpay"."microblog_image"."image_num" IS '图片序号';
COMMENT ON COLUMN "qrpay"."microblog_image"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_image"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_image"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_image"."update_data" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_image"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_image"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."microblog_image"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."microblog_image"."delete_flag" IS '删除标识';

-- ----------------------------
-- Table structure for microblog_like
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_like";
CREATE TABLE "qrpay"."microblog_like" (
"microblog_like_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default",
"microblog_title" varchar(100) COLLATE "default",
"microblog_comment_id" varchar(50) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"source" numeric(2) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_like" IS '微博点赞表';
COMMENT ON COLUMN "qrpay"."microblog_like"."microblog_like_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_like"."microblog_id" IS '微博id';
COMMENT ON COLUMN "qrpay"."microblog_like"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_like"."microblog_comment_id" IS '微博评论id';
COMMENT ON COLUMN "qrpay"."microblog_like"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."microblog_like"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_like"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."microblog_like"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_like"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_like"."source" IS '点赞来源0，微博;1，微博评论';
COMMENT ON COLUMN "qrpay"."microblog_like"."status" IS '点赞状态（0点赞，1取消）';
COMMENT ON COLUMN "qrpay"."microblog_like"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_like"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_like"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_like"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_like"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."microblog_like"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."microblog_like"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_like"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for microblog_report
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_report";
CREATE TABLE "qrpay"."microblog_report" (
"microblog_report_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default",
"user_id" int8 NOT NULL,
"report_reason" varchar(50) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int4 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_report" IS '微博（动态）表';
COMMENT ON COLUMN "qrpay"."microblog_report"."microblog_report_id" IS '主键';
COMMENT ON COLUMN "qrpay"."microblog_report"."microblog_id" IS '微博id';
COMMENT ON COLUMN "qrpay"."microblog_report"."user_id" IS '举报人id';
COMMENT ON COLUMN "qrpay"."microblog_report"."report_reason" IS '举报原因';
COMMENT ON COLUMN "qrpay"."microblog_report"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_report"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_report"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_report"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_report"."delete_flag" IS '删除标记';
COMMENT ON COLUMN "qrpay"."microblog_report"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_report"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for microblog_resend
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."microblog_resend";
CREATE TABLE "qrpay"."microblog_resend" (
"microblog_resend_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_id" varchar(50) COLLATE "default" NOT NULL,
"microblog_title" varchar(100) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"resend_content" varchar(5000) COLLATE "default" NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_data" timestamp(6) DEFAULT now() NOT NULL,
"delete_user" varchar(50) COLLATE "default",
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_date" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."microblog_resend" IS '微博转发表';
COMMENT ON COLUMN "qrpay"."microblog_resend"."microblog_resend_id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."microblog_resend"."microblog_id" IS '微博ID';
COMMENT ON COLUMN "qrpay"."microblog_resend"."microblog_title" IS '微博标题';
COMMENT ON COLUMN "qrpay"."microblog_resend"."user_id" IS '用户ID';
COMMENT ON COLUMN "qrpay"."microblog_resend"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."microblog_resend"."user_cellphone" IS '用户手机(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."microblog_resend"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."microblog_resend"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."microblog_resend"."resend_content" IS '转发内容';
COMMENT ON COLUMN "qrpay"."microblog_resend"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."microblog_resend"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."microblog_resend"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."microblog_resend"."update_data" IS '更新时间';
COMMENT ON COLUMN "qrpay"."microblog_resend"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."microblog_resend"."del_flag" IS '删除标识';
COMMENT ON COLUMN "qrpay"."microblog_resend"."delete_flag" IS '删除标识 0:未删除；1，已删除';
COMMENT ON COLUMN "qrpay"."microblog_resend"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for nact_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."nact_goods_detail";
CREATE TABLE "qrpay"."nact_goods_detail" (
"id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"sale_status" numeric(2) DEFAULT 0 NOT NULL,
"card_password" varchar(200) COLLATE "default",
"serial_num" varchar(200) COLLATE "default" NOT NULL,
"out_voucher_id" varchar(200) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."nact_goods_detail" IS '商品详情表';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."goods_id" IS '批次ID';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."sale_status" IS '使用状态（0：未售出 1：已售出 2：使用中）';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."card_password" IS '卡密';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."serial_num" IS '序列号';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."out_voucher_id" IS '外部券ID';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."nact_goods_detail"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for promoter
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."promoter";
CREATE TABLE "qrpay"."promoter" (
"promoter_id" numeric(20) NOT NULL,
"promoter_name" varchar(100) COLLATE "default",
"promoter_type" numeric(20),
"user_id" numeric(20) NOT NULL,
"user_name" varchar(100) COLLATE "default",
"nick_name" varchar(100) COLLATE "default",
"user_cellphone" varchar(100) COLLATE "default",
"user_avatar" varchar(100) COLLATE "default",
"alipay_id" numeric(20),
"alipay_name" varchar(100) COLLATE "default",
"wx_id" numeric(20),
"wx_name" varchar(100) COLLATE "default",
"amount" numeric(20) DEFAULT 0,
"withdraw_amount" numeric(20) DEFAULT 0,
"register_source" numeric(2),
"register_date" timestamp(6) DEFAULT now() NOT NULL,
"register_ip" varchar(100) COLLATE "default",
"register_lng" varchar(100) COLLATE "default",
"register_lat" varchar(100) COLLATE "default",
"status" numeric(2) DEFAULT 0,
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."promoter" IS '推广人表';
COMMENT ON COLUMN "qrpay"."promoter"."promoter_id" IS '推广人id';
COMMENT ON COLUMN "qrpay"."promoter"."promoter_name" IS '推广人名称';
COMMENT ON COLUMN "qrpay"."promoter"."promoter_type" IS '推广人类型("1:个人；2:商户")';
COMMENT ON COLUMN "qrpay"."promoter"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."promoter"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."promoter"."nick_name" IS '用户昵称';
COMMENT ON COLUMN "qrpay"."promoter"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."promoter"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."promoter"."alipay_id" IS '提现的支付宝账户';
COMMENT ON COLUMN "qrpay"."promoter"."alipay_name" IS '支付宝账户姓名';
COMMENT ON COLUMN "qrpay"."promoter"."wx_id" IS '提现的微信账户';
COMMENT ON COLUMN "qrpay"."promoter"."wx_name" IS '微信账户姓名';
COMMENT ON COLUMN "qrpay"."promoter"."amount" IS '余额';
COMMENT ON COLUMN "qrpay"."promoter"."withdraw_amount" IS '可提现余额';
COMMENT ON COLUMN "qrpay"."promoter"."register_source" IS '账户来源(""1:ios转入；2:android；3:小程序；4，二维码加入"")';
COMMENT ON COLUMN "qrpay"."promoter"."register_date" IS '注册日期';
COMMENT ON COLUMN "qrpay"."promoter"."register_ip" IS '注册时IP';
COMMENT ON COLUMN "qrpay"."promoter"."register_lng" IS '注册时经度';
COMMENT ON COLUMN "qrpay"."promoter"."register_lat" IS '注册时维度';
COMMENT ON COLUMN "qrpay"."promoter"."status" IS '用户状态("0:未生效；1:有效")';
COMMENT ON COLUMN "qrpay"."promoter"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."promoter"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."promoter"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."promoter"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."promoter"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."promoter"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."promoter"."delete_flag" IS '删除标记(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for promoter_order
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."promoter_order";
CREATE TABLE "qrpay"."promoter_order" (
"promoter_order_id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"promoter_id" numeric(20) NOT NULL,
"promoter_name" varchar(100) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(100) COLLATE "default",
"nick_name" varchar(100) COLLATE "default",
"user_cellphone" varchar(100) COLLATE "default",
"user_avatar" varchar(100) COLLATE "default",
"consignee_user_id" numeric(20),
"consignee_user_name" varchar(100) COLLATE "default",
"consignee_nick_name" varchar(100) COLLATE "default",
"consignee_user_cellphone" varchar(100) COLLATE "default",
"consignee_user_avatar" varchar(100) COLLATE "default",
"address_id" numeric(20),
"province_id" numeric(20),
"province_name" varchar(100) COLLATE "default",
"city_id" numeric(20),
"city_name" varchar(100) COLLATE "default",
"district_id" numeric(20) DEFAULT 0,
"district_name" varchar(100) COLLATE "default",
"address" varchar(100) COLLATE "default",
"order_source" numeric(2) DEFAULT 0 NOT NULL,
"order_status" numeric(2) DEFAULT 1 NOT NULL,
"order_revenue_status" numeric(2) DEFAULT 0 NOT NULL,
"payment_status" numeric(2) DEFAULT 0 NOT NULL,
"order_amount" numeric(20) DEFAULT 0 NOT NULL,
"revenue_amount" numeric(20) DEFAULT 1 NOT NULL,
"order_date" timestamp(6) DEFAULT now() NOT NULL,
"order_end_date" timestamp(6),
"order_remark" varchar(255) COLLATE "default",
"order_ip" varchar(255) COLLATE "default",
"order_lng" varchar(255) COLLATE "default",
"order_lat" varchar(255) COLLATE "default",
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."promoter_order" IS '推广订单表';
COMMENT ON COLUMN "qrpay"."promoter_order"."promoter_order_id" IS 'id';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_id" IS '订单id';
COMMENT ON COLUMN "qrpay"."promoter_order"."promoter_id" IS '推广人id';
COMMENT ON COLUMN "qrpay"."promoter_order"."promoter_name" IS '推广人名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."user_id" IS '推广人用户id';
COMMENT ON COLUMN "qrpay"."promoter_order"."user_name" IS '推广人用户名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."nick_name" IS '推广人用户昵称';
COMMENT ON COLUMN "qrpay"."promoter_order"."user_cellphone" IS '推广人用户手机';
COMMENT ON COLUMN "qrpay"."promoter_order"."user_avatar" IS '推广人用户头像';
COMMENT ON COLUMN "qrpay"."promoter_order"."consignee_user_id" IS '收货人用户id';
COMMENT ON COLUMN "qrpay"."promoter_order"."consignee_user_name" IS '收货人用户名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."consignee_nick_name" IS '收货人用户昵称';
COMMENT ON COLUMN "qrpay"."promoter_order"."consignee_user_cellphone" IS '收货人用户手机';
COMMENT ON COLUMN "qrpay"."promoter_order"."consignee_user_avatar" IS '收货人用户头像';
COMMENT ON COLUMN "qrpay"."promoter_order"."address_id" IS '地址id';
COMMENT ON COLUMN "qrpay"."promoter_order"."province_id" IS '省ID';
COMMENT ON COLUMN "qrpay"."promoter_order"."province_name" IS '省名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."city_id" IS '市ID';
COMMENT ON COLUMN "qrpay"."promoter_order"."city_name" IS '市名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."district_id" IS '区ID';
COMMENT ON COLUMN "qrpay"."promoter_order"."district_name" IS '区名称';
COMMENT ON COLUMN "qrpay"."promoter_order"."address" IS '地址';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_source" IS '订单来源类型(1:IOS，2:Android，3:微信H5，4:小程序)';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_status" IS '订单状态(0：新增，1：微信下单成功，2：微信下单失败，3：用户取消支付，4：已完成，5：已作废,6:退款中，7：退款成功，8：退款失败，9：待发货，10：待收货，11：订单完成)';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_revenue_status" IS '订单分成状态(""1待付款；2已付款；3订单取消；4待结算；5已结算；6订单关闭)';
COMMENT ON COLUMN "qrpay"."promoter_order"."payment_status" IS '(支付状态 0-未支付 1-支付成功 2-支付失败 3-处理中 4, "退款中 5, 退款成功" 6, 退款失败)';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_amount" IS '订单实际金额（用于分成的金额）';
COMMENT ON COLUMN "qrpay"."promoter_order"."revenue_amount" IS '分成出去的金额(0，无效；1，有效)';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_date" IS '订单时间';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_end_date" IS '订单结束时间';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_remark" IS '订单备注';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_ip" IS '提交订单的ip';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_lng" IS '订单的经度';
COMMENT ON COLUMN "qrpay"."promoter_order"."order_lat" IS '订单的维度';
COMMENT ON COLUMN "qrpay"."promoter_order"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."promoter_order"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."promoter_order"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."promoter_order"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."promoter_order"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."promoter_order"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."promoter_order"."delete_flag" IS '删除标记(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for promoter_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."promoter_order_detail";
CREATE TABLE "qrpay"."promoter_order_detail" (
"promoter_order_detail_id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"qty" numeric(20),
"act_id" numeric(20),
"act_name" varchar(100) COLLATE "default",
"product_id" numeric(20),
"product_name" varchar(100) COLLATE "default",
"commission_amount" numeric(20) NOT NULL,
"status" numeric(2) DEFAULT 0 NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) NOT NULL,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."promoter_order_detail" IS '推广订单明细表';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."promoter_order_detail_id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."order_id" IS '订单id';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."qty" IS '商品数量';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."product_id" IS '商品id';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."product_name" IS '商品名称';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."commission_amount" IS '客户分成金额';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."status" IS '状态（0，未生效；1，有效）';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."delete_flag" IS '有效标记(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."promoter_order_detail"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for promoter_order_status_change_log
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."promoter_order_status_change_log";
CREATE TABLE "qrpay"."promoter_order_status_change_log" (
"promoter_order_status_change_log_id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"status_text" varchar(100) COLLATE "default",
"remark" varchar(200) COLLATE "default",
"ip" varchar(100) COLLATE "default",
"lng" varchar(100) COLLATE "default",
"lat" varchar(100) COLLATE "default",
"status" numeric(2) NOT NULL,
"create_user" varchar(50) COLLATE "default" DEFAULT 0,
"create_date" timestamp(6) NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) NOT NULL,
"delete_flag" numeric(2) NOT NULL,
"delete_user" varchar(50) COLLATE "default" DEFAULT 0,
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."promoter_order_status_change_log" IS '推广订单状态日志表';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."promoter_order_status_change_log_id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."order_id" IS '订单id';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."status_text" IS '状态文本';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."remark" IS '描述';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."ip" IS '提交订单的ip';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."lng" IS '订单的经度';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."lat" IS '订单的维度';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."status" IS '状态（0，未生效；1，有效）';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."delete_flag" IS '有效标记(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."promoter_order_status_change_log"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for promoter_proudct
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."promoter_proudct";
CREATE TABLE "qrpay"."promoter_proudct" (
"promoter_proudct_id" numeric(20) NOT NULL,
"proudct_id" numeric(20) NOT NULL,
"proudct_name" varchar(100) COLLATE "default",
"act_id" numeric(20) NOT NULL,
"act_name" varchar(100) COLLATE "default",
"brand_id" numeric(20),
"brand_name" varchar(100) COLLATE "default",
"proudct_title" varchar(100) COLLATE "default",
"proudct_desc" varchar(100) COLLATE "default",
"proudct_heml_desc" varchar(100) COLLATE "default",
"original_price" numeric(20) NOT NULL,
"sale_price" numeric(20) NOT NULL,
"revenue_amount" numeric(20) DEFAULT 0,
"revenue_perc" numeric(20) DEFAULT 0,
"proudct_image" varchar(255) COLLATE "default",
"proudct_list" varchar(5000) COLLATE "default",
"show_sale_count" numeric(20) DEFAULT 0,
"sale_count" numeric(20) DEFAULT 0,
"show_stock_count" numeric(20) DEFAULT 0,
"stock_count" numeric(20) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."promoter_proudct" IS '推广商品表';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."promoter_proudct_id" IS 'id';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_id" IS '商品id';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_name" IS '商品名';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."brand_id" IS '品牌id';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."brand_name" IS '品牌名称';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_title" IS '商品短标题';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_desc" IS '商品文本描述';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_heml_desc" IS '商品html描述';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."original_price" IS '原价';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."sale_price" IS '售价';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."revenue_amount" IS '分成金额';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."revenue_perc" IS '分成比例';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_image" IS '商品主图';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."proudct_list" IS '商品图片列表';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."show_sale_count" IS '显示售出数量';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."sale_count" IS '售出数量';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."show_stock_count" IS '显示库存数量';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."stock_count" IS '库存数量';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."status" IS '状态("0:未生效；1:有效")';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."promoter_proudct"."delete_flag" IS '删除标记(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_act
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_act";
CREATE TABLE "qrpay"."qrpay_act" (
"id" numeric(20) NOT NULL,
"act_name" varchar(100) COLLATE "default" NOT NULL,
"act_type" numeric(2),
"act_amount" numeric(20) DEFAULT 0 NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"status" numeric(2) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_act" IS '活动表';
COMMENT ON COLUMN "qrpay"."qrpay_act"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_act"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_act"."act_type" IS '活动类型（1：首减）';
COMMENT ON COLUMN "qrpay"."qrpay_act"."act_amount" IS '活动金额';
COMMENT ON COLUMN "qrpay"."qrpay_act"."start_time" IS '活动开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_act"."end_time" IS '活动结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_act"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_act"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_act"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_act"."status" IS '发送状态（0：新增；1：生效中；2：失效）';

-- ----------------------------
-- Table structure for qrpay_act_mer
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_act_mer";
CREATE TABLE "qrpay"."qrpay_act_mer" (
"id" numeric(20) NOT NULL,
"merid" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"type" numeric(2) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_act_mer" IS '活动商户关联表';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."merid" IS '商户ID';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."act_id" IS '活动表id';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_act_mer"."type" IS '1:商户可以；2：商户不可以';

-- ----------------------------
-- Table structure for qrpay_advert
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_advert";
CREATE TABLE "qrpay"."qrpay_advert" (
"id" numeric(20) NOT NULL,
"advert_position" numeric(20) NOT NULL,
"advert_page" numeric(20) NOT NULL,
"advert_sort" numeric(20) NOT NULL,
"advert_title" varchar(500) COLLATE "default" NOT NULL,
"start_date" timestamp(6) NOT NULL,
"end_date" timestamp(6) NOT NULL,
"open_status" numeric(2) DEFAULT 0 NOT NULL,
"img_url" varchar(100) COLLATE "default",
"linked_url" varchar(500) COLLATE "default",
"advert_content" varchar(800) COLLATE "default",
"isrotationplay" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"app_menu_type" numeric(2),
"ambush" varchar(100) COLLATE "default",
"attach" varchar(500) COLLATE "default",
"tag_id" numeric(20),
"selected_content_color" varchar(50) COLLATE "default",
"selected_img_url" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_advert" IS '广告表';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."advert_position" IS '广告位ID';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."advert_page" IS '广告所属页面';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."advert_sort" IS '广告排序（同一页面同一位置以此往下加1）';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."advert_title" IS '广告标题';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."start_date" IS '广告开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."end_date" IS '广告结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."open_status" IS '0:未启用，1：启用';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."img_url" IS '图片路径';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."linked_url" IS '广告链接地址';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."advert_content" IS '文字广告内容，非文字广告，此项为空';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."isrotationplay" IS '是否为轮播（0:非轮播，1:轮播）';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."app_menu_type" IS 'APP跳转页面类型';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."ambush" IS '埋点标识';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."attach" IS '广告json参数';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."tag_id" IS '对应的专题ID(特殊字段，banner跳转专题列表使用)';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."selected_content_color" IS '内容选中颜色';
COMMENT ON COLUMN "qrpay"."qrpay_advert"."selected_img_url" IS '选中背景图';

-- ----------------------------
-- Table structure for qrpay_advert_page
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_advert_page";
CREATE TABLE "qrpay"."qrpay_advert_page" (
"id" numeric(20) NOT NULL,
"page_name" varchar(100) COLLATE "default" NOT NULL,
"page_type" numeric(2) NOT NULL,
"page_desc" varchar(200) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_advert_page" IS '广告页面表';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."page_name" IS '页面名称';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."page_type" IS '系统类型（1：商户系统APP，2：客户系统H5；3：客户系统小程序）';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."page_desc" IS '页面描述';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert_page"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_advert_pagearea
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_advert_pagearea";
CREATE TABLE "qrpay"."qrpay_advert_pagearea" (
"id" numeric(20) NOT NULL,
"area_name" varchar(100) COLLATE "default" NOT NULL,
"page_id" numeric(20) NOT NULL,
"area_desc" varchar(200) COLLATE "default" NOT NULL,
"area_reveal_type" numeric(2) NOT NULL,
"isrotationplay" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_advert_pagearea" IS '广告位置表';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."area_name" IS '区域名称';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."page_id" IS '所属页面ID';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."area_desc" IS '区域描述';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."area_reveal_type" IS '广告位类型（1:图片广告，2：文字广告，3：图文混合）';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."isrotationplay" IS '是否为轮播广告位：0：非轮播，1：轮播';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_advert_pagearea"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_agio_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_agio_detail";
CREATE TABLE "qrpay"."qrpay_agio_detail" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"order_amount" numeric(20) DEFAULT 0 NOT NULL,
"plat_dis_amount" numeric(20) DEFAULT 0 NOT NULL,
"plat_discount" numeric(20) DEFAULT 0 NOT NULL,
"is_max" numeric(2) DEFAULT 0 NOT NULL,
"calculate_status" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_agio_detail" IS '平台折扣明细表';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."id" IS '主键ID(活动ID)';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."act_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."order_id" IS '订单ID';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."order_amount" IS '订单总金额';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."plat_dis_amount" IS '平台折扣金额';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."plat_discount" IS '平台折扣率（折扣2折=20）冗余';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."is_max" IS '是否触发上限金额(0:未触发，1:已触发)';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."calculate_status" IS '清算状态（0：未清算，1：已清算）';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_agio_detail"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_agioact_conf
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_agioact_conf";
CREATE TABLE "qrpay"."qrpay_agioact_conf" (
"id" numeric(20) NOT NULL,
"act_name" varchar(200) COLLATE "default" NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"plat_discount" numeric(20) DEFAULT 0 NOT NULL,
"plat_dis_maxamount" numeric(20) DEFAULT 0 NOT NULL,
"plat_dis_maxcount" numeric(20) DEFAULT 0 NOT NULL,
"status" numeric(20) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"total_discount" numeric(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_agioact_conf" IS '折扣活动配置表';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."id" IS '主键ID(活动ID)';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."start_time" IS '活动开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."end_time" IS '活动结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."plat_discount" IS '平台折扣率（折扣2折=20）';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."plat_dis_maxamount" IS '平台折扣金额上限(0=无上限)';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."plat_dis_maxcount" IS '平台折扣次数上限(0=无上限)';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."status" IS '活动状态(0:未启用，1：已启用)';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_conf"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_agioact_mer
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_agioact_mer";
CREATE TABLE "qrpay"."qrpay_agioact_mer" (
"id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"type" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_agioact_mer" IS '折扣活动商户关联表';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."act_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."type" IS '参与活动商户类型（0：不限制门店，1：商户可以参与，2：商户不可以参与）';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_agioact_mer"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_app_version
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_app_version";
CREATE TABLE "qrpay"."qrpay_app_version" (
"id" numeric(20) NOT NULL,
"app_source" numeric(2) NOT NULL,
"app_type" numeric(2) NOT NULL,
"version" varchar(100) COLLATE "default" NOT NULL,
"describe" varchar COLLATE "default" NOT NULL,
"download_url" varchar(200) COLLATE "default" NOT NULL,
"show_version" varchar(100) COLLATE "default",
"is_force" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"terminal_type" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_app_version" IS 'APP版本管理';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."app_source" IS 'app来源:0安卓1苹果';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."app_type" IS '应用类型:0商户助手1商户管家';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."version" IS '最新版本号';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."describe" IS '更新说明';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."download_url" IS '下载url';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."show_version" IS '对外显示的版本号';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."is_force" IS '是否强制更新0否1是';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_app_version"."terminal_type" IS '0商户端、1客户端';

-- ----------------------------
-- Table structure for qrpay_article
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_article";
CREATE TABLE "qrpay"."qrpay_article" (
"id" numeric(20) NOT NULL,
"art_title" varchar(500) COLLATE "default" NOT NULL,
"art_des" varchar(500) COLLATE "default" NOT NULL,
"art_content" text COLLATE "default" NOT NULL,
"art_type" numeric(2) NOT NULL,
"welf_content" varchar(500) COLLATE "default",
"welf_url" varchar(200) COLLATE "default",
"welf_img_url" varchar(200) COLLATE "default",
"release_status" numeric(2) NOT NULL,
"release_time" timestamp(6),
"release_mid" varchar(50) COLLATE "default",
"release_name" varchar(50) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"art_logo" varchar(255) COLLATE "default",
"sys_type" numeric(2) DEFAULT 1 NOT NULL,
"art_display_type" numeric(2) DEFAULT 1 NOT NULL,
"send_time" timestamp(6),
"read_num" numeric DEFAULT 0 NOT NULL,
"school_name" varchar(50) COLLATE "default",
"is_comming_soon" numeric(2) DEFAULT 2 NOT NULL,
"is_recommend" numeric(2) DEFAULT 2 NOT NULL,
"article_tag" varchar(100) COLLATE "default",
"top_order" numeric(8) DEFAULT 9999999 NOT NULL,
"recommend_order" numeric(8) DEFAULT 9999999 NOT NULL,
"is_set_top" numeric(2) DEFAULT 2 NOT NULL,
"school_logo_url" varchar(100) COLLATE "default",
"act_id" numeric(20),
"img_width" numeric(20),
"img_height" numeric(20),
"article_province_code" varchar(100) COLLATE "default",
"article_province_name" varchar(100) COLLATE "default",
"article_city_code" varchar(100) COLLATE "default",
"article_city_name" varchar(200) COLLATE "default",
"tag_id" numeric(20),
"article_tag_order" numeric(8),
"read_start_num" numeric(20),
"article_nact_id" numeric(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_article" IS '文章表';
COMMENT ON COLUMN "qrpay"."qrpay_article"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_article"."art_title" IS '文章标题';
COMMENT ON COLUMN "qrpay"."qrpay_article"."art_des" IS '文章简介';
COMMENT ON COLUMN "qrpay"."qrpay_article"."art_content" IS '文章内容';
COMMENT ON COLUMN "qrpay"."qrpay_article"."art_type" IS '文章类型（1：租房；2：旅行；3：求职；4：美容）';
COMMENT ON COLUMN "qrpay"."qrpay_article"."welf_content" IS '福利专区内容';
COMMENT ON COLUMN "qrpay"."qrpay_article"."welf_url" IS '福利专区链接';
COMMENT ON COLUMN "qrpay"."qrpay_article"."welf_img_url" IS '福利专区图片地址';
COMMENT ON COLUMN "qrpay"."qrpay_article"."release_status" IS '发布状态（0：未发布；1：已发布；3：已下线）';
COMMENT ON COLUMN "qrpay"."qrpay_article"."release_time" IS '发布时间';
COMMENT ON COLUMN "qrpay"."qrpay_article"."release_mid" IS '发布人ID';
COMMENT ON COLUMN "qrpay"."qrpay_article"."release_name" IS '发布人姓名';
COMMENT ON COLUMN "qrpay"."qrpay_article"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_article"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_article"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."sys_type" IS '系统类型（1：H5 2：用户端APP）';
COMMENT ON COLUMN "qrpay"."qrpay_article"."art_display_type" IS '展示方式（1：海报式 2：平铺式）';
COMMENT ON COLUMN "qrpay"."qrpay_article"."send_time" IS '发送时间';
COMMENT ON COLUMN "qrpay"."qrpay_article"."read_num" IS '阅读数量';
COMMENT ON COLUMN "qrpay"."qrpay_article"."school_name" IS '学校名称';
COMMENT ON COLUMN "qrpay"."qrpay_article"."is_comming_soon" IS '是否敬请期待(1：是 2：否)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."is_recommend" IS '是否推荐(1:是，2：否)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_tag" IS '文章标签';
COMMENT ON COLUMN "qrpay"."qrpay_article"."top_order" IS '置顶排序(默认为9999999)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."recommend_order" IS '推荐排序(默认为9999999)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."is_set_top" IS '是否置顶(1:是，2：否)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."school_logo_url" IS '学校logo图片url';
COMMENT ON COLUMN "qrpay"."qrpay_article"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_article"."img_width" IS '图片尺寸宽度(px为单位)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."img_height" IS '图片尺寸高度(px为单位)';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_province_code" IS '文章省code';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_province_name" IS '文章省名称';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_city_code" IS '文章市code';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_city_name" IS '文章市名称';
COMMENT ON COLUMN "qrpay"."qrpay_article"."tag_id" IS '关联文章专题ID';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_tag_order" IS '文章在专题中的排序';
COMMENT ON COLUMN "qrpay"."qrpay_article"."read_start_num" IS '文章阅读注水量';
COMMENT ON COLUMN "qrpay"."qrpay_article"."article_nact_id" IS '文章关联拼团ID';

-- ----------------------------
-- Table structure for qrpay_article_tag
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_article_tag";
CREATE TABLE "qrpay"."qrpay_article_tag" (
"id" numeric(20) NOT NULL,
"tag_name" varchar(50) COLLATE "default" NOT NULL,
"tag_title" varchar(50) COLLATE "default" NOT NULL,
"tag_des" varchar(100) COLLATE "default" NOT NULL,
"tag_image_url" varchar(100) COLLATE "default",
"tag_start_time" timestamp(6) NOT NULL,
"tag_end_time" timestamp(6) NOT NULL,
"tag_status" numeric(2) DEFAULT 0 NOT NULL,
"tag_order" numeric(8) DEFAULT 9999999 NOT NULL,
"tag_color" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"tag_logo_url" varchar(100) COLLATE "default" NOT NULL,
"tag_display_location" numeric(2) DEFAULT 1 NOT NULL,
"tag_release_mid" varchar(50) COLLATE "default",
"tag_release_name" varchar(50) COLLATE "default",
"tag_more_order" numeric(8) DEFAULT 9999999 NOT NULL,
"article_tag_read_num" numeric DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_article_tag" IS '文章专题表';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_name" IS '专题标签名称';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_title" IS '专题标题';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_des" IS '专题简介';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_image_url" IS '专题大图';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_start_time" IS '开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_end_time" IS '结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_status" IS '专题状态（0：未上线，1：已上线）';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_order" IS '专题排序';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_color" IS '标签颜色（0：无色）';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_logo_url" IS '专题缩略图';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_display_location" IS '文章展示位置（1：搞事儿-新鲜事）';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_release_mid" IS '发布人ID';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_release_name" IS '发布人姓名';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."tag_more_order" IS '专题更多排序';
COMMENT ON COLUMN "qrpay"."qrpay_article_tag"."article_tag_read_num" IS '文章专题阅读点击量';

-- ----------------------------
-- Table structure for qrpay_bankcard_bin
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_bankcard_bin";
CREATE TABLE "qrpay"."qrpay_bankcard_bin" (
"id" numeric(20) NOT NULL,
"bin" varchar(25) COLLATE "default" NOT NULL,
"bank_id" numeric(20) NOT NULL,
"card_name" varchar(100) COLLATE "default",
"card_length" numeric(2),
"status" numeric(2) DEFAULT 1 NOT NULL,
"bank_chfree" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_bankcard_bin" IS '银行卡bin对照表';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."bin" IS '卡BIN';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."bank_id" IS '银行ID';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."card_name" IS '卡名称';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."card_length" IS '卡号长度';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."status" IS '状态 0-无效 1-有效';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."bank_chfree" IS '是否免填支行 0-否 1-是';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_bankcard_bin"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_brand
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_brand";
CREATE TABLE "qrpay"."qrpay_brand" (
"brand_id" int8 NOT NULL,
"brand_name" varchar(50) COLLATE "default",
"brand_logo_url" varchar(100) COLLATE "default",
"brand_img_url" varchar(100) COLLATE "default",
"brand_detail" varchar(600) COLLATE "default",
"sort" int8,
"status" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_brand" IS '品牌表';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."brand_id" IS '品牌id';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."brand_name" IS '品牌名称';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."brand_logo_url" IS '品牌首页大图';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."brand_img_url" IS '品牌详情页大图';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."brand_detail" IS '品牌简介';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."delete_flag" IS '有效标记';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."qrpay_brand"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for qrpay_brand_association
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_brand_association";
CREATE TABLE "qrpay"."qrpay_brand_association" (
"brand_association_id" int8 NOT NULL,
"brand_id" int8,
"brand_name" varchar(50) COLLATE "default",
"act_id" int8,
"act_name" varchar(50) COLLATE "default",
"sort" int8,
"status" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_brand_association" IS '品牌关联表';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."brand_association_id" IS '品牌关联主键id';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."brand_id" IS '品牌id';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."brand_name" IS '品牌名称';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."delete_flag" IS '删除标记';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."qrpay_brand_association"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for qrpay_businessnumber
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_businessnumber";
CREATE TABLE "qrpay"."qrpay_businessnumber" (
"code" varchar(50) COLLATE "default" NOT NULL,
"type" numeric(2),
"name" varchar(100) COLLATE "default",
"serial" numeric(20),
"generatedtime" varchar(80) COLLATE "default",
"createtime" timestamp(6) DEFAULT now() NOT NULL,
"updatetime" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."code" IS '主键也是多个流水号的类别区分 ';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."type" IS '类型 (0:连续序列  1:当天)';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."name" IS '名称，备注形式 ';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."serial" IS '序号';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."generatedtime" IS '序号标记年月日';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."createtime" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_businessnumber"."updatetime" IS '更新时间';

-- ----------------------------
-- Table structure for qrpay_cannel_cause
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_cannel_cause";
CREATE TABLE "qrpay"."qrpay_cannel_cause" (
"id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"cannel_cause_type" numeric(4) NOT NULL,
"cannel_cause_desc" varchar(200) COLLATE "default",
"create_time" timestamp(6) NOT NULL,
"update_time" timestamp(6) NOT NULL,
"del_flag" numeric(1) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_cannel_cause" IS '订单取消原因描述表';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."order_id" IS '订单ID';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."mid" IS '冗余mid';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."cannel_cause_type" IS '取消原因类型(1:无法正常支付，2：不想买了，3：其他原因)';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."cannel_cause_desc" IS '取消原因描述（预留字段，暂时为空）';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."update_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_cannel_cause"."del_flag" IS '删除状态(0:未删除，1：已删除)';

-- ----------------------------
-- Table structure for qrpay_city
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_city";
CREATE TABLE "qrpay"."qrpay_city" (
"id" numeric(20) NOT NULL,
"prov_code" varchar(100) COLLATE "default" NOT NULL,
"city_code" varchar(100) COLLATE "default" NOT NULL,
"area_code" varchar(100) COLLATE "default" NOT NULL,
"prov_name" varchar(100) COLLATE "default" NOT NULL,
"city_name" varchar(200) COLLATE "default" NOT NULL,
"area_name" varchar(200) COLLATE "default" NOT NULL,
"status" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_city" IS 'APP地址选择';
COMMENT ON COLUMN "qrpay"."qrpay_city"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_city"."prov_code" IS '省编号';
COMMENT ON COLUMN "qrpay"."qrpay_city"."city_code" IS '市编号';
COMMENT ON COLUMN "qrpay"."qrpay_city"."area_code" IS '区编号';
COMMENT ON COLUMN "qrpay"."qrpay_city"."prov_name" IS '省名称';
COMMENT ON COLUMN "qrpay"."qrpay_city"."city_name" IS '市名称';
COMMENT ON COLUMN "qrpay"."qrpay_city"."area_name" IS '区名称';
COMMENT ON COLUMN "qrpay"."qrpay_city"."status" IS '是否有效0否1是';
COMMENT ON COLUMN "qrpay"."qrpay_city"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_city"."update_time" IS '更新时间';

-- ----------------------------
-- Table structure for qrpay_collection
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_collection";
CREATE TABLE "qrpay"."qrpay_collection" (
"id" numeric(20) NOT NULL,
"collection_id" numeric(20) NOT NULL,
"collection_type" numeric(2) NOT NULL,
"mid" numeric(20) NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_collection" IS '收藏表';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."collection_id" IS '收藏ID（收藏类型1时，为商户ID；收藏类型2时，为文章ID；收藏类型3时，为搞事儿团单ID；收藏类型4时，为活动ID）';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."collection_type" IS '收藏类型（1：商户收藏；2：文章收藏；3：搞事儿收藏；4：活动收藏）';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_collection"."update_time" IS '更新时间';

-- ----------------------------
-- Table structure for qrpay_deliver_address
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_deliver_address";
CREATE TABLE "qrpay"."qrpay_deliver_address" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"deliver_phone" varchar(100) COLLATE "default" NOT NULL,
"deliver_address" varchar(300) COLLATE "default" NOT NULL,
"deliver_name" varchar(50) COLLATE "default" NOT NULL,
"address_type" numeric(2) DEFAULT 0 NOT NULL,
"deliver_province_code" varchar(100) COLLATE "default",
"deliver_province_name" varchar(100) COLLATE "default" NOT NULL,
"deliver_city_code" varchar(100) COLLATE "default",
"deliver_city_name" varchar(100) COLLATE "default" NOT NULL,
"deliver_area_code" varchar(100) COLLATE "default",
"deliver_area_name" varchar(100) COLLATE "default" NOT NULL,
"detail_address" varchar(150) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_deliver_address" IS '收货地址表';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_phone" IS '收货人手机号';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_address" IS '收货地址(包括省市区+详细地址)';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_name" IS '收货人姓名';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."address_type" IS '是否是默认地址（0：普通地址 1：默认地址）';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_province_code" IS '省编号';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_province_name" IS '省名称';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_city_code" IS '市编号';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_city_name" IS '市名称';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_area_code" IS '区编号';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."deliver_area_name" IS '区名称';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."detail_address" IS '详细地址';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_deliver_address"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_express
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_express";
CREATE TABLE "qrpay"."qrpay_express" (
"id" numeric(20) NOT NULL,
"order_id" numeric(20) NOT NULL,
"express_address" varchar(200) COLLATE "default" NOT NULL,
"express_order_no" varchar(100) COLLATE "default",
"express_company_code" varchar(20) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"express_user_phone" varchar(100) COLLATE "default",
"express_user_name" varchar(100) COLLATE "default",
"express_company_name" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_express" IS '快递信息表';
COMMENT ON COLUMN "qrpay"."qrpay_express"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_express"."order_id" IS '订单ID';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_address" IS '配送详细地址';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_order_no" IS '快递单号';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_company_code" IS '快递公司代码';
COMMENT ON COLUMN "qrpay"."qrpay_express"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_express"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_express"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_user_phone" IS '收货人联系方式';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_user_name" IS '收货人姓名';
COMMENT ON COLUMN "qrpay"."qrpay_express"."express_company_name" IS '快递公司名称';

-- ----------------------------
-- Table structure for qrpay_hot_search
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_hot_search";
CREATE TABLE "qrpay"."qrpay_hot_search" (
"hot_search_id" int8 NOT NULL,
"content" varchar(200) COLLATE "default",
"sort" int8,
"status" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_hot_search" IS '热门搜索表';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."hot_search_id" IS 'id';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."content" IS '内容';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."delete_flag" IS '有效标记';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."qrpay_hot_search"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for qrpay_index_configuration
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_index_configuration";
CREATE TABLE "qrpay"."qrpay_index_configuration" (
"index_configuration_id" int8 NOT NULL,
"index_logo_url" varchar(100) COLLATE "default",
"index_top_name" varchar(50) COLLATE "default",
"status" int8,
"brand" varchar(50) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6),
"index_img_url" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_index_configuration" IS '首页配置表';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."index_configuration_id" IS 'id';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."index_logo_url" IS '首页大图';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."index_top_name" IS '首页顶部名称';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."brand" IS '首页品牌区配置标签';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."delete_flag" IS '有效标记';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."delete_date" IS '删除日期';
COMMENT ON COLUMN "qrpay"."qrpay_index_configuration"."index_img_url" IS 'logo图片';

-- ----------------------------
-- Table structure for qrpay_internal_msg
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_internal_msg";
CREATE TABLE "qrpay"."qrpay_internal_msg" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"app_type" numeric(2) NOT NULL,
"system_type" numeric(2) DEFAULT 0,
"message_type" numeric(2) DEFAULT 0,
"msg_title" varchar(100) COLLATE "default",
"msg_content" varchar(300) COLLATE "default",
"is_read" numeric(2) DEFAULT 0,
"del_flag" numeric(2) DEFAULT 0,
"link_url" numeric(3),
"create_time" timestamp(6) NOT NULL,
"update_time" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_internal_msg" IS '立码惠站内信表';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."id" IS 'id主键';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."mid" IS '接收用户id  0:所有人';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."app_type" IS '应用类型  0:B端(商户端)  1:C端(用户端) ';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."system_type" IS '系统类型  0:全部(默认) , 1:ios，2:android，3:wap ,4:pc';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."message_type" IS '消息类型 0系统触发类、 1营销类、 2其他';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."msg_title" IS '消息标题';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."msg_content" IS '消息内容';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."is_read" IS '是否阅读  0:未读(默认)，1:已读';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."del_flag" IS '状态 0:正常(默认)，1:删除 ';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."link_url" IS '跳转地址';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_internal_msg"."update_time" IS '更新时间';

-- ----------------------------
-- Table structure for qrpay_label
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_label";
CREATE TABLE "qrpay"."qrpay_label" (
"id" int4 DEFAULT nextval('qrpay_label_id_seq'::regclass) NOT NULL,
"label_type" numeric(8) NOT NULL,
"label_image_url" varchar(100) COLLATE "default" NOT NULL,
"label_name" varchar(50) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"label_width" numeric(8),
"label_height" numeric(8),
"label_intro" varchar(300) COLLATE "default",
"create_user" numeric(20),
"update_user" numeric(20),
"label_attr" numeric(4),
"effective_start" timestamp(6),
"effective_end" timestamp(6),
"create_user_name" varchar(100) COLLATE "default",
"update_user_name" varchar(100) COLLATE "default",
"sort" int4,
"color_code" varchar(50) COLLATE "default",
"label_level" numeric(2) DEFAULT 5 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_label" IS '标签字典表';
COMMENT ON COLUMN "qrpay"."qrpay_label"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_type" IS '标签类型（见枚举）';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_image_url" IS '标签图片地址';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_name" IS '标签名称';
COMMENT ON COLUMN "qrpay"."qrpay_label"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_label"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_width" IS '标签宽度（px）';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_height" IS '标签高度（px）';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_intro" IS '介绍';
COMMENT ON COLUMN "qrpay"."qrpay_label"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_label"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_attr" IS '标签属性';
COMMENT ON COLUMN "qrpay"."qrpay_label"."effective_start" IS '生效开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_label"."effective_end" IS '生效结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_label"."create_user_name" IS '创建者名称';
COMMENT ON COLUMN "qrpay"."qrpay_label"."update_user_name" IS '修改者名称';
COMMENT ON COLUMN "qrpay"."qrpay_label"."sort" IS '标签排序';
COMMENT ON COLUMN "qrpay"."qrpay_label"."color_code" IS '标签颜色';
COMMENT ON COLUMN "qrpay"."qrpay_label"."label_level" IS '标签级别（级别分为：5、4、3、2、1）';

-- ----------------------------
-- Table structure for qrpay_label_labels
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_label_labels";
CREATE TABLE "qrpay"."qrpay_label_labels" (
"id" numeric(20) NOT NULL,
"label_id" numeric(20) NOT NULL,
"nlevel_label_id" numeric(20) NOT NULL,
"create_time" timestamp(6) NOT NULL,
"update_time" timestamp(6) NOT NULL,
"del_flag" numeric(1) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_label_labels" IS '标签关联标签表';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."label_id" IS '标签id';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."nlevel_label_id" IS '关联下级标签ID(一对多关系)';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."update_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_label_labels"."del_flag" IS '删除状态(0:未删除，1：已删除)';

-- ----------------------------
-- Table structure for qrpay_label_relation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_label_relation";
CREATE TABLE "qrpay"."qrpay_label_relation" (
"id" numeric(20) NOT NULL,
"label_id" int4 NOT NULL,
"business_id" numeric(20) NOT NULL,
"business_type" numeric(8) NOT NULL,
"create_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "qrpay"."qrpay_label_relation"."id" IS '主键';
COMMENT ON COLUMN "qrpay"."qrpay_label_relation"."label_id" IS '标签id';
COMMENT ON COLUMN "qrpay"."qrpay_label_relation"."business_id" IS '业务id';
COMMENT ON COLUMN "qrpay"."qrpay_label_relation"."business_type" IS '业务类型';
COMMENT ON COLUMN "qrpay"."qrpay_label_relation"."create_time" IS '创建时间';

-- ----------------------------
-- Table structure for qrpay_nact
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact";
CREATE TABLE "qrpay"."qrpay_nact" (
"id" numeric(20) NOT NULL,
"act_type" numeric(2) NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"useful_time" numeric(20) DEFAULT 0,
"join_num" numeric(20) DEFAULT 0,
"limit_times" numeric(20) DEFAULT 0,
"act_goods" numeric(2) NOT NULL,
"act_name" varchar(100) COLLATE "default" NOT NULL,
"act_number" varchar(50) COLLATE "default" NOT NULL,
"goods_id" numeric(20) NOT NULL,
"act_repertory" numeric(20) DEFAULT 0,
"act_remnant_repertory" numeric(20) DEFAULT 0,
"goods_price" numeric(20) DEFAULT 0,
"act_price" numeric(20) DEFAULT 0,
"act_status" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"nact_istop" numeric(2) DEFAULT 0 NOT NULL,
"nact_sale" numeric(20) DEFAULT 0 NOT NULL,
"nact_logo_url" varchar(100) COLLATE "default",
"nact_img_url" varchar(100) COLLATE "default",
"nact_content" varchar(500) COLLATE "default",
"nact_category" numeric(2) DEFAULT 1 NOT NULL,
"nact_class" numeric(2) DEFAULT 1 NOT NULL,
"nact_address" varchar(200) COLLATE "default",
"nact_min_num" numeric(4) DEFAULT 0 NOT NULL,
"nact_max_num" numeric(4) DEFAULT 0 NOT NULL,
"nact_notice" varchar(1000) COLLATE "default",
"nact_province_code" varchar(100) COLLATE "default",
"nact_province_name" varchar(100) COLLATE "default",
"nact_city_code" varchar(100) COLLATE "default",
"nact_city_name" varchar(200) COLLATE "default",
"nact_area_code" varchar(100) COLLATE "default",
"nact_area_name" varchar(200) COLLATE "default",
"release_mid" numeric(20),
"release_name" varchar(50) COLLATE "default",
"nact_home_square_url" varchar(100) COLLATE "default",
"nact_home_long_url" varchar(100) COLLATE "default",
"nact_goods_des" varchar(1000) COLLATE "default",
"nact_bmb_name" varchar(100) COLLATE "default",
"nact_tag" varchar(100) COLLATE "default",
"commission_amount" numeric(20) DEFAULT 0,
"recommend_sort" numeric(8) DEFAULT 9999999,
"act_list_sort" numeric(8)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact" IS '拉新活动表';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_type" IS '活动形式（1:助力2:拼团3:分销）';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."start_time" IS '活动开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."end_time" IS '活动结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."useful_time" IS '成团有效时间(小时)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."join_num" IS '成团人数';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."limit_times" IS '限制发起次数';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_goods" IS '活动商品（1：优惠券；2：卡券）';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_number" IS '活动编号';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_repertory" IS '活动库存';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_remnant_repertory" IS '剩余库存';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."goods_price" IS '商品原价(官方价格)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_price" IS '活动价格';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_status" IS '活动状态(1:已上线2:已下线)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_istop" IS '活动是否推荐至首页(0:不推荐 1：推荐)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_sale" IS '运营活动销量';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_logo_url" IS '活动缩略图';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_img_url" IS '活动详情大图';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_content" IS '活动内容';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_category" IS '1：一折抢活动；2：一元抢活动；3：LOL活动；4：一元新人团；5：团长免单团；6：X元预热团；7：一元助力团；8：约团活动；9：零元助力团；10：限时秒杀团；11：分销';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_class" IS '约团类型：1：娱乐；2：展览；3：美食；4：运动；5：旅游';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_address" IS '活动地点';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_min_num" IS '活动最小人数';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_max_num" IS '活动最大人数';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_notice" IS '活动须知';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_province_code" IS '活动省code';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_province_name" IS '活动省名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_city_code" IS '活动市code';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_city_name" IS '活动市名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_area_code" IS '活动区code';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_area_name" IS '活动区名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."release_mid" IS '发布人mid';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."release_name" IS '发布人姓名';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_home_square_url" IS '权益活动首页方图';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_home_long_url" IS '权益活动首页长图';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_goods_des" IS '约团活动-商品介绍';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_bmb_name" IS '约团活动-商户名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."nact_tag" IS '活动标签';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."commission_amount" IS '佣金金额';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."recommend_sort" IS '推荐至首页排序(默认为9999999)';
COMMENT ON COLUMN "qrpay"."qrpay_nact"."act_list_sort" IS '活动列表排序(默认为9999999)';

-- ----------------------------
-- Table structure for qrpay_nact_goods
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_goods";
CREATE TABLE "qrpay"."qrpay_nact_goods" (
"id" numeric(20) NOT NULL,
"goods_betch" numeric(20) NOT NULL,
"goods_name" varchar(100) COLLATE "default" NOT NULL,
"goods_des" varchar(500) COLLATE "default",
"sale_price" numeric(20) DEFAULT 0 NOT NULL,
"off_price" numeric(20) DEFAULT 0 NOT NULL,
"income_price" numeric(20) DEFAULT 0 NOT NULL,
"total_repertory" numeric(20) DEFAULT 0 NOT NULL,
"remnant_repertory" numeric(20) DEFAULT 0 NOT NULL,
"sale_start_value" numeric(20) DEFAULT 0 NOT NULL,
"goods_img_url" varchar(100) COLLATE "default",
"effect_start_time" timestamp(6),
"effect_end_time" timestamp(6),
"goods_detail" varchar(1000) COLLATE "default" NOT NULL,
"goods_location" numeric(2) NOT NULL,
"goods_istop" numeric(2) DEFAULT 0 NOT NULL,
"purchase_time" timestamp(6),
"supply_merchant" varchar(100) COLLATE "default",
"goods_label" numeric(2) NOT NULL,
"display_city" varchar(50) COLLATE "default",
"online_status" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"goods_logo_url" varchar(100) COLLATE "default",
"mer_id" numeric(20),
"deduction_rate" numeric(10),
"transportation_costs" numeric(10),
"label_tag" varchar(100) COLLATE "default",
"goods_keyword" varchar(500) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_goods" IS '商品表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_betch" IS '批次ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_name" IS '商品名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_des" IS '商品描述';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."sale_price" IS '售卖价格';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."off_price" IS '官方价格';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."income_price" IS '内部购买价格';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."total_repertory" IS '总库存';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."remnant_repertory" IS '剩余库存';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."sale_start_value" IS '销量起始值';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_img_url" IS '商品大图';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."effect_start_time" IS '商品有效期开始时间(可以为空)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."effect_end_time" IS '商品有效期结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_detail" IS '商品详情';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_location" IS '商品显示位置(1:天天免费抢,2:精品权益)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_istop" IS '是否置顶(0:未置顶 1：置顶)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."purchase_time" IS '采购日期';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."supply_merchant" IS '供应商';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_label" IS '商品类型（原名称为：商品标签）（1:免费券,2:兑换券,3:实物）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."display_city" IS '展示城市';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."online_status" IS '上线状态（0：未上线，1：已上线）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_logo_url" IS '商品缩略图地址';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."deduction_rate" IS '扣率';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."transportation_costs" IS '运费';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."label_tag" IS '标签id集合';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods"."goods_keyword" IS '商品关键字（分号分割）';

-- ----------------------------
-- Table structure for qrpay_nact_goods_city
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_goods_city";
CREATE TABLE "qrpay"."qrpay_nact_goods_city" (
"id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"city_name" varchar(100) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_goods_city" IS '商品可展示城市信息表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."goods_id" IS '商品ID（商品表主键ID）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."city_name" IS '城市名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_city"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_nact_goods_img
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_goods_img";
CREATE TABLE "qrpay"."qrpay_nact_goods_img" (
"id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"goods_img_url" varchar(100) COLLATE "default" NOT NULL,
"goods_img_position" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"goods_img_width" varchar(100) COLLATE "default",
"goods_img_height" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_goods_img" IS '商品详情图片表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."goods_id" IS '商品id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."goods_img_url" IS '商品详情图片路径';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."goods_img_position" IS '商品详情图片位置';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."goods_img_width" IS '图片宽';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_img"."goods_img_height" IS '图片高';

-- ----------------------------
-- Table structure for qrpay_nact_goods_location
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_goods_location";
CREATE TABLE "qrpay"."qrpay_nact_goods_location" (
"id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"goods_lng" varchar(100) COLLATE "default",
"goods_lat" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_goods_location" IS '商品位置表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."goods_id" IS '商品id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."goods_lng" IS '商品经度';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."goods_lat" IS '商品纬度';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_location"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_nact_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_goods_relation";
CREATE TABLE "qrpay"."qrpay_nact_goods_relation" (
"id" int8 NOT NULL,
"nact_id" int8 NOT NULL,
"goods_id" int8 NOT NULL,
"goods_sum" int8 NOT NULL,
"goods_desc" varchar(500) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" int8 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_goods_relation" IS '大礼包活动商品关联表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."nact_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."goods_sum" IS '商品数量';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."goods_desc" IS '商品简介';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_goods_relation"."del_flag" IS '删除标识(0:无效，1:有效)';

-- ----------------------------
-- Table structure for qrpay_nact_group
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_group";
CREATE TABLE "qrpay"."qrpay_nact_group" (
"id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"act_type" numeric(2) NOT NULL,
"leader_mid" numeric(20),
"leader_vipcard" numeric(20),
"join_num" numeric(20) NOT NULL,
"group_status" numeric(2) NOT NULL,
"start_time" timestamp(6),
"end_time" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"goods_id" numeric(20),
"goods_detail_id" numeric(20),
"title" varchar(100) COLLATE "default",
"remark" varchar(500) COLLATE "default",
"nact_num" numeric(20) DEFAULT 0 NOT NULL,
"payment_type" numeric(2) DEFAULT 1 NOT NULL,
"nact_class" numeric(2) DEFAULT 1 NOT NULL,
"click_num" numeric(20) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_group" IS '团单表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."act_type" IS '活动形式（1:助力2:拼团）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."leader_mid" IS '发起人MID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."leader_vipcard" IS '发起人学子卡号';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."join_num" IS '参与人数';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."group_status" IS '(团单状态 0：待开团，1：拼团中，2：拼团成功，3：拼团失败 4：已领奖 5:已退款)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."start_time" IS '开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."end_time" IS '结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."goods_detail_id" IS '商品详情ID，助力活动时使用，优惠券时为0';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."title" IS '标题';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."remark" IS '简介';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."nact_num" IS '活动人数';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."payment_type" IS '付费方式：1：AA制；2：发起者买单';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."nact_class" IS '约团类型：7：娱乐；8：展览；9：美食；10：运动；11：旅游';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group"."click_num" IS '点击量';

-- ----------------------------
-- Table structure for qrpay_nact_group_join
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_group_join";
CREATE TABLE "qrpay"."qrpay_nact_group_join" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"type" numeric(20) NOT NULL,
"group_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"join_status" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_group_join" IS '参团表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."mid" IS '用户ID（值为0时，代表机器人）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."type" IS '团角色 0:发起人 1:参团人';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."group_id" IS '团单ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_group_join"."join_status" IS '参团状态（0：参团成功；1：参团失败；2：参团占位）';

-- ----------------------------
-- Table structure for qrpay_nact_img
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_img";
CREATE TABLE "qrpay"."qrpay_nact_img" (
"id" int8 NOT NULL,
"nact_id" int8 NOT NULL,
"nact_img_url" varchar(100) COLLATE "default" NOT NULL,
"nact_img_position" int8 NOT NULL,
"nact_img_width" varchar(100) COLLATE "default",
"nact_img_height" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" int8 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_img" IS '活动详情图片表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."nact_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."nact_img_url" IS '活动详情图片路径';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."nact_img_position" IS '活动详情图片位置';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."nact_img_width" IS '图片宽';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."nact_img_height" IS '图片高';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_img"."del_flag" IS '删除标识(0:无效，1:有效)';

-- ----------------------------
-- Table structure for qrpay_nact_mb_count
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_mb_count";
CREATE TABLE "qrpay"."qrpay_nact_mb_count" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"act_type" numeric(20) NOT NULL,
"total_count" numeric(20) DEFAULT 0 NOT NULL,
"surplus_count" numeric(20) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_mb_count" IS '用户参与活动次数表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."act_type" IS '活动类型(1:助力2:拼团)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."total_count" IS '当前累积参与次数(默认为0)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."surplus_count" IS '当前剩余可用次数(默认为0)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_mb_count"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_nact_order
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_order";
CREATE TABLE "qrpay"."qrpay_nact_order" (
"id" numeric(20) NOT NULL,
"goods_betch" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"group_id" numeric(20),
"group_type" numeric(2),
"order_amount" numeric(20) DEFAULT 0 NOT NULL,
"mid" numeric(20) NOT NULL,
"order_type" numeric(2) NOT NULL,
"order_status" numeric(2) NOT NULL,
"mer_order_no" varchar(50) COLLATE "default" NOT NULL,
"ip" varchar(20) COLLATE "default",
"order_start_time" timestamp(6),
"order_end_time" timestamp(6),
"return_code" varchar(50) COLLATE "default",
"return_msg" varchar(500) COLLATE "default",
"nonce_str" varchar(100) COLLATE "default",
"sign" varchar(500) COLLATE "default",
"sign_type" varchar(50) COLLATE "default",
"result_code" varchar(100) COLLATE "default",
"err_code" varchar(50) COLLATE "default",
"err_code_des" varchar(200) COLLATE "default",
"trade_type" numeric(2),
"prepay_id" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"pay_status" numeric(2) DEFAULT 0 NOT NULL,
"good_detail_id" numeric(20) DEFAULT 0 NOT NULL,
"batch_id" numeric(20) DEFAULT 0 NOT NULL,
"order_total_amount" numeric(20) DEFAULT 0 NOT NULL,
"voucher_amount" numeric(20) DEFAULT 0 NOT NULL,
"act_id" numeric(20) DEFAULT 0,
"cancel_reason" varchar(200) COLLATE "default",
"remark" varchar(1000) COLLATE "default",
"goods_amount" numeric(8) DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_order" IS '商品订单表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."goods_betch" IS '商品批次ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."group_id" IS '团单ID（没有参团时显示为0）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."group_type" IS '团角色 0:没有参团，1:发起人，2:参团人';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_amount" IS '订单金额(最终发往三方支付金额)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_type" IS '（0：APP 1：微信 2：小程序）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_status" IS '订单状态（0：新增，1：微信下单成功，2：微信下单失败，3：用户取消支付，4：已完成，5：已作废,6:退款中，7：退款成功，8：退款失败，9：待发货，10：待收货，11：订单完成)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."mer_order_no" IS '商户订单号';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."ip" IS '终端IP';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_start_time" IS '交易起始时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_end_time" IS '交易结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."return_code" IS '返回码';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."return_msg" IS '返回描述';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."nonce_str" IS '随机字符串nonce_str';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."sign" IS '加密串';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."sign_type" IS '加密类型（HMAC-SHA256和MD5）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."result_code" IS 'result_code（业务代码）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."err_code" IS '错误代码';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."err_code_des" IS '错误代码描述';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."trade_type" IS '交易类型';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."prepay_id" IS '交易会话标识';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."pay_status" IS '(支付状态 0-未支付 1-支付成功 2-支付失败 3-处理中 4, "退款中 5, 退款成功" 6, 退款失败)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."good_detail_id" IS '(商品详细ID)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."batch_id" IS '优惠券批次ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."order_total_amount" IS '订单总金额';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."voucher_amount" IS '优惠券抵用金额';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."act_id" IS '活动ID,（0为单独购买，含约团前数据）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."cancel_reason" IS '取消理由';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."remark" IS '订单描述';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order"."goods_amount" IS '订单购买商品数量';

-- ----------------------------
-- Table structure for qrpay_nact_order_member
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_order_member";
CREATE TABLE "qrpay"."qrpay_nact_order_member" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_order_member" IS '订单用户黑名单表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_member"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_nact_order_relation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_order_relation";
CREATE TABLE "qrpay"."qrpay_nact_order_relation" (
"id" int8 NOT NULL,
"order_id" int8 NOT NULL,
"goods_detail_id" int8 NOT NULL,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" int4 DEFAULT 0 NOT NULL,
"delete_flag" int4 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"goods_id" int8 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_order_relation" IS '订单卡券关联表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."order_id" IS '订单ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."goods_detail_id" IS '商品详情ID(对应nact_goods_detail表ID)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."del_flag" IS '删除标记(0，无效；1，有效)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_order_relation"."goods_id" IS '商品ID（对应qrpay_nact_goods表ID）';

-- ----------------------------
-- Table structure for qrpay_nact_rec_award
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_rec_award";
CREATE TABLE "qrpay"."qrpay_nact_rec_award" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"active_id" numeric(20) NOT NULL,
"group_id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_rec_award" IS '活动奖励领取记录表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."mid" IS 'mid';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."active_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."group_id" IS '团单ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."goods_id" IS '奖励ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_rec_award"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_nact_type
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_type";
CREATE TABLE "qrpay"."qrpay_nact_type" (
"id" numeric(20) NOT NULL,
"name" varchar(100) COLLATE "default" NOT NULL,
"parent_id" numeric(20) DEFAULT 0 NOT NULL,
"level_id" int4 NOT NULL,
"create_time" timestamp(6) NOT NULL,
"create_user" numeric(20),
"update_time" timestamp(6) NOT NULL,
"update_user" numeric(20),
"status" numeric(2) NOT NULL,
"onoff_time" timestamp(6),
"image_url" varchar(200) COLLATE "default",
"del_flag" numeric(2) DEFAULT 0,
"sort" numeric(2)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_type" IS '活动类型表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."name" IS '名称';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."parent_id" IS '父id（0 代表顶级）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."level_id" IS '层级id（1 一级 2 二级 以此类推）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."update_time" IS '修改时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."status" IS '上下线状态（0 下线 1上线）';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."onoff_time" IS '上下线时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."image_url" IS '图片地址';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type"."sort" IS '类型排序';

-- ----------------------------
-- Table structure for qrpay_nact_type_relation
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_nact_type_relation";
CREATE TABLE "qrpay"."qrpay_nact_type_relation" (
"id" numeric(20) NOT NULL,
"type_id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"create_time" timestamp(6) NOT NULL,
"create_user" numeric(20),
"update_time" timestamp(6) NOT NULL,
"update_user" numeric(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_nact_type_relation" IS '活动和类型关联表';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."type_id" IS '类型id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."act_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."update_time" IS '修改时间';
COMMENT ON COLUMN "qrpay"."qrpay_nact_type_relation"."update_user" IS '修改者';

-- ----------------------------
-- Table structure for qrpay_pact
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact";
CREATE TABLE "qrpay"."qrpay_pact" (
"id" numeric(20) NOT NULL,
"pact_type" numeric(8) NOT NULL,
"pact_status" numeric(2) NOT NULL,
"pact_name" varchar(100) COLLATE "default" NOT NULL,
"pact_des" varchar(500) COLLATE "default",
"pact_content" varchar(1000) COLLATE "default",
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"join_num" numeric(20) DEFAULT 0,
"limit_times" numeric(20),
"limit_join_times" numeric(20),
"pact_logo_url" varchar(100) COLLATE "default" DEFAULT 0,
"pact_image_url" varchar(100) COLLATE "default" DEFAULT 0,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact" IS '抽奖活动表';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_type" IS '活动类型：0：圣诞活动';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_status" IS '活动状态0：未上线1：已上线';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_des" IS '活动简介';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_content" IS '活动内容';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."start_time" IS '活动开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."end_time" IS '活动结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."join_num" IS '成团人数';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."limit_times" IS '限制发起次数';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."limit_join_times" IS '限制参加次数';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_logo_url" IS '活动缩略图';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."pact_image_url" IS '活动大图';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_pact_contact
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact_contact";
CREATE TABLE "qrpay"."qrpay_pact_contact" (
"id" numeric(20) NOT NULL,
"pool_id" numeric(20) NOT NULL,
"award_id" numeric(20) NOT NULL,
"pact_id" numeric(20) NOT NULL,
"contact_type" numeric(8) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact_contact" IS '奖品关联表';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."pool_id" IS '奖池ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."award_id" IS '奖品ID（关联线上/下/商品ID/批次ID）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."pact_id" IS '抽奖活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."contact_type" IS '关联类型（0：线上优惠券1：线下优惠券2：卡券）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_contact"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_pact_group
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact_group";
CREATE TABLE "qrpay"."qrpay_pact_group" (
"id" numeric(20) NOT NULL,
"pact_id" numeric(20) NOT NULL,
"pact_type" numeric(8) NOT NULL,
"leader_mid" numeric(20),
"leader_vipcard" numeric(20),
"join_num" numeric(20) NOT NULL,
"pact_group_status" numeric(2) NOT NULL,
"start_time" timestamp(6),
"end_time" timestamp(6),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact_group" IS '抽奖活动团单表';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."pact_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."pact_type" IS '活动类型：0：圣诞活动';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."leader_mid" IS '发起人MID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."leader_vipcard" IS '发起人学子卡号';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."join_num" IS '参与人数';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."pact_group_status" IS '团单状态 （1.进行中2.成功3.失败）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."start_time" IS '开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."end_time" IS '结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_pact_group_join
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact_group_join";
CREATE TABLE "qrpay"."qrpay_pact_group_join" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"join_type" numeric(20) NOT NULL,
"group_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"image_code" numeric(4)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact_group_join" IS '参团表';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."mid" IS 'mid';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."join_type" IS '团角色 0:发起人 1:参团人';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."group_id" IS '团单ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_pact_group_join"."image_code" IS '春节活动图片关联';

-- ----------------------------
-- Table structure for qrpay_pact_pool
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact_pool";
CREATE TABLE "qrpay"."qrpay_pact_pool" (
"id" numeric(20) NOT NULL,
"pact_id" numeric(20) NOT NULL,
"pool_type" numeric(8) NOT NULL,
"pool_status" numeric(2) NOT NULL,
"pool_repertory" numeric(20) DEFAULT 0 NOT NULL,
"pool_remnant_repertory" numeric(20) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact_pool" IS '奖池表';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."pact_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."pool_type" IS '奖池类型（0:大奖1：点赞即送）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."pool_status" IS '奖池状态：（0：未上线1：已上线）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."pool_repertory" IS '奖池库存';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."pool_remnant_repertory" IS '奖池剩余库存';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_pool"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_pact_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_pact_record";
CREATE TABLE "qrpay"."qrpay_pact_record" (
"id" numeric(20) NOT NULL,
"pool_id" numeric(20) NOT NULL,
"award_id" numeric(20) NOT NULL,
"pact_id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"contact_type" numeric(8) NOT NULL,
"award_name" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"award_detail_id" numeric(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_pact_record" IS '奖品领取记录表';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."pool_id" IS '奖池ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."award_id" IS '奖品ID（关联线上/下/商品ID/批次ID）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."pact_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."mid" IS '发起人MID';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."contact_type" IS '关联类型（0：线上优惠券1：线下优惠券2：卡券）';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."award_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_pact_record"."award_detail_id" IS '领取详情ID';

-- ----------------------------
-- Table structure for qrpay_redpacket_act
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_redpacket_act";
CREATE TABLE "qrpay"."qrpay_redpacket_act" (
"id" numeric(20) NOT NULL,
"act_name" varchar(100) COLLATE "default" NOT NULL,
"act_type" numeric(2) NOT NULL,
"act_status" numeric(2) DEFAULT 1 NOT NULL,
"act_rule" varchar(500) COLLATE "default" NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"redpacket_num" numeric(20) NOT NULL,
"receive_num" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_redpacket_act" IS '红包活动表';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."act_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."act_type" IS '活动类型（1：支付后发红包）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."act_status" IS '活动状态（1：未上线；2：已上线；3：已下线）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."act_rule" IS '活动规则';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."start_time" IS '开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."end_time" IS '结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."redpacket_num" IS '红包数量（大红包中所包含的红包数量）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."receive_num" IS '领取次数（为1则不允许重复领取）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_act"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_redpacket_batch
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_redpacket_batch";
CREATE TABLE "qrpay"."qrpay_redpacket_batch" (
"id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"batch_id" numeric(20) NOT NULL,
"batch" varchar(100) COLLATE "default" NOT NULL,
"voucher_name" varchar(50) COLLATE "default" NOT NULL,
"voucher_amount" numeric(20) NOT NULL,
"use_amount" numeric(20) NOT NULL,
"redpacket_num" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_redpacket_batch" IS '红包批次关联表';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."act_id" IS '红包活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."batch_id" IS '优惠券批次ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."batch" IS '优惠券批次号';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."voucher_name" IS '优惠券名称';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."voucher_amount" IS '优惠券面额';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."use_amount" IS '使用金额';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."redpacket_num" IS '优惠券批次对应的红包数量';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_batch"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_redpacket_grant
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_redpacket_grant";
CREATE TABLE "qrpay"."qrpay_redpacket_grant" (
"id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"redpacket_num" numeric(20) NOT NULL,
"remnant_num" numeric(20) NOT NULL,
"redpacket_status" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"order_id" numeric(20) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_redpacket_grant" IS '红包发放记录表';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."act_id" IS '红包活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."mid" IS '红包发放人mid';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."redpacket_num" IS '红包数量（大红包中所包含的红包数量）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."remnant_num" IS '红包剩余数量';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."redpacket_status" IS '红包状态（1：发放中；2：已领完；3：已退还）';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_redpacket_grant"."order_id" IS '商品订单ID';

-- ----------------------------
-- Table structure for qrpay_register_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_register_record";
CREATE TABLE "qrpay"."qrpay_register_record" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"mb_name" varchar(50) COLLATE "default",
"mb_phone" varchar(100) COLLATE "default" NOT NULL,
"mb_regflagtype" numeric(6) NOT NULL,
"mb_vipcard" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_register_record" IS '用户注册记录表';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."mid" IS '用户mid';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."mb_name" IS '注册时预留姓名';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."mb_phone" IS '用户电话号码';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."mb_regflagtype" IS '进入页面标记';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."mb_vipcard" IS '会员卡号';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_register_record"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_school
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_school";
CREATE TABLE "qrpay"."qrpay_school" (
"id" numeric(20) NOT NULL,
"name" varchar(200) COLLATE "default" NOT NULL,
"address" varchar(200) COLLATE "default",
"status" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_school" IS '学校表';
COMMENT ON COLUMN "qrpay"."qrpay_school"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_school"."name" IS '学校名';
COMMENT ON COLUMN "qrpay"."qrpay_school"."address" IS '学校地址';
COMMENT ON COLUMN "qrpay"."qrpay_school"."status" IS '状态（0无效   1有效）';
COMMENT ON COLUMN "qrpay"."qrpay_school"."create_time" IS '新增时间';
COMMENT ON COLUMN "qrpay"."qrpay_school"."update_time" IS '更新时间';

-- ----------------------------
-- Table structure for qrpay_seckill_config
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_seckill_config";
CREATE TABLE "qrpay"."qrpay_seckill_config" (
"id" numeric(20) NOT NULL,
"session_name" varchar(20) COLLATE "default" NOT NULL,
"continue_time" numeric(4,2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"create_user" numeric(20),
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"update_user" numeric(20),
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_seckill_config" IS '秒杀场次配置表';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."session_name" IS '场次名称（如12，代表12:00场次配置）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."continue_time" IS '持续时间（单位小时；如2，代表2小时）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."create_user" IS '创建人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."update_user" IS '更新人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_config"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_seckill_session
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_seckill_session";
CREATE TABLE "qrpay"."qrpay_seckill_session" (
"id" numeric(20) NOT NULL,
"session_name" varchar(20) COLLATE "default" NOT NULL,
"session_date" timestamp(6) NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"continue_time" numeric(4,2) NOT NULL,
"session_status" numeric(2) DEFAULT 1,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"create_user" numeric(20),
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"update_user" numeric(20),
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_seckill_session" IS '秒杀场次表';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."session_name" IS '场次名称（如12，代表12:00场次配置）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."session_date" IS '秒杀日期（如2019-02-23）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."start_time" IS '场次开始时间（如2019-02-23 12:00:00）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."end_time" IS '场次结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."continue_time" IS '持续时间（单位小时，如2，代表2小时）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."session_status" IS '场次状态（1：已上线；2：已下线）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."create_user" IS '创建人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."update_user" IS '更新人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_seckill_session_nact
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_seckill_session_nact";
CREATE TABLE "qrpay"."qrpay_seckill_session_nact" (
"id" numeric(20) NOT NULL,
"session_id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"session_date" timestamp(6) NOT NULL,
"start_time" timestamp(6),
"end_time" timestamp(6),
"session_repertory" numeric(20) DEFAULT 0,
"seckill_repertory" numeric(20) DEFAULT 0 NOT NULL,
"seckill_order" numeric(3) DEFAULT 100,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"create_user" numeric(20),
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"update_user" numeric(20),
"del_flag" numeric(2) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"limit_times" numeric(6) DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_seckill_session_nact" IS '秒杀场次活动关联表';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."session_id" IS '场次ID（对应qrpay_seckill_session主键）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."act_id" IS '活动ID（对应qrpay_nact主键）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."session_date" IS '秒杀日期';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."start_time" IS '场次开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."end_time" IS '场次结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."session_repertory" IS '场次库存';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."seckill_repertory" IS '剩余库存';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."seckill_order" IS '排序';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."create_user" IS '创建人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."update_user" IS '更新人mid';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."status" IS '状态（0：新增；1：生效中；2：失效；3：库存已返还）';
COMMENT ON COLUMN "qrpay"."qrpay_seckill_session_nact"."limit_times" IS '限制抢购次数';

-- ----------------------------
-- Table structure for qrpay_sms_plan
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_sms_plan";
CREATE TABLE "qrpay"."qrpay_sms_plan" (
"id" numeric(20) NOT NULL,
"plan_name" varchar(100) COLLATE "default" NOT NULL,
"templet_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_sms_plan" IS '短信发送策略计划表';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."plan_name" IS '策略名称';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."templet_id" IS '模板ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_sms_plan_dtl
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_sms_plan_dtl";
CREATE TABLE "qrpay"."qrpay_sms_plan_dtl" (
"id" numeric(20) NOT NULL,
"templet_id" numeric(20) NOT NULL,
"params_name" varchar(100) COLLATE "default" NOT NULL,
"params_val" varchar(100) COLLATE "default" NOT NULL,
"plan_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_sms_plan_dtl" IS '短信发送策略计划表';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."templet_id" IS '模板ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."params_name" IS '参数名称';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."params_val" IS '参数值';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."plan_id" IS '策略ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_plan_dtl"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_sms_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_sms_record";
CREATE TABLE "qrpay"."qrpay_sms_record" (
"id" numeric(20) NOT NULL,
"user_type" numeric(2) NOT NULL,
"merid" numeric(20),
"mid" numeric(20),
"vipid" numeric(20),
"phone" varchar(100) COLLATE "default" NOT NULL,
"templet_id" numeric(20) NOT NULL,
"templet_title" varchar(100) COLLATE "default",
"sms_content" varchar(300) COLLATE "default" NOT NULL,
"send_status" numeric(2) NOT NULL,
"send_record_batch" numeric(20) NOT NULL,
"plan_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"send_channel" varchar(50) COLLATE "default" DEFAULT 3,
"link_url" numeric(6),
"read_status" numeric(2) DEFAULT 0,
"send_time" timestamp(6),
"operator_id" numeric(20),
"operator_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_sms_record" IS '营销短信记录表';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."user_type" IS '发送人群类型(1:用户，2：商户)';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."merid" IS '商户ID（类型2时填入）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."mid" IS '发送对象MID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."vipid" IS '学子卡号';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."phone" IS '手机号（加密）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."templet_id" IS '模板ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."templet_title" IS '模板标题';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."sms_content" IS '消息内容（替换后的内容）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."send_status" IS '发送状态（0：新增；1：发送中；2：发送成功：3：发送失败）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."send_record_batch" IS '发送记录批次号';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."plan_id" IS '策略ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."send_channel" IS '发送渠道：1:站内信，2:push 3.短信（不支持新建）使用逗号隔开';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."link_url" IS '内部跳转地址';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."read_status" IS '0:未读，1：已读';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."send_time" IS '发送时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."operator_id" IS '创建人ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_record"."operator_name" IS '创建人名称';

-- ----------------------------
-- Table structure for qrpay_sms_templet
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_sms_templet";
CREATE TABLE "qrpay"."qrpay_sms_templet" (
"id" numeric(20) NOT NULL,
"templet_id" numeric(20) NOT NULL,
"templet_title" varchar(50) COLLATE "default" NOT NULL,
"content_type" numeric(2) NOT NULL,
"templet_content" varchar(300) COLLATE "default" NOT NULL,
"templet_params" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"send_channel" varchar(50) COLLATE "default" DEFAULT '3'::character varying,
"link_url" numeric(6),
"operator_id" numeric(20),
"operator_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_sms_templet" IS '立码惠短信模板表';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."templet_id" IS '短信模板ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."templet_title" IS '短信模板标题';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."content_type" IS '内容类型(1:营销类，2：验证码)';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."templet_content" IS '短信内容';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."templet_params" IS '参数名称集合（使用“,”分开）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."send_channel" IS '发送渠道：1:站内信，2:push 3.短信（不支持新建）使用逗号隔开';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."link_url" IS '内部跳转地址（使用id映射地址）';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."operator_id" IS '创建人ID';
COMMENT ON COLUMN "qrpay"."qrpay_sms_templet"."operator_name" IS '创建人名称';

-- ----------------------------
-- Table structure for qrpay_spider_article
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_spider_article";
CREATE TABLE "qrpay"."qrpay_spider_article" (
"id" numeric(20) NOT NULL,
"article_title" varchar(100) COLLATE "default" NOT NULL,
"article_content" text COLLATE "default" NOT NULL,
"article_subscription" varchar(50) COLLATE "default" NOT NULL,
"article_top_pic" varchar(100) COLLATE "default",
"article_wx_release_time" timestamp(6),
"article_search_type" numeric(2) NOT NULL,
"article_key_word" varchar(20) COLLATE "default",
"article_is_push" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_spider_article" IS '爬虫文章表';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_title" IS '文章标题';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_content" IS '文章内容';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_subscription" IS '文章公众号来源';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_top_pic" IS '文章头图url';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_wx_release_time" IS '文章微信方的发布时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_search_type" IS '文章爬取规则（1，关键字搜索 2，指定公众号）';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_key_word" IS '文章搜索关键字';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."article_is_push" IS '是否已发布到资讯(1：未发布，2：已发布)';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_article"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_spider_config
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_spider_config";
CREATE TABLE "qrpay"."qrpay_spider_config" (
"id" numeric(20) NOT NULL,
"subscription_name" varchar(100) COLLATE "default" NOT NULL,
"subscription_number" varchar(50) COLLATE "default" NOT NULL,
"last_article_title" varchar(100) COLLATE "default",
"today_quantity" numeric(5) DEFAULT 0 NOT NULL,
"total_quantity" numeric(10) DEFAULT 0 NOT NULL,
"last_crawling_time" timestamp(6) DEFAULT now() NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_spider_config" IS '爬虫配置表';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."subscription_name" IS '公众号名称';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."subscription_number" IS '公众号';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."last_article_title" IS '最后爬取的文章标题';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."today_quantity" IS '当日爬取数量';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."total_quantity" IS '总爬取数量';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."last_crawling_time" IS '最后爬取时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_spider_config"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_subject
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_subject";
CREATE TABLE "qrpay"."qrpay_subject" (
"id" numeric(20) NOT NULL,
"channel_id" numeric(20) NOT NULL,
"internal_label" varchar(100) COLLATE "default",
"title" varchar(100) COLLATE "default" NOT NULL,
"remark" varchar(500) COLLATE "default",
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"img_url" varchar(100) COLLATE "default",
"subject_sort" numeric(4),
"subject_status" numeric(2) DEFAULT 0 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_subject" IS '专题表';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."channel_id" IS '频道ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."internal_label" IS '内部标签';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."title" IS '标题';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."remark" IS '简介';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."start_time" IS '生效开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."end_time" IS '生效结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."img_url" IS '专题背景图';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."subject_sort" IS '专题排序';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."subject_status" IS '专题状态（0：未上线，1：已上线）';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_subject_channel
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_subject_channel";
CREATE TABLE "qrpay"."qrpay_subject_channel" (
"id" numeric(20) NOT NULL,
"channel_name" varchar(100) COLLATE "default" NOT NULL,
"channel_sort" numeric(4),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"channel_status" numeric(2) DEFAULT 2 NOT NULL,
"online_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_subject_channel" IS '专题频道表';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."channel_name" IS '频道名称';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."channel_sort" IS '频道排序';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."channel_status" IS '频道状态（1：已上线，2：未上线，3：已下线）';
COMMENT ON COLUMN "qrpay"."qrpay_subject_channel"."online_time" IS '上线时间';

-- ----------------------------
-- Table structure for qrpay_subject_nact
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_subject_nact";
CREATE TABLE "qrpay"."qrpay_subject_nact" (
"id" numeric(20) NOT NULL,
"subject_id" numeric(20) NOT NULL,
"act_id" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"act_sort" numeric(4)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_subject_nact" IS '专题活动关联表';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."subject_id" IS '专题ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."act_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_subject_nact"."act_sort" IS '活动排序';

-- ----------------------------
-- Table structure for qrpay_topic
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_topic";
CREATE TABLE "qrpay"."qrpay_topic" (
"topic_id" int8 NOT NULL,
"topic_name" varchar(50) COLLATE "default",
"sort" int8,
"status" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_topic" IS '话题表';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."topic_id" IS '话题id';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."topic_name" IS '话题名称';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."sort" IS '话题排序';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."delete_flag" IS '有效标记';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."qrpay_topic"."delete_date" IS '删除日期';

-- ----------------------------
-- Table structure for qrpay_topic_relevance
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_topic_relevance";
CREATE TABLE "qrpay"."qrpay_topic_relevance" (
"topic_relevance_id" int8 NOT NULL,
"topic_id" int8,
"topic_name" varchar(50) COLLATE "default",
"relevance_id" varchar(100) COLLATE "default",
"relevance_name" varchar(50) COLLATE "default",
"sort" int8,
"status" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"delete_flag" int8,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6),
"relevance_type" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_topic_relevance" IS '话题关联表';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."topic_relevance_id" IS '话题关联主键id';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."topic_id" IS '话题id';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."topic_name" IS '话题名称';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."relevance_id" IS '关联id';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."relevance_name" IS '关联名称';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."update_user" IS '更新者';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."delete_flag" IS '有效标记';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."delete_date" IS '删除日期';
COMMENT ON COLUMN "qrpay"."qrpay_topic_relevance"."relevance_type" IS '关联内容类型（1，搞事儿文章；2，部落活动；3，部落投票）';

-- ----------------------------
-- Table structure for qrpay_type_brief
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_type_brief";
CREATE TABLE "qrpay"."qrpay_type_brief" (
"id" numeric(20) NOT NULL,
"type" numeric(2) NOT NULL,
"remark" varchar(1000) COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_type_brief" IS '类型简介';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."type" IS '类型(7:娱乐,8:展览,9:美食,10运动,11:旅游,18:酒店,19:造型)';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."remark" IS '类型简介';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_type_brief"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_user_vipcard
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_user_vipcard";
CREATE TABLE "qrpay"."qrpay_user_vipcard" (
"id" numeric(20) NOT NULL,
"card_id" numeric(20) NOT NULL,
"effect_time" timestamp(6) NOT NULL,
"card_desc" varchar(500) COLLATE "default" NOT NULL,
"card_name" varchar(50) COLLATE "default" NOT NULL,
"access_type" numeric(2) NOT NULL,
"card_type" numeric(2) NOT NULL,
"group_id" numeric(20),
"nact_id" numeric(20),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"mid" numeric(20) NOT NULL,
"card_password" varchar(200) COLLATE "default",
"serial_num" varchar(200) COLLATE "default",
"goods_id" numeric(20) DEFAULT 0 NOT NULL,
"send_sms_count" numeric(20) DEFAULT 0,
"check_status" numeric(2)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_user_vipcard" IS '卡包表';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."card_id" IS '卡券ID';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."effect_time" IS '有效期';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."card_desc" IS '卡券描述';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."card_name" IS '卡券名称';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."access_type" IS '获得方式(1:天天免费抢, 2:精品权益, 3:拼团活动, 4:助力活动)';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."card_type" IS '券类型（1：免费券，2：兑换券）';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."group_id" IS '团ID';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."nact_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."card_password" IS '卡密';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."serial_num" IS '序列号';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."goods_id" IS '(商品ID)';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."send_sms_count" IS '短信发送卡密次数';
COMMENT ON COLUMN "qrpay"."qrpay_user_vipcard"."check_status" IS '核销状态0：未核销 1：已核销';

-- ----------------------------
-- Table structure for qrpay_vote
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_vote";
CREATE TABLE "qrpay"."qrpay_vote" (
"id" numeric(20) NOT NULL,
"article_id" numeric(20) NOT NULL,
"vate_name" varchar(100) COLLATE "default" NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"vote_type" numeric(2) NOT NULL,
"vote_num" numeric(20) DEFAULT 1 NOT NULL,
"exist_pic" numeric(2) DEFAULT 0 NOT NULL,
"vote_status" numeric(2) DEFAULT 1 NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_vote" IS '投票活动配置表';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."article_id" IS '文章ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."vate_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."start_time" IS '投票开始时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."end_time" IS '投票结束时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."vote_type" IS '投票方式（1：单选，2：多选）';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."vote_num" IS '可投数量';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."exist_pic" IS '是否存在图片（0：不存在图片；1：存在图片；）';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."vote_status" IS '投票状态（1：未上线；2：已上线；3：已下线）';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_vote_option
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_vote_option";
CREATE TABLE "qrpay"."qrpay_vote_option" (
"id" numeric(20) NOT NULL,
"vote_id" numeric(20) NOT NULL,
"option_name" varchar(100) COLLATE "default" NOT NULL,
"option_content" varchar(500) COLLATE "default" NOT NULL,
"option_order" numeric(10) NOT NULL,
"option_pic_url" varchar(100) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_vote_option" IS '投票活动关联表';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."vote_id" IS '投票活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."option_name" IS '投票选项名称';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."option_content" IS '投票选项内容';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."option_order" IS '投票选项顺序';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."option_pic_url" IS '选项图片';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_vote_option_detial
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_vote_option_detial";
CREATE TABLE "qrpay"."qrpay_vote_option_detial" (
"id" numeric(20) NOT NULL,
"vote_option_id" numeric(20) NOT NULL,
"vote_option_name" varchar(100) COLLATE "default" NOT NULL,
"vote_id" numeric(20) NOT NULL,
"vote_name" varchar(100) COLLATE "default" NOT NULL,
"mid" numeric(20) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_vote_option_detial" IS '活动记录表';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."vote_option_id" IS '投票选项ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."vote_option_name" IS '投票选项名称';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."vote_id" IS '投票活动ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."vote_name" IS '投票活动名称';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."mid" IS '用户ID';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_vote_option_detial"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for qrpay_writeoff_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_writeoff_goods_detail";
CREATE TABLE "qrpay"."qrpay_writeoff_goods_detail" (
"id" numeric(20) NOT NULL,
"mer_id" numeric(20) NOT NULL,
"goods_id" numeric(20) NOT NULL,
"goods_detail_id" numeric(20) NOT NULL,
"sale_status" numeric(2) DEFAULT 0 NOT NULL,
"card_password" varchar(200) COLLATE "default",
"serial_num" varchar(200) COLLATE "default" NOT NULL,
"out_voucher_id" varchar(50) COLLATE "default" NOT NULL,
"order_time" timestamp(6) DEFAULT now() NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"writeoff_time" timestamp(6) DEFAULT now() NOT NULL,
"writeoff_staff_id" numeric(20) NOT NULL,
"check_time" timestamp(6) DEFAULT now() NOT NULL,
"status" numeric(2) DEFAULT 0 NOT NULL,
"refused" varchar(200) COLLATE "default",
"check_mid" numeric(20),
"check_name" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_writeoff_goods_detail" IS '核销商品详情表';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."mer_id" IS '商户ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."goods_id" IS '批次ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."goods_detail_id" IS '商品详情ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."sale_status" IS '使用状态（1:已核销）';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."card_password" IS '卡密';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."serial_num" IS '序列号';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."out_voucher_id" IS '外部券ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."order_time" IS '订单时间';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."writeoff_time" IS '核销时间';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."writeoff_staff_id" IS '操作员ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."check_time" IS '审核时间';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."status" IS '审核状态（0未审核；1审核通过；2审核拒绝）';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."refused" IS '拒绝原因';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."check_mid" IS '审核人ID';
COMMENT ON COLUMN "qrpay"."qrpay_writeoff_goods_detail"."check_name" IS '审核人名称';

-- ----------------------------
-- Table structure for qrpay_wx_temp
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."qrpay_wx_temp";
CREATE TABLE "qrpay"."qrpay_wx_temp" (
"id" numeric(20) NOT NULL,
"wx_temp_id" varchar(100) COLLATE "default" NOT NULL,
"wx_temp_title" varchar(100) COLLATE "default" NOT NULL,
"wx_temp_url" varchar(200) COLLATE "default",
"wx_temp_remark" varchar(200) COLLATE "default",
"wx_temp_content" varchar(500) COLLATE "default",
"wx_temp_first" varchar(200) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."qrpay_wx_temp" IS '微信推送模板表';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_id" IS '微信模板ID';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_title" IS '微信模板标题';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_url" IS '微信跳转链接';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_remark" IS '微信模板尾部分';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_content" IS '微信模板头内容';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."wx_temp_first" IS '微信模板头部分';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."qrpay_wx_temp"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for rd_qhzx_info_new
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."rd_qhzx_info_new";
CREATE TABLE "qrpay"."rd_qhzx_info_new" (
"id" int8 NOT NULL,
"batchno" varchar(20) COLLATE "default",
"idno" varchar(100) COLLATE "default",
"idtype" varchar(10) COLLATE "default",
"name" varchar(50) COLLATE "default",
"seqno" varchar(50) COLLATE "default",
"sourceid" varchar(20) COLLATE "default",
"rskscore" varchar(20) COLLATE "default",
"rskmark" varchar(64) COLLATE "default",
"databuildtime" varchar(32) COLLATE "default",
"datastatus" varchar(10) COLLATE "default",
"ercode" varchar(32) COLLATE "default",
"ermsg" varchar(64) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"cid" int8,
"isblack" varchar(10) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."rd_qhzx_info_new" IS '前海征信规则测试数据表';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."batchno" IS '批次号';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."idno" IS '证件号码';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."idtype" IS '证件类型';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."name" IS '主体名称';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."seqno" IS '序列号';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."sourceid" IS '来源代码';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."rskscore" IS '风险得分';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."rskmark" IS '风险标记';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."databuildtime" IS '业务发生时间';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."datastatus" IS '数据状态';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."ercode" IS '错误代码';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."ermsg" IS '错误信息';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."cid" IS '进件ID';
COMMENT ON COLUMN "qrpay"."rd_qhzx_info_new"."isblack" IS '是否黑名单 T是 F否';

-- ----------------------------
-- Table structure for serialnumber
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."serialnumber";
CREATE TABLE "qrpay"."serialnumber" (
"id" varchar(32) COLLATE "default" NOT NULL,
"curval" numeric(20),
"maxval" numeric(20),
"step" numeric(20),
"fixed" numeric(2),
"lastupdtime" timestamp(6),
"memo" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "qrpay"."serialnumber"."id" IS 'ID';
COMMENT ON COLUMN "qrpay"."serialnumber"."curval" IS '当前值';
COMMENT ON COLUMN "qrpay"."serialnumber"."maxval" IS '最大值';
COMMENT ON COLUMN "qrpay"."serialnumber"."step" IS '每次获取';
COMMENT ON COLUMN "qrpay"."serialnumber"."fixed" IS '编号长度';
COMMENT ON COLUMN "qrpay"."serialnumber"."lastupdtime" IS '最后修改日期';
COMMENT ON COLUMN "qrpay"."serialnumber"."memo" IS '备注';

-- ----------------------------
-- Table structure for shop_voucher_batch
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."shop_voucher_batch";
CREATE TABLE "qrpay"."shop_voucher_batch" (
"id" numeric(20) NOT NULL,
"batch" varchar(100) COLLATE "default" NOT NULL,
"voucher_name" varchar(50) COLLATE "default" NOT NULL,
"voucher_rule" varchar(500) COLLATE "default" NOT NULL,
"voucher_stock" numeric(10) NOT NULL,
"remaining_stock" numeric(10) NOT NULL,
"expire_type" numeric(2) NOT NULL,
"use_start_time" timestamp(6),
"use_end_time" timestamp(6),
"expire_day" numeric(10),
"voucher_amount" numeric(20) DEFAULT 0 NOT NULL,
"use_amount" numeric(20) NOT NULL,
"batch_type" numeric(2) NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."shop_voucher_batch" IS '优惠券批次表';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."batch" IS '批次号';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."voucher_name" IS '优惠券名称';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."voucher_rule" IS '使用规则描述';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."voucher_stock" IS '券总量';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."remaining_stock" IS '剩余库存';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."expire_type" IS '过期时间类型,1:绝对时间;2:相对时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."use_start_time" IS '使用开始时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."use_end_time" IS '使用结束时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."expire_day" IS '绝对天数';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."voucher_amount" IS '优惠券面额';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."use_amount" IS '使用金额';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."batch_type" IS '批次状态,1:未上线;2:已上线;3:已下线';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_batch"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for shop_voucher_limiter
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."shop_voucher_limiter";
CREATE TABLE "qrpay"."shop_voucher_limiter" (
"id" numeric(20) NOT NULL,
"voucher_id" numeric(20) NOT NULL,
"limiter_type" numeric(2) NOT NULL,
"goods_id" numeric(20),
"action_type" numeric(2),
"area_name" varchar(20) COLLATE "default",
"area_code" varchar(20) COLLATE "default",
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."shop_voucher_limiter" IS '优惠券限制关联表';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."voucher_id" IS '优惠券ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."limiter_type" IS '限制类型,1:地域限制;2:商品限制;3:活动限制';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."goods_id" IS '商品ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."action_type" IS '1:超低一折抢;2:1元秒杀团;3:1元新人团;4:团长免单团;5:X元预热团;6:1元助力团;7:团长免单团';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."area_name" IS '区域名称';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."area_code" IS '地级市编码';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_limiter"."del_flag" IS '删除标识(0:未删除，1:已删除)';

-- ----------------------------
-- Table structure for shop_voucher_record
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."shop_voucher_record";
CREATE TABLE "qrpay"."shop_voucher_record" (
"id" numeric(20) NOT NULL,
"mid" numeric(20) NOT NULL,
"batch" varchar(100) COLLATE "default" NOT NULL,
"use_amount" numeric(20) NOT NULL,
"amount" numeric(20) NOT NULL,
"start_time" timestamp(6) NOT NULL,
"end_time" timestamp(6) NOT NULL,
"use_time" timestamp(6),
"use_status" numeric(2) NOT NULL,
"get_type" numeric(2) NOT NULL,
"activity_id" numeric(20),
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"update_time" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0 NOT NULL,
"voucher_id" numeric(20) NOT NULL,
"grant_id" numeric(20) DEFAULT 0 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."shop_voucher_record" IS '优惠券记录表';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."id" IS '主键ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."mid" IS '用户MID';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."batch" IS '批次编号';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."use_amount" IS '使用最低满足金额';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."amount" IS '实际面额';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."start_time" IS '可使用区间开始时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."end_time" IS '可使用区间结束时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."use_time" IS '使用时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."use_status" IS '使用状态（0：未使用；1：使用中：2：已使用）';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."get_type" IS '获得方式（0：系统推送；1：注册；2:分享红包；3：抽奖）';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."activity_id" IS '活动ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."create_time" IS '创建时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."update_time" IS '更新时间';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."del_flag" IS '删除标识(0:未删除，1:已删除)';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."voucher_id" IS '优惠券ID';
COMMENT ON COLUMN "qrpay"."shop_voucher_record"."grant_id" IS '红包发放记录ID';

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_info";
CREATE TABLE "qrpay"."task_info" (
"task_id" varchar(50) COLLATE "default" NOT NULL,
"task_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_show_title" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_desc" varchar(500) COLLATE "default" DEFAULT NULL::character varying,
"task_type_id" int8 DEFAULT 0,
"task_type_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_get_type" int8 DEFAULT 0,
"task_status" int8 DEFAULT 0,
"task_user_count" int8 DEFAULT 0,
"task_user_join_count" int8 DEFAULT 0,
"prize_count" int8 DEFAULT 0,
"prize_remain_count" int8 DEFAULT 0,
"task_image_url" varchar(500) COLLATE "default" DEFAULT NULL::character varying,
"sort" int8 DEFAULT 0,
"second_period" int8 DEFAULT 0,
"begin_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"end_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"online_begin_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"online_end_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"publish_admin_id" int8 DEFAULT 0,
"publish_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"delete_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_info" IS '任务信息';
COMMENT ON COLUMN "qrpay"."task_info"."task_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_info"."task_name" IS '任务名称';
COMMENT ON COLUMN "qrpay"."task_info"."task_show_title" IS '任务展示标题';
COMMENT ON COLUMN "qrpay"."task_info"."task_desc" IS '任务描述';
COMMENT ON COLUMN "qrpay"."task_info"."task_type_id" IS '任务类型id';
COMMENT ON COLUMN "qrpay"."task_info"."task_type_name" IS '任务类型名称';
COMMENT ON COLUMN "qrpay"."task_info"."task_get_type" IS '任务领取方式';
COMMENT ON COLUMN "qrpay"."task_info"."task_status" IS '0，待上线；1，已上线；2，已下线；3，任务关闭（奖品不足）；4，上线中（自动上线）；5，下线中（自动下线）';
COMMENT ON COLUMN "qrpay"."task_info"."task_user_count" IS '任务可参与人数';
COMMENT ON COLUMN "qrpay"."task_info"."task_user_join_count" IS '任务已参与人数';
COMMENT ON COLUMN "qrpay"."task_info"."prize_count" IS '奖品总数量';
COMMENT ON COLUMN "qrpay"."task_info"."prize_remain_count" IS '奖品剩余数量';
COMMENT ON COLUMN "qrpay"."task_info"."task_image_url" IS '奖品logo图片';
COMMENT ON COLUMN "qrpay"."task_info"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."task_info"."second_period" IS '任务完成有效期（秒）';
COMMENT ON COLUMN "qrpay"."task_info"."begin_date" IS '任务开始时间';
COMMENT ON COLUMN "qrpay"."task_info"."end_date" IS '任务结束时间';
COMMENT ON COLUMN "qrpay"."task_info"."online_begin_date" IS '自动上线开始时间';
COMMENT ON COLUMN "qrpay"."task_info"."online_end_date" IS '自动上线结束时间';
COMMENT ON COLUMN "qrpay"."task_info"."publish_admin_id" IS '后台发布人';
COMMENT ON COLUMN "qrpay"."task_info"."publish_date" IS '发布时间';
COMMENT ON COLUMN "qrpay"."task_info"."status" IS '有效状态(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_info"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."task_info"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_info"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."task_info"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."task_info"."delete_flag" IS '删除标记(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_info"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."task_info"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_label
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_label";
CREATE TABLE "qrpay"."task_label" (
"task_label_id" varchar(50) COLLATE "default" NOT NULL,
"task_label_type" int8 DEFAULT 0,
"task_label_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_label_sort" int8 DEFAULT 0,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_label" IS '任务标签表';
COMMENT ON COLUMN "qrpay"."task_label"."task_label_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_label"."task_label_type" IS '任务标签id(1，新手任务；2，推荐任务；3，日常任务；)';
COMMENT ON COLUMN "qrpay"."task_label"."task_label_name" IS '任务标签名称';
COMMENT ON COLUMN "qrpay"."task_label"."task_label_sort" IS '标签显示优先级';
COMMENT ON COLUMN "qrpay"."task_label"."status" IS '有效状态(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_label"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."task_label"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_label"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."task_label"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."task_label"."delete_flag" IS '删除标记(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_label"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."task_label"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_label_renference
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_label_renference";
CREATE TABLE "qrpay"."task_label_renference" (
"task_label_renference_id" varchar(50) COLLATE "default" NOT NULL,
"task_label_type" int8 DEFAULT 0,
"task_label_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_id" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"task_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_sort" int8 DEFAULT 0,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"delete_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_label_renference" IS '任务标签关联表';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_label_renference_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_label_type" IS '任务标签id(1，新手任务；2，推荐任务；3，日常任务；)';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_label_name" IS '任务标签名称';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_id" IS '任务Id';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_name" IS '任务名称';
COMMENT ON COLUMN "qrpay"."task_label_renference"."task_sort" IS '任务显示优先级';
COMMENT ON COLUMN "qrpay"."task_label_renference"."status" IS '有效状态(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_label_renference"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."task_label_renference"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_label_renference"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."task_label_renference"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."task_label_renference"."delete_flag" IS '删除标记(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_label_renference"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."task_label_renference"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_prize
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_prize";
CREATE TABLE "qrpay"."task_prize" (
"task_prize_id" varchar(50) COLLATE "default" NOT NULL,
"task_user_label_renference_id" varchar(50) COLLATE "default",
"task_user_label_id" int8 DEFAULT 0,
"task_label_renference_id" varchar(50) COLLATE "default",
"task_id" varchar(50) COLLATE "default",
"prize_get_type" int8 DEFAULT 0,
"prize_type" int8 DEFAULT 1,
"prize_inner_id" varchar(50) COLLATE "default",
"prize_pick_count" int8 DEFAULT 0,
"sort" int8 DEFAULT 0,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_prize" IS '任务奖品表';
COMMENT ON COLUMN "qrpay"."task_prize"."task_prize_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_prize"."task_user_label_renference_id" IS '任务用户标签关联id';
COMMENT ON COLUMN "qrpay"."task_prize"."task_user_label_id" IS '1;普通用户;2;会员用户';
COMMENT ON COLUMN "qrpay"."task_prize"."task_label_renference_id" IS '任务标签id';
COMMENT ON COLUMN "qrpay"."task_prize"."task_id" IS '任务id';
COMMENT ON COLUMN "qrpay"."task_prize"."prize_get_type" IS '1;统自动发；2;户主动领取';
COMMENT ON COLUMN "qrpay"."task_prize"."prize_type" IS '1;城商品 2;物商品 3;部虚拟商品 4;部虚拟商品';
COMMENT ON COLUMN "qrpay"."task_prize"."prize_inner_id" IS '奖品外联主键';
COMMENT ON COLUMN "qrpay"."task_prize"."prize_pick_count" IS '奖品发放数量(发给参与者)';
COMMENT ON COLUMN "qrpay"."task_prize"."sort" IS '显示优先级';
COMMENT ON COLUMN "qrpay"."task_prize"."status" IS '状态:0无效；1:有效';
COMMENT ON COLUMN "qrpay"."task_prize"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."task_prize"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_prize"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."task_prize"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."task_prize"."delete_flag" IS '删除标记(0;无效；1;有效)';
COMMENT ON COLUMN "qrpay"."task_prize"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."task_prize"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_prize_user
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_prize_user";
CREATE TABLE "qrpay"."task_prize_user" (
"task_prize_user_id" varchar(50) COLLATE "default" NOT NULL,
"task_id" varchar(50) COLLATE "default",
"task_name" varchar(50) COLLATE "default",
"task_prize_id" varchar(50) COLLATE "default",
"prize_type" int8 DEFAULT 1,
"prize_inner_id" varchar(50) COLLATE "default",
"user_id" int8,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_prize_user" IS '任务奖品获得表';
COMMENT ON COLUMN "qrpay"."task_prize_user"."task_prize_user_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_prize_user"."task_id" IS '任务id';
COMMENT ON COLUMN "qrpay"."task_prize_user"."task_name" IS '任务名称';
COMMENT ON COLUMN "qrpay"."task_prize_user"."task_prize_id" IS '奖品主键';
COMMENT ON COLUMN "qrpay"."task_prize_user"."prize_type" IS '奖品类型';
COMMENT ON COLUMN "qrpay"."task_prize_user"."prize_inner_id" IS '奖品外联主键';
COMMENT ON COLUMN "qrpay"."task_prize_user"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."task_prize_user"."status" IS '状态:0无效；1:有效';
COMMENT ON COLUMN "qrpay"."task_prize_user"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."task_prize_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_prize_user"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."task_prize_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."task_prize_user"."delete_flag" IS '删除标记(0;无效;1;有效)';
COMMENT ON COLUMN "qrpay"."task_prize_user"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."task_prize_user"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_rule_tribe
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_rule_tribe";
CREATE TABLE "qrpay"."task_rule_tribe" (
"task_rule_tribe_id" varchar(50) COLLATE "default" NOT NULL,
"task_id" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"task_rule_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_rule_desc" varchar(500) COLLATE "default" DEFAULT NULL::character varying,
"business_id" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"business_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_rule_count" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT '2019-04-10 20:11:23.451173'::timestamp without time zone,
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT '2019-04-10 20:11:23.451173'::timestamp without time zone,
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"delete_date" timestamp(6) DEFAULT '2019-04-10 20:11:23.451173'::timestamp without time zone
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_rule_tribe" IS '部落任务规则信息';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."task_rule_tribe_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."task_id" IS '任务id';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."task_rule_name" IS '规则名称';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."task_rule_desc" IS '规则描述';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."business_id" IS '业务表记录主键';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."business_name" IS '业务表记录名称';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."task_rule_count" IS '任务规则数量(评论字数，加入部落个数(用于指定特定的记录可能|分隔))';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."status" IS '有效状态(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."delete_flag" IS '删除标记(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."task_rule_tribe"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_user_execute
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_user_execute";
CREATE TABLE "qrpay"."task_user_execute" (
"task_user_execute_id" varchar(50) COLLATE "default" NOT NULL,
"task_id" varchar(50) COLLATE "default",
"task_name" varchar(50) COLLATE "default",
"task_user_label_renference_id" varchar(50) COLLATE "default",
"task_user_label_id" int8 DEFAULT 0,
"task_user_label_name" varchar(100) COLLATE "default",
"task_label_renference_id" varchar(50) COLLATE "default",
"task_label_type" int8 DEFAULT 0,
"task_label_name" varchar(100) COLLATE "default",
"user_id" int8 DEFAULT 0,
"execute_status" int8 DEFAULT 0,
"begin_date" timestamp(6) DEFAULT now(),
"end_date" timestamp(6) DEFAULT now(),
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(100) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_user_execute" IS '用户任务执行表';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_user_execute_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_id" IS '任务id';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_name" IS '任务名称';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_user_label_renference_id" IS '任务用户标签关联id';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_user_label_id" IS '1;普通用户;2;会员用户';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_user_label_name" IS '1;普通用户;2;会员用户';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_label_renference_id" IS '任务标签id';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_label_type" IS '任务标签类型';
COMMENT ON COLUMN "qrpay"."task_user_execute"."task_label_name" IS '任务标签名称';
COMMENT ON COLUMN "qrpay"."task_user_execute"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."task_user_execute"."execute_status" IS '执行状态 11，进行中；12，待领奖；13，已完成；14，明日请早；15, 任务超时';
COMMENT ON COLUMN "qrpay"."task_user_execute"."begin_date" IS '任务开始时间';
COMMENT ON COLUMN "qrpay"."task_user_execute"."end_date" IS '任务结束时间';
COMMENT ON COLUMN "qrpay"."task_user_execute"."status" IS '状态:0无效；1:有效';
COMMENT ON COLUMN "qrpay"."task_user_execute"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."task_user_execute"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_user_execute"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."task_user_execute"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."task_user_execute"."delete_flag" IS '删除标记(0;无效;1;有效)';
COMMENT ON COLUMN "qrpay"."task_user_execute"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."task_user_execute"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for task_user_label_renference
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."task_user_label_renference";
CREATE TABLE "qrpay"."task_user_label_renference" (
"task_user_label_renference_id" varchar(50) COLLATE "default" NOT NULL,
"task_user_label_id" int8 DEFAULT 0,
"task_user_label_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_id" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"task_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"task_user_label_sort" int8 DEFAULT 0,
"status" int8 DEFAULT 1,
"create_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"create_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"update_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"update_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone,
"delete_flag" int8 DEFAULT 0,
"delete_user" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"delete_date" timestamp(6) DEFAULT '2019-04-10 20:11:03.195795'::timestamp without time zone
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."task_user_label_renference" IS '任务用户标签关联表';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_user_label_renference_id" IS '主键';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_user_label_id" IS '1，会员用户；2，普通用户；';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_user_label_name" IS '任务用户标签';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_id" IS '任务Id';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_name" IS '任务名称';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."task_user_label_sort" IS '显示优先级';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."status" IS '有效状态(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."create_user" IS '创建者';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."update_user" IS '修改者';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."update_date" IS '修改时间';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."delete_flag" IS '删除标记(0，false；1，true；)';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."delete_user" IS '删除者';
COMMENT ON COLUMN "qrpay"."task_user_label_renference"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_activity
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity";
CREATE TABLE "qrpay"."tribe_activity" (
"tribe_activity_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_name" varchar(255) COLLATE "default",
"tribe_info_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_name" varchar(255) COLLATE "default",
"activity_desc" text COLLATE "default",
"task_desc" text COLLATE "default",
"logo" varchar(255) COLLATE "default",
"main_image_url" varchar(255) COLLATE "default",
"user_count" numeric(20) DEFAULT 0,
"show_user_count" numeric(20) DEFAULT 0,
"microblog_count" numeric(20) DEFAULT 0,
"show_microblog_count" numeric(20) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"sort" numeric(20) DEFAULT 0,
"start_date" timestamp(6),
"end_time" timestamp(6),
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"tribe_activity_share_title" varchar(255) COLLATE "default",
"activity_desc_href" varchar(255) COLLATE "default",
"activity_type" int4 DEFAULT 1,
"link_id" varchar(50) COLLATE "default",
"link_type" int8 DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity" IS '活动表';
COMMENT ON COLUMN "qrpay"."tribe_activity"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."tribe_activity"."tribe_info_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_activity"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_activity"."activity_desc" IS '活动内容描述';
COMMENT ON COLUMN "qrpay"."tribe_activity"."task_desc" IS '任务描述';
COMMENT ON COLUMN "qrpay"."tribe_activity"."logo" IS 'logo图';
COMMENT ON COLUMN "qrpay"."tribe_activity"."main_image_url" IS 'main图';
COMMENT ON COLUMN "qrpay"."tribe_activity"."user_count" IS '参与活动的用户数量';
COMMENT ON COLUMN "qrpay"."tribe_activity"."show_user_count" IS '参与活动的用户数量（注水值）';
COMMENT ON COLUMN "qrpay"."tribe_activity"."microblog_count" IS '部落下动态数量';
COMMENT ON COLUMN "qrpay"."tribe_activity"."show_microblog_count" IS '部落下动态数量(注水值)';
COMMENT ON COLUMN "qrpay"."tribe_activity"."status" IS '状态';
COMMENT ON COLUMN "qrpay"."tribe_activity"."sort" IS '排序值';
COMMENT ON COLUMN "qrpay"."tribe_activity"."start_date" IS '开始时间';
COMMENT ON COLUMN "qrpay"."tribe_activity"."end_time" IS '结束时间';
COMMENT ON COLUMN "qrpay"."tribe_activity"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_activity"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_activity"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."tribe_activity"."tribe_activity_share_title" IS '部落活动分享标题';
COMMENT ON COLUMN "qrpay"."tribe_activity"."activity_desc_href" IS '活动描述的网页';
COMMENT ON COLUMN "qrpay"."tribe_activity"."activity_type" IS '1:发表评论活动;2:话题活动';
COMMENT ON COLUMN "qrpay"."tribe_activity"."link_id" IS '链接id';
COMMENT ON COLUMN "qrpay"."tribe_activity"."link_type" IS '链接类型0，无操作；1，跳活动详情；2，跳文章页；3,跳权益页';

-- ----------------------------
-- Table structure for tribe_activity_image
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_image";
CREATE TABLE "qrpay"."tribe_activity_image" (
"tribe_activity_image_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_id" varchar(50) COLLATE "default",
"main_image_url" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now() NOT NULL,
"update_user" varchar(50) COLLATE "default" NOT NULL,
"update_date" timestamp(6) DEFAULT now() NOT NULL,
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_image" IS '部落图片表';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."tribe_activity_image_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."main_image_url" IS '活动主图';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity_image"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_activity_prize
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_prize";
CREATE TABLE "qrpay"."tribe_activity_prize" (
"tribe_activity_prize_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_prize_name" varchar(50) COLLATE "default",
"tribe_activity_prize_desc" text COLLATE "default",
"tribe_activity_prize_image" varchar(255) COLLATE "default",
"prize_type" numeric(6),
"prize_inner_id" varchar(100) COLLATE "default" NOT NULL,
"tribe_id" varchar(20) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"activity_id" varchar(20) COLLATE "default",
"activity_name" varchar(50) COLLATE "default",
"prize_count" numeric(10) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_prize" IS '活动奖品清单表';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_activity_prize_id" IS '奖品id';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_activity_prize_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_activity_prize_desc" IS '奖品描述 对此奖品的描述（html），可图文混编';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_activity_prize_image" IS '奖品图';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."prize_type" IS '奖品类型(1、商城商品 2、实物商品 3、内部虚拟商品 4、外部虚拟商品)';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."prize_inner_id" IS '奖品外联主键 各种不同奖品类型的主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."prize_count" IS '奖品数量';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."status" IS '状态 0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."del_flag" IS '删除标记 0，未删除；1，已删除';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_activity_prize"."delete_user" IS '删除人';

-- ----------------------------
-- Table structure for tribe_activity_user
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_user";
CREATE TABLE "qrpay"."tribe_activity_user" (
"tribe_activity_user_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_name" varchar(50) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_user" IS '活动用户表';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."tribe_activity_user_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."nick_name" IS '用户昵称';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity_user"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_activity_vote
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_vote";
CREATE TABLE "qrpay"."tribe_activity_vote" (
"tribe_activity_vote_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_info_id" varchar(50) COLLATE "default",
"tribe_activity_id" varchar(50) COLLATE "default",
"vote_type" int8,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" int4 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"hot_show_threshold" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_vote" IS '话题活动表';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."tribe_activity_vote_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."tribe_info_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."vote_type" IS '话题类型(1:文字, 2:图片, 3:图文)';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote"."hot_show_threshold" IS '展示热门的阈值';

-- ----------------------------
-- Table structure for tribe_activity_vote_detail
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_vote_detail";
CREATE TABLE "qrpay"."tribe_activity_vote_detail" (
"tribe_activity_vote_detail_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_vote_id" varchar(50) COLLATE "default",
"text_content" varchar(1000) COLLATE "default",
"img_content_url" varchar(255) COLLATE "default",
"sort" int8 DEFAULT 0,
"like_count" int8 DEFAULT 0,
"show_like_count" int8 DEFAULT 0,
"share_count" int8 DEFAULT 0,
"show_share_count" int8 DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_vote_detail" IS '话题活动详情表';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."tribe_activity_vote_detail_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."tribe_activity_vote_id" IS '话题活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."text_content" IS '内容';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."img_content_url" IS '活动主图';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."sort" IS '排序';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."like_count" IS '点赞数';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."show_like_count" IS '显示点赞数';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."share_count" IS '分享数';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."show_share_count" IS '显示分享数';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_detail"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_activity_vote_like
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_activity_vote_like";
CREATE TABLE "qrpay"."tribe_activity_vote_like" (
"tribe_activity_vote_like_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_vote_id" varchar(50) COLLATE "default",
"tribe_activity_vote_detail_id" varchar(50) COLLATE "default",
"user_id" int8,
"operation_type" int4,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_activity_vote_like" IS '话题活动详情表';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."tribe_activity_vote_like_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."tribe_activity_vote_id" IS '话题活动id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."tribe_activity_vote_detail_id" IS '话题活动详情id';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."user_id" IS 'userId';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."operation_type" IS '操作类型(-1:取消点赞, 1:点赞)';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_activity_vote_like"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_info
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_info";
CREATE TABLE "qrpay"."tribe_info" (
"tribe_info_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_name" varchar(50) COLLATE "default",
"share_title" varchar(200) COLLATE "default",
"tribe_desc" text COLLATE "default",
"logo" varchar(255) COLLATE "default",
"main_image_url" varchar(255) COLLATE "default",
"user_count" numeric(20) DEFAULT 0,
"show_user_count" numeric(20) DEFAULT 0,
"activity_count" numeric(20) DEFAULT 0,
"show_activity_count" numeric(20) DEFAULT 0,
"microblog_count" numeric(20) DEFAULT 0,
"show_microblog_count" numeric(20) DEFAULT 0,
"sort" numeric(20) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now(),
"publish_admin_user_id" varchar(100) COLLATE "default",
"publish_admin_user_real_name" varchar(100) COLLATE "default",
"publish_date" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_info" IS '部落表';
COMMENT ON COLUMN "qrpay"."tribe_info"."tribe_info_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_info"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_info"."share_title" IS '分享的标题';
COMMENT ON COLUMN "qrpay"."tribe_info"."tribe_desc" IS '部落内容描述(对此部落的描述（html），可图文混编)';
COMMENT ON COLUMN "qrpay"."tribe_info"."logo" IS 'logo图';
COMMENT ON COLUMN "qrpay"."tribe_info"."main_image_url" IS '主图';
COMMENT ON COLUMN "qrpay"."tribe_info"."user_count" IS '部落下用户数量';
COMMENT ON COLUMN "qrpay"."tribe_info"."show_user_count" IS '部落下用户数量(注水值)';
COMMENT ON COLUMN "qrpay"."tribe_info"."activity_count" IS '活动数量';
COMMENT ON COLUMN "qrpay"."tribe_info"."show_activity_count" IS '活动数量(注水值)';
COMMENT ON COLUMN "qrpay"."tribe_info"."microblog_count" IS '部落下动态数量';
COMMENT ON COLUMN "qrpay"."tribe_info"."show_microblog_count" IS '微博下动态数量（注水值）';
COMMENT ON COLUMN "qrpay"."tribe_info"."sort" IS '排序值（升序）';
COMMENT ON COLUMN "qrpay"."tribe_info"."status" IS '状态(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_info"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_info"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_info"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_info"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_info"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_info"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_info"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_info"."delete_date" IS '删除时间';
COMMENT ON COLUMN "qrpay"."tribe_info"."publish_admin_user_id" IS '发布日期';

-- ----------------------------
-- Table structure for tribe_popular_config
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_popular_config";
CREATE TABLE "qrpay"."tribe_popular_config" (
"tribe_popular_config_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_info_id" varchar(50) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"share_title" varchar(200) COLLATE "default",
"tribe_desc" text COLLATE "default",
"logo" varchar(255) COLLATE "default",
"main_image_url" varchar(255) COLLATE "default",
"user_count" numeric(20) DEFAULT 0,
"show_user_count" numeric(20) DEFAULT 0,
"activity_count" numeric(20) DEFAULT 0,
"show_activity_count" numeric(20) DEFAULT 0,
"microblog_count" numeric(20) DEFAULT 0,
"show_microblog_count" numeric(20) DEFAULT 0,
"sort" numeric(20) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_popular_config" IS '热门部落配置表';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."tribe_popular_config_id" IS '主键id';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."tribe_info_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."share_title" IS '分享的标题';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."tribe_desc" IS '部落内容描述(对此部落的描述（html），可图文混编)';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."logo" IS 'logo图';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."main_image_url" IS '主图';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."user_count" IS '部落下用户数量';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."show_user_count" IS '部落下用户数量(注水值)';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."activity_count" IS '活动数量';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."show_activity_count" IS '活动数量(注水值)';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."microblog_count" IS '部落下动态数量';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."show_microblog_count" IS '微博下动态数量（注水值）';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."sort" IS '排序值（升序）';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."status" IS '状态(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_popular_config"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_prize_rule
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_prize_rule";
CREATE TABLE "qrpay"."tribe_prize_rule" (
"tribe_prize_rule_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_prize_rule_name" varchar(50) COLLATE "default",
"tribe_activity_id" varchar(50) COLLATE "default",
"tribe_activity_name" varchar(50) COLLATE "default",
"rule_type" numeric(6),
"prize_id" varchar(50) COLLATE "default" NOT NULL,
"prize_name" varchar(50) COLLATE "default",
"prize_count" numeric(6) DEFAULT 0,
"rend_prize_count" numeric(6) DEFAULT 0,
"status" numeric(2) DEFAULT 0,
"share_url" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_prize_rule" IS '中奖规则表';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."tribe_prize_rule_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."tribe_prize_rule_name" IS '玩法名称';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."rule_type" IS '规则类型 0,点赞排行；1，热门评论.....';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."prize_id" IS '奖品id';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."prize_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."prize_count" IS '奖品数量';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."rend_prize_count" IS '发奖人数';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."status" IS '状态 0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."share_url" IS '分享地址';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."del_flag" IS '删除标记 0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_prize_rule"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_user
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_user";
CREATE TABLE "qrpay"."tribe_user" (
"tribe_user_id" varchar(50) COLLATE "default" NOT NULL,
"tribe_info_id" varchar(50) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"logo" varchar(255) COLLATE "default",
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar_url" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_user" IS '部落用户表';
COMMENT ON COLUMN "qrpay"."tribe_user"."tribe_user_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_user"."tribe_info_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_user"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_user"."logo" IS '部落logo图';
COMMENT ON COLUMN "qrpay"."tribe_user"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."tribe_user"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."tribe_user"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."tribe_user"."nick_name" IS '用户昵称';
COMMENT ON COLUMN "qrpay"."tribe_user"."user_avatar_url" IS '用户头像';
COMMENT ON COLUMN "qrpay"."tribe_user"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_user"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_user"."del_flag" IS '删除标记(0，有效；1，无效)';
COMMENT ON COLUMN "qrpay"."tribe_user"."delete_flag" IS '备用标记';
COMMENT ON COLUMN "qrpay"."tribe_user"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_user"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for tribe_win_prize
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."tribe_win_prize";
CREATE TABLE "qrpay"."tribe_win_prize" (
"tribe_win_prize_id" varchar(50) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(50) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"tribe_id" varchar(20) COLLATE "default",
"tribe_name" varchar(50) COLLATE "default",
"tribe_activity_id" varchar(20) COLLATE "default",
"tribe_activity_name" varchar(50) COLLATE "default",
"prize_id" varchar(50) COLLATE "default" NOT NULL,
"prize_name" varchar(50) COLLATE "default",
"prize_image" varchar(255) COLLATE "default",
"prize_type" numeric(6),
"prize_content" text COLLATE "default",
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."tribe_win_prize" IS '中奖清单表';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."tribe_win_prize_id" IS '主键';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."tribe_id" IS '部落id';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."tribe_name" IS '部落名称';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."tribe_activity_id" IS '活动id';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."tribe_activity_name" IS '活动名称';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."prize_id" IS '奖品id';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."prize_name" IS '奖品名称';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."prize_image" IS '奖品图';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."prize_type" IS '奖品类型(1、商城商品2、实物商品3、内部虚拟商品4、外部虚拟商品)';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."prize_content" IS '奖品内容';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."status" IS '状态0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."delete_flag" IS '备用标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."tribe_win_prize"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for university_location
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."university_location";
CREATE TABLE "qrpay"."university_location" (
"university_location_id" varchar(50) COLLATE "default" NOT NULL,
"city_name" varchar(50) COLLATE "default" NOT NULL,
"name" varchar(50) COLLATE "default" NOT NULL,
"branch" varchar(50) COLLATE "default",
"address" varchar(200) COLLATE "default" NOT NULL,
"lng" numeric(33,30) DEFAULT 0 NOT NULL,
"lat" numeric(33,30) DEFAULT 0 NOT NULL,
"status" numeric(2) DEFAULT 0,
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."university_location" IS '大学位置信息表';
COMMENT ON COLUMN "qrpay"."university_location"."university_location_id" IS '主键';
COMMENT ON COLUMN "qrpay"."university_location"."city_name" IS '城市名称';
COMMENT ON COLUMN "qrpay"."university_location"."name" IS '大学名称';
COMMENT ON COLUMN "qrpay"."university_location"."branch" IS '校区分支';
COMMENT ON COLUMN "qrpay"."university_location"."address" IS '地址';
COMMENT ON COLUMN "qrpay"."university_location"."lng" IS '经度值';
COMMENT ON COLUMN "qrpay"."university_location"."lat" IS '纬度值';
COMMENT ON COLUMN "qrpay"."university_location"."status" IS '状态0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."university_location"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."university_location"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."university_location"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."university_location"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."university_location"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."university_location"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."university_location"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for user_back_list
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."user_back_list";
CREATE TABLE "qrpay"."user_back_list" (
"user_back_list_id" varchar(50) COLLATE "default" NOT NULL,
"source_user_id" int8 DEFAULT 0,
"target_user_id" int8 DEFAULT 0,
"back_reason" varchar(50) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"delete_flag" int4 DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."user_back_list" IS '用户黑名单表';
COMMENT ON COLUMN "qrpay"."user_back_list"."user_back_list_id" IS '主键';
COMMENT ON COLUMN "qrpay"."user_back_list"."source_user_id" IS '拉黑动作发起者';
COMMENT ON COLUMN "qrpay"."user_back_list"."target_user_id" IS '被拉黑人';
COMMENT ON COLUMN "qrpay"."user_back_list"."back_reason" IS '拉黑原因';
COMMENT ON COLUMN "qrpay"."user_back_list"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."user_back_list"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."user_back_list"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."user_back_list"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."user_back_list"."delete_flag" IS '删除标记';
COMMENT ON COLUMN "qrpay"."user_back_list"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."user_back_list"."delete_date" IS '删除时间';

-- ----------------------------
-- Table structure for user_fans
-- ----------------------------
DROP TABLE IF EXISTS "qrpay"."user_fans";
CREATE TABLE "qrpay"."user_fans" (
"user_fans_id" varchar(50) COLLATE "default" NOT NULL,
"user_id" numeric(20) NOT NULL,
"user_name" varchar(50) COLLATE "default",
"user_cellphone" varchar(100) COLLATE "default",
"nick_name" varchar(50) COLLATE "default",
"user_avatar" varchar(255) COLLATE "default",
"fans_user_id" numeric(20) NOT NULL,
"fans_user_name" varchar(50) COLLATE "default",
"fans_user_cellphone" varchar(100) COLLATE "default",
"fans_nick_name" varchar(50) COLLATE "default",
"fans_user_avatar" varchar(255) COLLATE "default",
"create_user" varchar(50) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"update_user" varchar(50) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"del_flag" numeric(2) DEFAULT 0,
"delete_flag" numeric(2) DEFAULT 0,
"delete_user" varchar(50) COLLATE "default",
"delete_date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "qrpay"."user_fans" IS '用户粉丝表';
COMMENT ON COLUMN "qrpay"."user_fans"."user_fans_id" IS '主键';
COMMENT ON COLUMN "qrpay"."user_fans"."user_id" IS '用户id';
COMMENT ON COLUMN "qrpay"."user_fans"."user_name" IS '用户名称';
COMMENT ON COLUMN "qrpay"."user_fans"."user_cellphone" IS '用户手机';
COMMENT ON COLUMN "qrpay"."user_fans"."nick_name" IS '昵称';
COMMENT ON COLUMN "qrpay"."user_fans"."user_avatar" IS '用户头像';
COMMENT ON COLUMN "qrpay"."user_fans"."fans_user_id" IS '粉丝用户id';
COMMENT ON COLUMN "qrpay"."user_fans"."fans_user_name" IS '粉丝用户名称';
COMMENT ON COLUMN "qrpay"."user_fans"."fans_user_cellphone" IS '粉丝用户手机';
COMMENT ON COLUMN "qrpay"."user_fans"."fans_nick_name" IS '粉丝昵称';
COMMENT ON COLUMN "qrpay"."user_fans"."fans_user_avatar" IS '粉丝用户头像';
COMMENT ON COLUMN "qrpay"."user_fans"."create_user" IS '创建人';
COMMENT ON COLUMN "qrpay"."user_fans"."create_date" IS '创建时间';
COMMENT ON COLUMN "qrpay"."user_fans"."update_user" IS '更新人';
COMMENT ON COLUMN "qrpay"."user_fans"."update_date" IS '更新时间';
COMMENT ON COLUMN "qrpay"."user_fans"."del_flag" IS '删除标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."user_fans"."delete_flag" IS '备用标记0，有效；1，无效';
COMMENT ON COLUMN "qrpay"."user_fans"."delete_user" IS '删除人';
COMMENT ON COLUMN "qrpay"."user_fans"."delete_date" IS '删除时间';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "qrpay"."qrpay_label_id_seq" OWNED BY "qrpay_label"."id";

-- ----------------------------
-- Primary Key structure for table admin_user
-- ----------------------------
ALTER TABLE "qrpay"."admin_user" ADD PRIMARY KEY ("admin_user_id");

-- ----------------------------
-- Primary Key structure for table bmb_member
-- ----------------------------
ALTER TABLE "qrpay"."bmb_member" ADD PRIMARY KEY ("mid");

-- ----------------------------
-- Primary Key structure for table bmb_member_mer
-- ----------------------------
ALTER TABLE "qrpay"."bmb_member_mer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bmb_mer_setcd
-- ----------------------------
CREATE UNIQUE INDEX "uni_bmb_mer_setcd_code" ON "qrpay"."bmb_mer_setcd" USING btree (cd_code);

-- ----------------------------
-- Primary Key structure for table bmb_mer_setcd
-- ----------------------------
ALTER TABLE "qrpay"."bmb_mer_setcd" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bmb_pushrelation
-- ----------------------------
CREATE UNIQUE INDEX "idx_u_bmb_pushrelation_rid" ON "qrpay"."bmb_pushrelation" USING btree (registrationid);

-- ----------------------------
-- Primary Key structure for table bmb_pushrelation
-- ----------------------------
ALTER TABLE "qrpay"."bmb_pushrelation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bmb_voucher_day
-- ----------------------------
CREATE UNIQUE INDEX "uni_bmb_voucher_day_merday" ON "qrpay"."bmb_voucher_day" USING btree (mer_id, biz_day, dispose_type, biz_type);

-- ----------------------------
-- Primary Key structure for table bmb_voucher_day
-- ----------------------------
ALTER TABLE "qrpay"."bmb_voucher_day" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bmb_voucher_day_dtl
-- ----------------------------
CREATE UNIQUE INDEX "uni_bmb_vdt_orderid_biztype" ON "qrpay"."bmb_voucher_day_dtl" USING btree (order_id, biz_type);

-- ----------------------------
-- Primary Key structure for table bmb_voucher_day_dtl
-- ----------------------------
ALTER TABLE "qrpay"."bmb_voucher_day_dtl" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bmer_indus
-- ----------------------------
ALTER TABLE "qrpay"."bmer_indus" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bmer_merchant
-- ----------------------------
ALTER TABLE "qrpay"."bmer_merchant" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bmer_merchant_check
-- ----------------------------
CREATE UNIQUE INDEX "uni_bmer_merchant_check1" ON "qrpay"."bmer_merchant_check" USING btree (mer_id, check_key, check_key);

-- ----------------------------
-- Primary Key structure for table bmer_merchant_check
-- ----------------------------
ALTER TABLE "qrpay"."bmer_merchant_check" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bmer_msg
-- ----------------------------
ALTER TABLE "qrpay"."bmer_msg" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bmer_pic
-- ----------------------------
ALTER TABLE "qrpay"."bmer_pic" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bmer_qrcode
-- ----------------------------
ALTER TABLE "qrpay"."bmer_qrcode" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_alipay
-- ----------------------------
ALTER TABLE "qrpay"."cmb_alipay" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_cashback
-- ----------------------------
CREATE UNIQUE INDEX "idx_unique_cmb_cashback" ON "qrpay"."cmb_cashback" USING btree (mid, source_id);

-- ----------------------------
-- Primary Key structure for table cmb_cashback
-- ----------------------------
ALTER TABLE "qrpay"."cmb_cashback" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_fund_act
-- ----------------------------
ALTER TABLE "qrpay"."cmb_fund_act" ADD PRIMARY KEY ("mid");

-- ----------------------------
-- Primary Key structure for table cmb_fund_act_detail
-- ----------------------------
ALTER TABLE "qrpay"."cmb_fund_act_detail" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_member
-- ----------------------------
CREATE UNIQUE INDEX "uni_cmb_member_mb_identity" ON "qrpay"."cmb_member" USING btree (mb_identity);
CREATE UNIQUE INDEX "uni_cmb_member_mb_phone" ON "qrpay"."cmb_member" USING btree (mb_phone);
CREATE UNIQUE INDEX "uni_cmb_member_mb_recommend_code" ON "qrpay"."cmb_member" USING btree (mb_recommend_code);
CREATE UNIQUE INDEX "uni_cmb_member_nick_name" ON "qrpay"."cmb_member" USING btree (nick_name);

-- ----------------------------
-- Primary Key structure for table cmb_member
-- ----------------------------
ALTER TABLE "qrpay"."cmb_member" ADD PRIMARY KEY ("mid");

-- ----------------------------
-- Primary Key structure for table cmb_member_action
-- ----------------------------
ALTER TABLE "qrpay"."cmb_member_action" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_member_address_record
-- ----------------------------
CREATE INDEX "create_time_mid_idx" ON "qrpay"."cmb_member_address_record" USING btree (create_time, mid);

-- ----------------------------
-- Primary Key structure for table cmb_member_address_record
-- ----------------------------
ALTER TABLE "qrpay"."cmb_member_address_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_member_closure
-- ----------------------------
CREATE INDEX "mid_idx" ON "qrpay"."cmb_member_closure" USING btree (mid);

-- ----------------------------
-- Primary Key structure for table cmb_member_closure
-- ----------------------------
ALTER TABLE "qrpay"."cmb_member_closure" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_member_limit
-- ----------------------------
CREATE INDEX "limit_date_mid_idx" ON "qrpay"."cmb_member_limit" USING btree (limit_date, mid);

-- ----------------------------
-- Primary Key structure for table cmb_member_limit
-- ----------------------------
ALTER TABLE "qrpay"."cmb_member_limit" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_order
-- ----------------------------
ALTER TABLE "qrpay"."cmb_order" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_pushrelation
-- ----------------------------
CREATE UNIQUE INDEX "idx_u_cmb_pushrelation_rid" ON "qrpay"."cmb_pushrelation" USING btree (registrationid);

-- ----------------------------
-- Primary Key structure for table cmb_pushrelation
-- ----------------------------
ALTER TABLE "qrpay"."cmb_pushrelation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_qq
-- ----------------------------
ALTER TABLE "qrpay"."cmb_qq" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cmb_recommend
-- ----------------------------
CREATE UNIQUE INDEX "uni_cmb_recommend_passive_mid" ON "qrpay"."cmb_recommend" USING btree (passive_mid);

-- ----------------------------
-- Primary Key structure for table cmb_recommend
-- ----------------------------
ALTER TABLE "qrpay"."cmb_recommend" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_sms_code
-- ----------------------------
ALTER TABLE "qrpay"."cmb_sms_code" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_voucher
-- ----------------------------
ALTER TABLE "qrpay"."cmb_voucher" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_voucher_batch_mer
-- ----------------------------
ALTER TABLE "qrpay"."cmb_voucher_batch_mer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_voucher_sendlog
-- ----------------------------
ALTER TABLE "qrpay"."cmb_voucher_sendlog" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cmb_webchat
-- ----------------------------
ALTER TABLE "qrpay"."cmb_webchat" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fin_bank
-- ----------------------------
ALTER TABLE "qrpay"."fin_bank" ADD PRIMARY KEY ("bankid");

-- ----------------------------
-- Primary Key structure for table fin_bank_union
-- ----------------------------
ALTER TABLE "qrpay"."fin_bank_union" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fin_bankcard_auth
-- ----------------------------
ALTER TABLE "qrpay"."fin_bankcard_auth" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fin_mb_bankcard
-- ----------------------------
ALTER TABLE "qrpay"."fin_mb_bankcard" ADD PRIMARY KEY ("bcid");

-- ----------------------------
-- Primary Key structure for table fin_mer_channel
-- ----------------------------
ALTER TABLE "qrpay"."fin_mer_channel" ADD PRIMARY KEY ("channelid");

-- ----------------------------
-- Primary Key structure for table fin_outcome
-- ----------------------------
ALTER TABLE "qrpay"."fin_outcome" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fin_outcome_batch
-- ----------------------------
ALTER TABLE "qrpay"."fin_outcome_batch" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fin_outcome_pay
-- ----------------------------
ALTER TABLE "qrpay"."fin_outcome_pay" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jigsaw_activity
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_activity" ADD PRIMARY KEY ("jigsaw_activity_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_activity_image
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_activity_image" ADD PRIMARY KEY ("jigsaw_activity_image_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_activity_prize
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_activity_prize" ADD PRIMARY KEY ("jigsaw_activity_prize_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_default_winner
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_default_winner" ADD PRIMARY KEY ("jigsaw_default_winner_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_greeting
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_greeting" ADD PRIMARY KEY ("jigsaw_greeting_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_order
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_order" ADD PRIMARY KEY ("jigsaw_order_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_user_activity
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_user_activity" ADD PRIMARY KEY ("jigsaw_user_activity_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_user_lottery_chance_record
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_user_lottery_chance_record" ADD PRIMARY KEY ("jigsaw_user_lottery_chance_record_id");

-- ----------------------------
-- Primary Key structure for table jigsaw_user_lottery_result
-- ----------------------------
ALTER TABLE "qrpay"."jigsaw_user_lottery_result" ADD PRIMARY KEY ("jigsaw_user_lottery_result_id");

-- ----------------------------
-- Indexes structure for table message
-- ----------------------------
CREATE INDEX "idx_message_create_date" ON "qrpay"."message" USING btree (create_date);
CREATE INDEX "idx_message_message_type" ON "qrpay"."message" USING btree (message_type);
CREATE INDEX "idx_message_target_user_id" ON "qrpay"."message" USING btree (target_user_id);

-- ----------------------------
-- Primary Key structure for table message
-- ----------------------------
ALTER TABLE "qrpay"."message" ADD PRIMARY KEY ("message_id");

-- ----------------------------
-- Primary Key structure for table microblog
-- ----------------------------
ALTER TABLE "qrpay"."microblog" ADD PRIMARY KEY ("microblog_id");

-- ----------------------------
-- Primary Key structure for table microblog_comment
-- ----------------------------
ALTER TABLE "qrpay"."microblog_comment" ADD PRIMARY KEY ("microblog_comment_id");

-- ----------------------------
-- Primary Key structure for table microblog_comment_delete_log
-- ----------------------------
ALTER TABLE "qrpay"."microblog_comment_delete_log" ADD PRIMARY KEY ("microblog_comment_delete_log_id");

-- ----------------------------
-- Primary Key structure for table microblog_comment_report
-- ----------------------------
ALTER TABLE "qrpay"."microblog_comment_report" ADD PRIMARY KEY ("microblog_comment_report_id");

-- ----------------------------
-- Primary Key structure for table microblog_delete_log
-- ----------------------------
ALTER TABLE "qrpay"."microblog_delete_log" ADD PRIMARY KEY ("microblog_id");

-- ----------------------------
-- Primary Key structure for table microblog_image
-- ----------------------------
ALTER TABLE "qrpay"."microblog_image" ADD PRIMARY KEY ("microblog_image_id");

-- ----------------------------
-- Primary Key structure for table microblog_like
-- ----------------------------
ALTER TABLE "qrpay"."microblog_like" ADD PRIMARY KEY ("microblog_like_id");

-- ----------------------------
-- Primary Key structure for table microblog_report
-- ----------------------------
ALTER TABLE "qrpay"."microblog_report" ADD PRIMARY KEY ("microblog_report_id");

-- ----------------------------
-- Primary Key structure for table microblog_resend
-- ----------------------------
ALTER TABLE "qrpay"."microblog_resend" ADD PRIMARY KEY ("microblog_resend_id");

-- ----------------------------
-- Indexes structure for table nact_goods_detail
-- ----------------------------
CREATE INDEX "idx_nact_goods_detail_goodsid" ON "qrpay"."nact_goods_detail" USING btree (goods_id);

-- ----------------------------
-- Primary Key structure for table nact_goods_detail
-- ----------------------------
ALTER TABLE "qrpay"."nact_goods_detail" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table promoter
-- ----------------------------
ALTER TABLE "qrpay"."promoter" ADD PRIMARY KEY ("promoter_id");

-- ----------------------------
-- Primary Key structure for table promoter_order
-- ----------------------------
ALTER TABLE "qrpay"."promoter_order" ADD PRIMARY KEY ("promoter_order_id");

-- ----------------------------
-- Primary Key structure for table promoter_order_detail
-- ----------------------------
ALTER TABLE "qrpay"."promoter_order_detail" ADD PRIMARY KEY ("promoter_order_detail_id");

-- ----------------------------
-- Primary Key structure for table promoter_order_status_change_log
-- ----------------------------
ALTER TABLE "qrpay"."promoter_order_status_change_log" ADD PRIMARY KEY ("promoter_order_status_change_log_id");

-- ----------------------------
-- Primary Key structure for table promoter_proudct
-- ----------------------------
ALTER TABLE "qrpay"."promoter_proudct" ADD PRIMARY KEY ("promoter_proudct_id");

-- ----------------------------
-- Primary Key structure for table qrpay_act
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_act" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_act_mer
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_act_mer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_advert
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_advert" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_advert_page
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_advert_page" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_advert_pagearea
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_advert_pagearea" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_agio_detail
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_agio_detail" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_agioact_conf
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_agioact_conf" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_agioact_mer
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_agioact_mer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_app_version
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_app_version" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_article
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_article" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_article_tag
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_article_tag" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_bankcard_bin
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_bankcard_bin" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_brand
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_brand" ADD PRIMARY KEY ("brand_id");

-- ----------------------------
-- Primary Key structure for table qrpay_brand_association
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_brand_association" ADD PRIMARY KEY ("brand_association_id");

-- ----------------------------
-- Primary Key structure for table qrpay_businessnumber
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_businessnumber" ADD PRIMARY KEY ("code");

-- ----------------------------
-- Primary Key structure for table qrpay_cannel_cause
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_cannel_cause" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_city
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_city" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_collection
-- ----------------------------
CREATE INDEX "idx_qrpay_collection_mid" ON "qrpay"."qrpay_collection" USING btree (mid);

-- ----------------------------
-- Primary Key structure for table qrpay_collection
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_collection" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_deliver_address
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_deliver_address" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_express
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_express" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_hot_search
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_hot_search" ADD PRIMARY KEY ("hot_search_id");

-- ----------------------------
-- Primary Key structure for table qrpay_index_configuration
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_index_configuration" ADD PRIMARY KEY ("index_configuration_id");

-- ----------------------------
-- Indexes structure for table qrpay_internal_msg
-- ----------------------------
CREATE INDEX "idx_qrpay_internal_msg_mid" ON "qrpay"."qrpay_internal_msg" USING btree (mid);

-- ----------------------------
-- Primary Key structure for table qrpay_internal_msg
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_internal_msg" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_label
-- ----------------------------
CREATE INDEX "index_effective_end" ON "qrpay"."qrpay_label" USING btree (effective_end);
CREATE INDEX "index_effective_start" ON "qrpay"."qrpay_label" USING btree (effective_start);
CREATE INDEX "index_label_attr" ON "qrpay"."qrpay_label" USING btree (label_attr);
CREATE INDEX "index_label_type" ON "qrpay"."qrpay_label" USING btree (label_type);

-- ----------------------------
-- Primary Key structure for table qrpay_label
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_label" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_label_labels
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_label_labels" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_label_relation
-- ----------------------------
CREATE INDEX "index_label_b_id" ON "qrpay"."qrpay_label_relation" USING btree (business_id);
CREATE UNIQUE INDEX "unx_label_business_id" ON "qrpay"."qrpay_label_relation" USING btree (label_id, business_id);

-- ----------------------------
-- Primary Key structure for table qrpay_label_relation
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_label_relation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact
-- ----------------------------
CREATE INDEX "idx_qrpay_nact_create_time" ON "qrpay"."qrpay_nact" USING btree (create_time);
CREATE INDEX "idx_qrpay_nact_goodsid" ON "qrpay"."qrpay_nact" USING btree (goods_id);

-- ----------------------------
-- Primary Key structure for table qrpay_nact
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_goods
-- ----------------------------
CREATE INDEX "idx_nact_goods_create_time" ON "qrpay"."qrpay_nact_goods" USING btree (create_time);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_goods
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_goods" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_goods_city
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_goods_city" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_goods_img
-- ----------------------------
CREATE INDEX "idx_nact_goods_img_goodsid" ON "qrpay"."qrpay_nact_goods_img" USING btree (goods_id);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_goods_img
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_goods_img" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_goods_location
-- ----------------------------
CREATE INDEX "idx_goods_location_goodsid" ON "qrpay"."qrpay_nact_goods_location" USING btree (goods_id);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_goods_location
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_goods_location" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_goods_relation
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_goods_relation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_group
-- ----------------------------
CREATE INDEX "idx_nact_group_create_time" ON "qrpay"."qrpay_nact_group" USING btree (create_time);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_group
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_group" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_group_join
-- ----------------------------
CREATE INDEX "idx_group_join_create_time" ON "qrpay"."qrpay_nact_group_join" USING btree (create_time);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_group_join
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_group_join" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_img
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_img" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_mb_count
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_mb_count" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_order
-- ----------------------------
CREATE INDEX "idx_nact_order_create_time" ON "qrpay"."qrpay_nact_order" USING btree (create_time);

-- ----------------------------
-- Triggers structure for table qrpay_nact_order
-- ----------------------------
CREATE TRIGGER "promoter_order_status_sync_trigger" AFTER UPDATE ON "qrpay"."qrpay_nact_order"
FOR EACH ROW
EXECUTE PROCEDURE "promoter_order_status_sync_func"();

-- ----------------------------
-- Primary Key structure for table qrpay_nact_order
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_order" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_order_member
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_order_member" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_order_relation
-- ----------------------------
CREATE INDEX "index_nact_order_rela_gdid" ON "qrpay"."qrpay_nact_order_relation" USING btree (goods_detail_id);
CREATE INDEX "index_nact_order_rela_oid" ON "qrpay"."qrpay_nact_order_relation" USING btree (order_id);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_order_relation
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_order_relation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_nact_rec_award
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_rec_award" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_type
-- ----------------------------
CREATE INDEX "idx_nact_type_lid" ON "qrpay"."qrpay_nact_type" USING btree (level_id);
CREATE INDEX "idx_nact_type_pid" ON "qrpay"."qrpay_nact_type" USING btree (parent_id);
CREATE INDEX "idx_nact_type_sta" ON "qrpay"."qrpay_nact_type" USING btree (status);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_type
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_nact_type_relation
-- ----------------------------
CREATE INDEX "idx_nact_type_rela_aid" ON "qrpay"."qrpay_nact_type_relation" USING btree (act_id);
CREATE INDEX "idx_nact_type_rela_tid" ON "qrpay"."qrpay_nact_type_relation" USING btree (type_id);

-- ----------------------------
-- Primary Key structure for table qrpay_nact_type_relation
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_nact_type_relation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact_contact
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact_contact" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact_group
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact_group" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact_group_join
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact_group_join" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact_pool
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact_pool" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_pact_record
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_pact_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_redpacket_act
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_redpacket_act" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_redpacket_batch
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_redpacket_batch" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_redpacket_grant
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_redpacket_grant" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_register_record
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_register_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_school
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_school" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_seckill_config
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_seckill_config" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_seckill_session
-- ----------------------------
CREATE INDEX "idx_seckill_session_session_date" ON "qrpay"."qrpay_seckill_session" USING btree (session_date);

-- ----------------------------
-- Primary Key structure for table qrpay_seckill_session
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_seckill_session" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table qrpay_seckill_session_nact
-- ----------------------------
CREATE INDEX "idx_seckill_session_nact_session_date" ON "qrpay"."qrpay_seckill_session_nact" USING btree (session_date);

-- ----------------------------
-- Primary Key structure for table qrpay_seckill_session_nact
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_seckill_session_nact" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_sms_plan
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_sms_plan" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_sms_plan_dtl
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_sms_plan_dtl" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_sms_record
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_sms_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_sms_templet
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_sms_templet" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_spider_article
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_spider_article" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table qrpay_spider_config
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_spider_config" ADD UNIQUE ("subscription_name");
ALTER TABLE "qrpay"."qrpay_spider_config" ADD UNIQUE ("subscription_number");

-- ----------------------------
-- Primary Key structure for table qrpay_spider_config
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_spider_config" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_subject
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_subject" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_subject_channel
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_subject_channel" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_subject_nact
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_subject_nact" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_topic
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_topic" ADD PRIMARY KEY ("topic_id");

-- ----------------------------
-- Primary Key structure for table qrpay_topic_relevance
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_topic_relevance" ADD PRIMARY KEY ("topic_relevance_id");

-- ----------------------------
-- Primary Key structure for table qrpay_type_brief
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_type_brief" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_user_vipcard
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_user_vipcard" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_vote
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_vote" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_vote_option
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_vote_option" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_vote_option_detial
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_vote_option_detial" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_writeoff_goods_detail
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_writeoff_goods_detail" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrpay_wx_temp
-- ----------------------------
ALTER TABLE "qrpay"."qrpay_wx_temp" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rd_qhzx_info_new
-- ----------------------------
CREATE INDEX "idex_qhnew_idno_sourceid" ON "qrpay"."rd_qhzx_info_new" USING btree (idno, sourceid);
CREATE INDEX "idx_qhnew_cid" ON "qrpay"."rd_qhzx_info_new" USING btree (cid);
CREATE INDEX "idx_qhnew_crtime" ON "qrpay"."rd_qhzx_info_new" USING btree (create_time);
CREATE INDEX "idx_qhnew_seqno" ON "qrpay"."rd_qhzx_info_new" USING btree (seqno);

-- ----------------------------
-- Primary Key structure for table rd_qhzx_info_new
-- ----------------------------
ALTER TABLE "qrpay"."rd_qhzx_info_new" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table serialnumber
-- ----------------------------
ALTER TABLE "qrpay"."serialnumber" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shop_voucher_batch
-- ----------------------------
ALTER TABLE "qrpay"."shop_voucher_batch" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shop_voucher_limiter
-- ----------------------------
ALTER TABLE "qrpay"."shop_voucher_limiter" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shop_voucher_record
-- ----------------------------
ALTER TABLE "qrpay"."shop_voucher_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table task_info
-- ----------------------------
ALTER TABLE "qrpay"."task_info" ADD PRIMARY KEY ("task_id");

-- ----------------------------
-- Primary Key structure for table task_label
-- ----------------------------
ALTER TABLE "qrpay"."task_label" ADD PRIMARY KEY ("task_label_id");

-- ----------------------------
-- Primary Key structure for table task_label_renference
-- ----------------------------
ALTER TABLE "qrpay"."task_label_renference" ADD PRIMARY KEY ("task_label_renference_id");

-- ----------------------------
-- Primary Key structure for table task_prize
-- ----------------------------
ALTER TABLE "qrpay"."task_prize" ADD PRIMARY KEY ("task_prize_id");

-- ----------------------------
-- Primary Key structure for table task_prize_user
-- ----------------------------
ALTER TABLE "qrpay"."task_prize_user" ADD PRIMARY KEY ("task_prize_user_id");

-- ----------------------------
-- Primary Key structure for table task_rule_tribe
-- ----------------------------
ALTER TABLE "qrpay"."task_rule_tribe" ADD PRIMARY KEY ("task_rule_tribe_id");

-- ----------------------------
-- Primary Key structure for table task_user_execute
-- ----------------------------
ALTER TABLE "qrpay"."task_user_execute" ADD PRIMARY KEY ("task_user_execute_id");

-- ----------------------------
-- Primary Key structure for table task_user_label_renference
-- ----------------------------
ALTER TABLE "qrpay"."task_user_label_renference" ADD PRIMARY KEY ("task_user_label_renference_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity" ADD PRIMARY KEY ("tribe_activity_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_image
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_image" ADD PRIMARY KEY ("tribe_activity_image_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_prize
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_prize" ADD PRIMARY KEY ("tribe_activity_prize_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_user
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_user" ADD PRIMARY KEY ("tribe_activity_user_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_vote
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_vote" ADD PRIMARY KEY ("tribe_activity_vote_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_vote_detail
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_vote_detail" ADD PRIMARY KEY ("tribe_activity_vote_detail_id");

-- ----------------------------
-- Primary Key structure for table tribe_activity_vote_like
-- ----------------------------
ALTER TABLE "qrpay"."tribe_activity_vote_like" ADD PRIMARY KEY ("tribe_activity_vote_like_id");

-- ----------------------------
-- Primary Key structure for table tribe_info
-- ----------------------------
ALTER TABLE "qrpay"."tribe_info" ADD PRIMARY KEY ("tribe_info_id");

-- ----------------------------
-- Primary Key structure for table tribe_popular_config
-- ----------------------------
ALTER TABLE "qrpay"."tribe_popular_config" ADD PRIMARY KEY ("tribe_popular_config_id");

-- ----------------------------
-- Primary Key structure for table tribe_prize_rule
-- ----------------------------
ALTER TABLE "qrpay"."tribe_prize_rule" ADD PRIMARY KEY ("tribe_prize_rule_id");

-- ----------------------------
-- Primary Key structure for table tribe_user
-- ----------------------------
ALTER TABLE "qrpay"."tribe_user" ADD PRIMARY KEY ("tribe_user_id");

-- ----------------------------
-- Primary Key structure for table tribe_win_prize
-- ----------------------------
ALTER TABLE "qrpay"."tribe_win_prize" ADD PRIMARY KEY ("tribe_win_prize_id");

-- ----------------------------
-- Primary Key structure for table university_location
-- ----------------------------
ALTER TABLE "qrpay"."university_location" ADD PRIMARY KEY ("university_location_id");

-- ----------------------------
-- Primary Key structure for table user_back_list
-- ----------------------------
ALTER TABLE "qrpay"."user_back_list" ADD PRIMARY KEY ("user_back_list_id");

-- ----------------------------
-- Primary Key structure for table user_fans
-- ----------------------------
ALTER TABLE "qrpay"."user_fans" ADD PRIMARY KEY ("user_fans_id");
