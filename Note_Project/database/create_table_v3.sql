CREATE OR REPLACE FUNCTION update_updated_at()
  RETURNS TRIGGER AS
$$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;



-- public."action" definition

-- Drop table

-- DROP TABLE public."action";

CREATE TABLE public."action" (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên quyền
	"content" varchar(500) NOT NULL, -- nội dung
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT action_name_key UNIQUE (name),
	CONSTRAINT action_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public."action" IS 'tên các quyền như thêm , sửa , xóa các trường';

-- Column comments

COMMENT ON COLUMN public."action"."name" IS 'tên quyền';
COMMENT ON COLUMN public."action"."content" IS 'nội dung';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.action for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public."action" OWNER TO postgres;
GRANT ALL ON TABLE public."action" TO postgres;


-- public.administration definition

-- Drop table

-- DROP TABLE public.administration;

CREATE TABLE public.administration (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT administration_name_key UNIQUE (name),
	CONSTRAINT administration_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.administration IS 'tên cấp độ tài khoản';

-- Column comments

COMMENT ON COLUMN public.administration."name" IS 'tên';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.administration for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.administration OWNER TO postgres;
GRANT ALL ON TABLE public.administration TO postgres;


-- public.branch definition

-- Drop table

-- DROP TABLE public.branch;

CREATE TABLE public.branch (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên chi nhánh
	address varchar(200) NOT NULL, -- địa chỉ
	hotline varchar(50) NOT NULL,
	manage varchar(50) NOT NULL, -- tên quản lý
	working_time varchar(200) NOT NULL, -- thời gian làm việc
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT branch_name_key UNIQUE (name),
	CONSTRAINT branch_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.branch IS 'tên các chi nhánh';

-- Column comments

COMMENT ON COLUMN public.branch."name" IS 'tên chi nhánh';
COMMENT ON COLUMN public.branch.address IS 'địa chỉ';
COMMENT ON COLUMN public.branch.manage IS 'tên quản lý';
COMMENT ON COLUMN public.branch.working_time IS 'thời gian làm việc';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.branch for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.branch OWNER TO postgres;
GRANT ALL ON TABLE public.branch TO postgres;


-- public.contact_support definition

-- Drop table

-- DROP TABLE public.contact_support;

CREATE TABLE public.contact_support (
	id serial4 NOT NULL,
	logo varchar(200) NOT NULL,
	link varchar(200) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT contact_support_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.contact_support IS 'các tiện ích tích hợp ở góc phải màn hình : zalo , fb . chatonline';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.contact_support for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.contact_support OWNER TO postgres;
GRANT ALL ON TABLE public.contact_support TO postgres;


-- public.failed_jobs definition

-- Drop table

-- DROP TABLE public.failed_jobs;

CREATE TABLE public.failed_jobs (
	id bigserial NOT NULL,
	uuid varchar(255) NOT NULL,
	"connection" text NOT NULL,
	queue text NOT NULL,
	payload text NOT NULL,
	"exception" text NOT NULL,
	failed_at timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT failed_jobs_pkey PRIMARY KEY (id),
	CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid)
);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.failed_jobs for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.failed_jobs OWNER TO postgres;
GRANT ALL ON TABLE public.failed_jobs TO postgres;


-- public.intermediary_account_service definition

-- Drop table

-- DROP TABLE public.intermediary_account_service;

CREATE TABLE public.intermediary_account_service (
	id serial4 NOT NULL,
	servive_name varchar(50) NOT NULL, -- tên dv
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT intermediary_account_service_pkey PRIMARY KEY (id),
	CONSTRAINT intermediary_account_service_servive_name_key UNIQUE (servive_name)
);
COMMENT ON TABLE public.intermediary_account_service IS 'tên các bên dịch vụ tài khoản thứ 3 : gg, git , zalo ,..';

-- Column comments

COMMENT ON COLUMN public.intermediary_account_service.servive_name IS 'tên dv';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.intermediary_account_service for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.intermediary_account_service OWNER TO postgres;
GRANT ALL ON TABLE public.intermediary_account_service TO postgres;


-- public.log_login definition

-- Drop table

-- DROP TABLE public.log_login;

CREATE TABLE public.log_login (
	id serial4 NOT NULL,
	user_login varchar(50) NOT NULL,
	"type" int2 NOT NULL,
	"content" varchar(200) NOT NULL,
	ip varchar(200) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT log_login_pkey PRIMARY KEY (id)
);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.log_login for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.log_login OWNER TO postgres;
GRANT ALL ON TABLE public.log_login TO postgres;


-- public.menu_main definition

-- Drop table

-- DROP TABLE public.menu_main;

CREATE TABLE public.menu_main (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	color varchar(50) NULL,
	is_sub_menu bool NULL DEFAULT false, -- có sub menu ko
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT menu_main_name_key UNIQUE (name),
	CONSTRAINT menu_main_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.menu_main IS 'menu chính';

-- Column comments

COMMENT ON COLUMN public.menu_main.is_sub_menu IS 'có sub menu ko';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.menu_main for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.menu_main OWNER TO postgres;
GRANT ALL ON TABLE public.menu_main TO postgres;


-- public.migrations definition

-- Drop table

-- DROP TABLE public.migrations;

CREATE TABLE public.migrations (
	id serial4 NOT NULL,
	migration varchar(255) NOT NULL,
	batch int4 NOT NULL,
	CONSTRAINT migrations_pkey PRIMARY KEY (id)
);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.migrations for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.migrations OWNER TO postgres;
GRANT ALL ON TABLE public.migrations TO postgres;


-- public.password_reset_tokens definition

-- Drop table

-- DROP TABLE public.password_reset_tokens;

CREATE TABLE public.password_reset_tokens (
	email varchar(255) NOT NULL,
	"token" varchar(255) NOT NULL,
	created_at timestamp(0) NULL,
	CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email)
);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.password_reset_tokens for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.password_reset_tokens OWNER TO postgres;
GRANT ALL ON TABLE public.password_reset_tokens TO postgres;


-- public.payment_methods definition

-- Drop table

-- DROP TABLE public.payment_methods;

CREATE TABLE public.payment_methods (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT payment_methods_name_key UNIQUE (name),
	CONSTRAINT payment_methods_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.payment_methods IS 'tên các phương thức thanh toán';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.payment_methods for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.payment_methods OWNER TO postgres;
GRANT ALL ON TABLE public.payment_methods TO postgres;


-- public.personal_access_tokens definition

-- Drop table

-- DROP TABLE public.personal_access_tokens;

CREATE TABLE public.personal_access_tokens (
	id bigserial NOT NULL,
	tokenable_type varchar(255) NOT NULL,
	tokenable_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	"token" varchar(64) NOT NULL,
	abilities text NULL,
	last_used_at timestamp(0) NULL,
	expires_at timestamp(0) NULL,
	created_at timestamp(0) NULL,
	updated_at timestamp(0) NULL,
	CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id),
	CONSTRAINT personal_access_tokens_token_unique UNIQUE (token)
);
CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.personal_access_tokens for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.personal_access_tokens OWNER TO postgres;
GRANT ALL ON TABLE public.personal_access_tokens TO postgres;


-- public."position" definition

-- Drop table

-- DROP TABLE public."position";

CREATE TABLE public."position" (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên
	"content" varchar(500) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT position_name_key UNIQUE (name),
	CONSTRAINT position_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public."position" IS 'chức vụ nhân viên';

-- Column comments

COMMENT ON COLUMN public."position"."name" IS 'tên';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public."position" for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public."position" OWNER TO postgres;
GRANT ALL ON TABLE public."position" TO postgres;


-- public."rank" definition

-- Drop table

-- DROP TABLE public."rank";

CREATE TABLE public."rank" (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên
	detail varchar(200) NOT NULL, -- chi tiết
	icon varchar(50) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	score int2 NULL, -- số điểm để lên cấp rank
	CONSTRAINT rank_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public."rank" IS 'tên các cấp rank';

-- Column comments

COMMENT ON COLUMN public."rank"."name" IS 'tên';
COMMENT ON COLUMN public."rank".detail IS 'chi tiết';
COMMENT ON COLUMN public."rank".score IS 'số điểm để lên cấp rank';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.rank for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public."rank" OWNER TO postgres;
GRANT ALL ON TABLE public."rank" TO postgres;


-- public.report_source definition

-- Drop table

-- DROP TABLE public.report_source;

CREATE TABLE public.report_source (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên
	note varchar(500) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT report_source_name_key UNIQUE (name),
	CONSTRAINT report_source_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.report_source IS 'tên nguồn tố cáo';

-- Column comments

COMMENT ON COLUMN public.report_source."name" IS 'tên';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.report_source for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.report_source OWNER TO postgres;
GRANT ALL ON TABLE public.report_source TO postgres;


-- public.shipping_method definition

-- Drop table

-- DROP TABLE public.shipping_method;

CREATE TABLE public.shipping_method (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT shipping_method_name_key UNIQUE (name),
	CONSTRAINT shipping_method_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.shipping_method IS 'tên các phương thức nhận hàng : ở cửa hàng , ở chi nhánh khác ,  giao hàng';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.shipping_method for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.shipping_method OWNER TO postgres;
GRANT ALL ON TABLE public.shipping_method TO postgres;


-- public.transfer_providers definition

-- Drop table

-- DROP TABLE public.transfer_providers;

CREATE TABLE public.transfer_providers (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT transfer_providers_name_key UNIQUE (name),
	CONSTRAINT transfer_providers_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.transfer_providers IS 'các nhà cung cấp dịch vụ thanh toán online';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.transfer_providers for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.transfer_providers OWNER TO postgres;
GRANT ALL ON TABLE public.transfer_providers TO postgres;


-- public.type_promotion definition

-- Drop table

-- DROP TABLE public.type_promotion;

CREATE TABLE public.type_promotion (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên kh
	"content" varchar(200) NOT NULL, -- nội dung km
	code_hide varchar(200) NOT NULL, -- đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT type_promotion_name_key UNIQUE (name),
	CONSTRAINT type_promotion_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.type_promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';

-- Column comments

COMMENT ON COLUMN public.type_promotion."name" IS 'tên kh';
COMMENT ON COLUMN public.type_promotion."content" IS 'nội dung km';
COMMENT ON COLUMN public.type_promotion.code_hide IS 'đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.type_promotion for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.type_promotion OWNER TO postgres;
GRANT ALL ON TABLE public.type_promotion TO postgres;


-- public.type_report definition

-- Drop table

-- DROP TABLE public.type_report;

CREATE TABLE public.type_report (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	note varchar(500) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT type_report_name_key UNIQUE (name),
	CONSTRAINT type_report_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.type_report IS 'loại tố cáo';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.type_report for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.type_report OWNER TO postgres;
GRANT ALL ON TABLE public.type_report TO postgres;


-- public.type_ticket definition

-- Drop table

-- DROP TABLE public.type_ticket;

CREATE TABLE public.type_ticket (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	note varchar(200) NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT type_ticket_name_key UNIQUE (name),
	CONSTRAINT type_ticket_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.type_ticket IS 'loại phiếu';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.type_ticket for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.type_ticket OWNER TO postgres;
GRANT ALL ON TABLE public.type_ticket TO postgres;


-- public.type_update definition

-- Drop table

-- DROP TABLE public.type_update;

CREATE TABLE public.type_update (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	note varchar(500) NOT NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT type_update_name_key UNIQUE (name),
	CONSTRAINT type_update_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE public.type_update IS 'các loại update / xóa / ẩn';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.type_update for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.type_update OWNER TO postgres;
GRANT ALL ON TABLE public.type_update TO postgres;


-- public.account_admin_action definition

-- Drop table

-- DROP TABLE public.account_admin_action;

CREATE TABLE public.account_admin_action (
	id serial4 NOT NULL,
	administration_id int2 NOT NULL, -- mã quyền
	action_id int2 NOT NULL, -- mã thao tác
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT account_admin_action_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_action_admin" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_action_admin" FOREIGN KEY (action_id) REFERENCES public."action"(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.account_admin_action IS 'bảng trung gian tài khoản được gắn cho các quyền';

-- Column comments

COMMENT ON COLUMN public.account_admin_action.administration_id IS 'mã quyền';
COMMENT ON COLUMN public.account_admin_action.action_id IS 'mã thao tác';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.account_admin_action for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.account_admin_action OWNER TO postgres;
GRANT ALL ON TABLE public.account_admin_action TO postgres;


-- public.customers definition

-- Drop table

-- DROP TABLE public.customers;

CREATE TABLE public.customers (
	id serial4 NOT NULL,
	rank_id int2 NOT NULL DEFAULT 0, -- cấp độ kh
	first_name varchar(50) NOT NULL, -- tên
	last_name varchar(50) NOT NULL, -- họ
	address varchar(200) NULL DEFAULT NULL::character varying, -- địa chỉ
	phone_number _varchar NOT NULL, -- số điện thoại
	email _varchar NOT NULL, -- email
	birthday date NULL, -- sinh ngày
	sex bool NULL, -- giới tính 0 : nữ 1: nam
	accumulated_points int2 NULL DEFAULT '1'::smallint, -- số điểm tích để lên rank
	number_ban int2 NULL DEFAULT '0'::smallint, -- số lần bị band
	potential bool NULL DEFAULT true, -- là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT customers_email_key UNIQUE (email),
	CONSTRAINT customers_phone_number_key UNIQUE (phone_number),
	CONSTRAINT customers_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_customers" FOREIGN KEY (rank_id) REFERENCES public."rank"(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.customers IS 'ds kh';

-- Column comments

COMMENT ON COLUMN public.customers.rank_id IS 'cấp độ kh';
COMMENT ON COLUMN public.customers.first_name IS 'tên';
COMMENT ON COLUMN public.customers.last_name IS 'họ';
COMMENT ON COLUMN public.customers.address IS 'địa chỉ';
COMMENT ON COLUMN public.customers.phone_number IS 'số điện thoại';
COMMENT ON COLUMN public.customers.email IS 'email';
COMMENT ON COLUMN public.customers.birthday IS 'sinh ngày';
COMMENT ON COLUMN public.customers.sex IS 'giới tính 0 : nữ 1: nam';
COMMENT ON COLUMN public.customers.accumulated_points IS 'số điểm tích để lên rank';
COMMENT ON COLUMN public.customers.number_ban IS 'số lần bị band';
COMMENT ON COLUMN public.customers.potential IS 'là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.customers for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.customers OWNER TO postgres;
GRANT ALL ON TABLE public.customers TO postgres;


-- public.log_deletes definition

-- Drop table

-- DROP TABLE public.log_deletes;

CREATE TABLE public.log_deletes (
	id serial4 NOT NULL,
	type_delete_id int2 NOT NULL, -- loại xóa
	"content" varchar(200) NOT NULL,
	internal bool NULL DEFAULT false, -- thuộc nội bộ hay ko
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT log_deletes_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_log_delete" FOREIGN KEY (type_delete_id) REFERENCES public.type_update(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.log_deletes IS 'lịch sử xóa';

-- Column comments

COMMENT ON COLUMN public.log_deletes.type_delete_id IS 'loại xóa';
COMMENT ON COLUMN public.log_deletes.internal IS 'thuộc nội bộ hay ko';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.log_deletes for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.log_deletes OWNER TO postgres;
GRANT ALL ON TABLE public.log_deletes TO postgres;


-- public.log_updates definition

-- Drop table

-- DROP TABLE public.log_updates;

CREATE TABLE public.log_updates (
	id serial4 NOT NULL,
	type_update_id int2 NOT NULL,
	"content" varchar(200) NOT NULL,
	internal bool NULL DEFAULT false,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT log_updates_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_log_update" FOREIGN KEY (type_update_id) REFERENCES public.type_update(id) ON UPDATE CASCADE
);

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.log_updates for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.log_updates OWNER TO postgres;
GRANT ALL ON TABLE public.log_updates TO postgres;


-- public.staff definition

-- Drop table

-- DROP TABLE public.staff;

CREATE TABLE public.staff (
	id serial4 NOT NULL,
	code_staff varchar(50) NOT NULL, -- mã đinh danh nhân viên
	position_id int2 NOT NULL, -- id chức vụ
	branch_id int2 NOT NULL, -- id chi nhánh
	"name" varchar(50) NOT NULL, -- tên nhân viên
	address varchar(200) NOT NULL, -- địa chỉ nhân viên
	phone_number varchar(50) NOT NULL, -- sdt
	email varchar(50) NULL,
	birthday date NULL,
	sex bool NULL,
	img varchar(200) NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT staff_code_staff_key UNIQUE (code_staff),
	CONSTRAINT staff_phone_number_key UNIQUE (phone_number),
	CONSTRAINT staff_pkey PRIMARY KEY (id),
	CONSTRAINT unique_code_staff UNIQUE (code_staff),
	CONSTRAINT "FK1_staff" FOREIGN KEY (position_id) REFERENCES public."position"(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_staff" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.staff IS 'ds nhân viên';

-- Column comments

COMMENT ON COLUMN public.staff.code_staff IS 'mã đinh danh nhân viên';
COMMENT ON COLUMN public.staff.position_id IS 'id chức vụ';
COMMENT ON COLUMN public.staff.branch_id IS 'id chi nhánh';
COMMENT ON COLUMN public.staff."name" IS 'tên nhân viên';
COMMENT ON COLUMN public.staff.address IS 'địa chỉ nhân viên';
COMMENT ON COLUMN public.staff.phone_number IS 'sdt';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.staff for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.staff OWNER TO postgres;
GRANT ALL ON TABLE public.staff TO postgres;


-- public.staff_account definition

-- Drop table

-- DROP TABLE public.staff_account;

CREATE TABLE public.staff_account (
	id serial4 NOT NULL,
	staff_id int2 NOT NULL,
	administration_id int2 NOT NULL,
	user_name varchar(50) NOT NULL,
	"password" varchar(255) NOT NULL,
	remember_token varchar(100) NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT staff_account_pkey PRIMARY KEY (id),
	CONSTRAINT staff_account_user_name_key UNIQUE (user_name),
	CONSTRAINT unique_column_constraint UNIQUE (staff_id),
	CONSTRAINT "FK1_staff_account" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_staff_account" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.staff_account IS 'tk nhân viên';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.staff_account for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.staff_account OWNER TO postgres;
GRANT ALL ON TABLE public.staff_account TO postgres;


-- public.sub_menu definition

-- Drop table

-- DROP TABLE public.sub_menu;

CREATE TABLE public.sub_menu (
	id serial4 NOT NULL,
	menu_main_id int2 NOT NULL, -- thuộc menu nào
	"name" varchar(20) NOT NULL,
	color varchar(20) NOT NULL,
	sub bool NULL DEFAULT false,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT sub_menu_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_sub_menu" FOREIGN KEY (menu_main_id) REFERENCES public.menu_main(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.sub_menu IS 'ds submenu';

-- Column comments

COMMENT ON COLUMN public.sub_menu.menu_main_id IS 'thuộc menu nào';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.sub_menu for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.sub_menu OWNER TO postgres;
GRANT ALL ON TABLE public.sub_menu TO postgres;


-- public.warehouse definition

-- Drop table

-- DROP TABLE public.warehouse;

CREATE TABLE public.warehouse (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	hotline varchar(50) NOT NULL,
	manage varchar(50) NOT NULL,
	branch_id int2 NOT NULL, -- thuộc chi nhánh nào
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT warehouse_name_key UNIQUE (name),
	CONSTRAINT warehouse_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_warehouse" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.warehouse IS 'tên các kho';

-- Column comments

COMMENT ON COLUMN public.warehouse.branch_id IS 'thuộc chi nhánh nào';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.warehouse for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.warehouse OWNER TO postgres;
GRANT ALL ON TABLE public.warehouse TO postgres;


-- public.account_customers definition

-- Drop table

-- DROP TABLE public.account_customers;

CREATE TABLE public.account_customers (
	id serial4 NOT NULL,
	customers_id int2 NOT NULL, -- id khách hàng
	remember_token varchar(100) NOT NULL,
	user_name varchar(20) NOT NULL, -- tên đăng nhập
	"password" varchar(255) NOT NULL, -- mật khẩu
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT account_customers_pk PRIMARY KEY (id),
	CONSTRAINT account_customers_un UNIQUE (user_name),
	CONSTRAINT "FK1_account_customers" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.account_customers IS 'tài khoản khách hàng';

-- Column comments

COMMENT ON COLUMN public.account_customers.customers_id IS 'id khách hàng';
COMMENT ON COLUMN public.account_customers.user_name IS 'tên đăng nhập';
COMMENT ON COLUMN public.account_customers."password" IS 'mật khẩu';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.account_customers for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.account_customers OWNER TO postgres;
GRANT ALL ON TABLE public.account_customers TO postgres;


-- public.bill definition

-- Drop table

-- DROP TABLE public.bill;

CREATE TABLE public.bill (
	id serial4 NOT NULL,
	code_bill varchar(50) NOT NULL, -- mã hóa đơn hiển thị
	staff_id int2 NOT NULL, -- mã nhân viên tạo phiếu
	customers_id int2 NOT NULL, -- phiếu của kh
	branch_id int2 NOT NULL, -- phiệu được tạo ở chi  nhánh
	payment_methods_id int2 NOT NULL, -- mã phương thức thanh toán
	shipping_method_id int2 NOT NULL, -- mã phương thức nhận hàng
	transfer_providers_id int2 NOT NULL, -- nếu chọn hình thức nhận hàng online¶đây là cột mã nhà cung cấp dịch vụ vận chuyển
	total_products int2 NOT NULL, -- tổng số sp
	initial_amount int4 NOT NULL, -- số tiền ban đầu
	actual_amount int4 NOT NULL, -- số tiền thực tế
	giftcode_id int2 NULL, -- id mã giảm giá
	successful_payment bool NULL DEFAULT false, -- đã thanh toán ?
	note varchar(500) NULL,
	impact_number int2 NULL DEFAULT '0'::smallint, -- số lần chỉnh sửa
	report_ship bool NULL DEFAULT false, -- đơn bị tố cáo , cảnh báo
	queue_bill bool NULL DEFAULT true, -- đơn đang ở hàng đợi chưa đc duyệt
	note_report varchar(500) NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT bill_code_bill_key UNIQUE (code_bill),
	CONSTRAINT bill_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_bill" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_bill" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_bill" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE,
	CONSTRAINT "FK4_bill" FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE,
	CONSTRAINT "FK5_bill" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id) ON UPDATE CASCADE,
	CONSTRAINT "FK6_bill" FOREIGN KEY (transfer_providers_id) REFERENCES public.transfer_providers(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.bill IS 'hóa đơn';

-- Column comments

COMMENT ON COLUMN public.bill.code_bill IS 'mã hóa đơn hiển thị';
COMMENT ON COLUMN public.bill.staff_id IS 'mã nhân viên tạo phiếu';
COMMENT ON COLUMN public.bill.customers_id IS 'phiếu của kh';
COMMENT ON COLUMN public.bill.branch_id IS 'phiệu được tạo ở chi  nhánh';
COMMENT ON COLUMN public.bill.payment_methods_id IS 'mã phương thức thanh toán';
COMMENT ON COLUMN public.bill.shipping_method_id IS 'mã phương thức nhận hàng';
COMMENT ON COLUMN public.bill.transfer_providers_id IS 'nếu chọn hình thức nhận hàng online
đây là cột mã nhà cung cấp dịch vụ vận chuyển';
COMMENT ON COLUMN public.bill.total_products IS 'tổng số sp';
COMMENT ON COLUMN public.bill.initial_amount IS 'số tiền ban đầu';
COMMENT ON COLUMN public.bill.actual_amount IS 'số tiền thực tế';
COMMENT ON COLUMN public.bill.giftcode_id IS 'id mã giảm giá';
COMMENT ON COLUMN public.bill.successful_payment IS 'đã thanh toán ?';
COMMENT ON COLUMN public.bill.impact_number IS 'số lần chỉnh sửa';
COMMENT ON COLUMN public.bill.report_ship IS 'đơn bị tố cáo , cảnh báo';
COMMENT ON COLUMN public.bill.queue_bill IS 'đơn đang ở hàng đợi chưa đc duyệt';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.bill for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.bill OWNER TO postgres;
GRANT ALL ON TABLE public.bill TO postgres;


-- public.event_ads definition

-- Drop table

-- DROP TABLE public.event_ads;

CREATE TABLE public.event_ads (
	id serial4 NOT NULL,
	name_event varchar(50) NOT NULL, -- tên sk
	staff_id int2 NOT NULL, -- nv tạo sk
	"content" varchar(500) NULL, -- nội dung sk
	note varchar(500) NULL,
	start_time timestamp NOT NULL, -- time bắt đầu sk
	end_time timestamp NOT NULL, -- time kết thúc sk
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT event_ads_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_event_ads" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.event_ads IS 'tên sự kiện chạy quảng cáo';

-- Column comments

COMMENT ON COLUMN public.event_ads.name_event IS 'tên sk';
COMMENT ON COLUMN public.event_ads.staff_id IS 'nv tạo sk';
COMMENT ON COLUMN public.event_ads."content" IS 'nội dung sk';
COMMENT ON COLUMN public.event_ads.start_time IS 'time bắt đầu sk';
COMMENT ON COLUMN public.event_ads.end_time IS 'time kết thúc sk';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.event_ads for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.event_ads OWNER TO postgres;
GRANT ALL ON TABLE public.event_ads TO postgres;


-- public.giftcode definition

-- Drop table

-- DROP TABLE public.giftcode;

CREATE TABLE public.giftcode (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên sk chạy code
	event_ads_id int2 NOT NULL, -- chạy theo sự sk ads nào
	staff_id int2 NOT NULL, -- nv tạo
	"content" varchar(500) NULL, -- nội dung
	img varchar(200) NULL,
	discount varchar(50) NOT NULL, -- số giảm giá (% hoặc trực tiêp tiền)
	start_time timestamp NOT NULL, -- thời gian bắt đầu
	end_time timestamp NOT NULL, -- thời gian kết thúc
	number_of_participants int2 NOT NULL, -- số lượt dùng
	used int2 NOT NULL, -- số lượt đã đc sử dụng
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT giftcode_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_giftcode" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_giftcode" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.giftcode IS 'tên các sự kiện chạy mã code';

-- Column comments

COMMENT ON COLUMN public.giftcode."name" IS 'tên sk chạy code';
COMMENT ON COLUMN public.giftcode.event_ads_id IS 'chạy theo sự sk ads nào';
COMMENT ON COLUMN public.giftcode.staff_id IS 'nv tạo';
COMMENT ON COLUMN public.giftcode."content" IS 'nội dung';
COMMENT ON COLUMN public.giftcode.discount IS 'số giảm giá (% hoặc trực tiêp tiền)';
COMMENT ON COLUMN public.giftcode.start_time IS 'thời gian bắt đầu';
COMMENT ON COLUMN public.giftcode.end_time IS 'thời gian kết thúc';
COMMENT ON COLUMN public.giftcode.number_of_participants IS 'số lượt dùng';
COMMENT ON COLUMN public.giftcode.used IS 'số lượt đã đc sử dụng';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.giftcode for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.giftcode OWNER TO postgres;
GRANT ALL ON TABLE public.giftcode TO postgres;


-- public.history_payment definition

-- Drop table

-- DROP TABLE public.history_payment;

CREATE TABLE public.history_payment (
	id serial4 NOT NULL,
	payment_method_id int2 NOT NULL, -- phương thức thanh toán
	customers_id int2 NOT NULL, -- mã kh
	transfer_amount int4 NOT NULL DEFAULT 0, -- tiền chuyển khoản
	cash_amount int4 NOT NULL DEFAULT 0, -- tiền mặt
	note varchar(200) NULL,
	bill_id int2 NOT NULL, -- theo hoa đơn id
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT history_payment_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_history_payment" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_history_payment" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_history_payment" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.history_payment IS 'lịch sử thanh toán';

-- Column comments

COMMENT ON COLUMN public.history_payment.payment_method_id IS 'phương thức thanh toán';
COMMENT ON COLUMN public.history_payment.customers_id IS 'mã kh';
COMMENT ON COLUMN public.history_payment.transfer_amount IS 'tiền chuyển khoản';
COMMENT ON COLUMN public.history_payment.cash_amount IS 'tiền mặt';
COMMENT ON COLUMN public.history_payment.bill_id IS 'theo hoa đơn id';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.history_payment for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.history_payment OWNER TO postgres;
GRANT ALL ON TABLE public.history_payment TO postgres;


-- public.list_codes_received definition

-- Drop table

-- DROP TABLE public.list_codes_received;

CREATE TABLE public.list_codes_received (
	id serial4 NOT NULL,
	customers_id int2 NOT NULL, -- mã kh
	giftcode_id int2 NOT NULL, -- mã code
	is_expired bool NULL DEFAULT true, -- đã dc sử dung
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "FK1_list_codes_received" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_list_codes_received" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.list_codes_received IS 'ds kh nhận dc những code';

-- Column comments

COMMENT ON COLUMN public.list_codes_received.customers_id IS 'mã kh';
COMMENT ON COLUMN public.list_codes_received.giftcode_id IS 'mã code';
COMMENT ON COLUMN public.list_codes_received.is_expired IS 'đã dc sử dung';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.list_codes_received for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.list_codes_received OWNER TO postgres;
GRANT ALL ON TABLE public.list_codes_received TO postgres;


-- public.list_giftcodes definition

-- Drop table

-- DROP TABLE public.list_giftcodes;

CREATE TABLE public.list_giftcodes (
	id serial4 NOT NULL,
	giftcode_id int2 NOT NULL, -- thuộc sk code nào
	code varchar(20) NOT NULL, -- mã code
	already_received bool NULL DEFAULT false, -- đã có người nhận hay chưa
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT list_giftcodes_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_list_giftcodes" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE
);

-- Column comments

COMMENT ON COLUMN public.list_giftcodes.giftcode_id IS 'thuộc sk code nào';
COMMENT ON COLUMN public.list_giftcodes.code IS 'mã code';
COMMENT ON COLUMN public.list_giftcodes.already_received IS 'đã có người nhận hay chưa';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.list_giftcodes for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.list_giftcodes OWNER TO postgres;
GRANT ALL ON TABLE public.list_giftcodes TO postgres;


-- public.news definition

-- Drop table

-- DROP TABLE public.news;

CREATE TABLE public.news (
	id serial4 NOT NULL,
	name_news varchar(50) NOT NULL, -- tên tin
	sub_menu_id int2 NOT NULL, -- thuộc tin tức nào
	staff_id int2 NOT NULL, -- nhân viên đnăg
	img_main varchar(200) NOT NULL,
	"content" text NOT NULL,
	tag varchar(100) NOT NULL,
	"views" int2 NULL DEFAULT 0, -- lượt xem
	likes int2 NULL DEFAULT 0, -- số like
	"comments" int2 NULL DEFAULT 0, -- lượt comment
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT news_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_news" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_news" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.news IS 'tin tức';

-- Column comments

COMMENT ON COLUMN public.news.name_news IS 'tên tin';
COMMENT ON COLUMN public.news.sub_menu_id IS 'thuộc tin tức nào';
COMMENT ON COLUMN public.news.staff_id IS 'nhân viên đnăg';
COMMENT ON COLUMN public.news."views" IS 'lượt xem';
COMMENT ON COLUMN public.news.likes IS 'số like';
COMMENT ON COLUMN public.news."comments" IS 'lượt comment';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.news for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.news OWNER TO postgres;
GRANT ALL ON TABLE public.news TO postgres;


-- public."policy" definition

-- Drop table

-- DROP TABLE public."policy";

CREATE TABLE public."policy" (
	id serial4 NOT NULL,
	staff_id int2 NOT NULL, -- nv tạo dịch vụ
	"name" varchar(50) NOT NULL, -- tên dv
	img varchar(200) NOT NULL,
	"content" varchar(500) NOT NULL, -- nội dung quyền
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT policy_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_policy" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public."policy" IS 'tên các dịch vụ , đặc quyền  cho sản phẩm';

-- Column comments

COMMENT ON COLUMN public."policy".staff_id IS 'nv tạo dịch vụ';
COMMENT ON COLUMN public."policy"."name" IS 'tên dv';
COMMENT ON COLUMN public."policy"."content" IS 'nội dung quyền';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.policy for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public."policy" OWNER TO postgres;
GRANT ALL ON TABLE public."policy" TO postgres;


-- public.products definition

-- Drop table

-- DROP TABLE public.products;

CREATE TABLE public.products (
	id serial4 NOT NULL,
	sub_menu_id int2 NOT NULL, -- thuộc submenu nào
	code_products varchar(50) NOT NULL, -- mã sp
	"name" varchar(50) NOT NULL, -- tên sp
	img_main varchar(50) NOT NULL,
	origin varchar(50) NOT NULL, -- nguồn gôc sp
	color _varchar NOT NULL, -- màu sắc sp
	"size" _varchar NOT NULL, -- các cỡ sp
	into_money int4 NOT NULL, -- tiền cho sp
	vote float8 NULL DEFAULT '0'::double precision, -- lượt vote
	intro varchar(500) NOT NULL,
	number_of_products_sold int4 NOT NULL, -- số lượng sản phẩm bán dc
	remaining_products int4 NOT NULL, -- sản phẩm còn lại
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	is_promotion bool NULL, -- đang trong chương trình giảm giá ko
	CONSTRAINT products_code_products_key UNIQUE (code_products),
	CONSTRAINT products_name_key UNIQUE (name),
	CONSTRAINT products_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_products" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.products IS 'ds sp';

-- Column comments

COMMENT ON COLUMN public.products.sub_menu_id IS 'thuộc submenu nào';
COMMENT ON COLUMN public.products.code_products IS 'mã sp';
COMMENT ON COLUMN public.products."name" IS 'tên sp';
COMMENT ON COLUMN public.products.origin IS 'nguồn gôc sp';
COMMENT ON COLUMN public.products.color IS 'màu sắc sp';
COMMENT ON COLUMN public.products."size" IS 'các cỡ sp';
COMMENT ON COLUMN public.products.into_money IS 'tiền cho sp';
COMMENT ON COLUMN public.products.vote IS 'lượt vote';
COMMENT ON COLUMN public.products.number_of_products_sold IS 'số lượng sản phẩm bán dc';
COMMENT ON COLUMN public.products.remaining_products IS 'sản phẩm còn lại';
COMMENT ON COLUMN public.products.is_promotion IS 'đang trong chương trình giảm giá ko';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.products for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.products OWNER TO postgres;
GRANT ALL ON TABLE public.products TO postgres;


-- public.products_in_stock definition

-- Drop table

-- DROP TABLE public.products_in_stock;

CREATE TABLE public.products_in_stock (
	id serial4 NOT NULL,
	product_id int2 NOT NULL, -- tên sp
	warehouse_id int2 NOT NULL, -- thuộc kho
	remaining int2 NOT NULL, -- số sản phẩm còn
	import_price int4 NOT NULL, -- giá nhập
	export_price int4 NOT NULL, -- giá bán
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT products_in_stock_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_products_in_stock" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_products_in_stock" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.products_in_stock IS 'sản phẩmtrong kho';

-- Column comments

COMMENT ON COLUMN public.products_in_stock.product_id IS 'tên sp';
COMMENT ON COLUMN public.products_in_stock.warehouse_id IS 'thuộc kho';
COMMENT ON COLUMN public.products_in_stock.remaining IS 'số sản phẩm còn';
COMMENT ON COLUMN public.products_in_stock.import_price IS 'giá nhập';
COMMENT ON COLUMN public.products_in_stock.export_price IS 'giá bán';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.products_in_stock for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.products_in_stock OWNER TO postgres;
GRANT ALL ON TABLE public.products_in_stock TO postgres;


-- public.promotion definition

-- Drop table

-- DROP TABLE public.promotion;

CREATE TABLE public.promotion (
	id serial4 NOT NULL,
	product_id int2 NOT NULL, -- sản phẩm dc dùng
	type_promotion_id int2 NOT NULL, -- loại km
	endtime date NOT NULL, -- thời gian kết thúc
	starttime date NOT NULL, -- thời gian bắt đầu
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT promotion_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_promotion" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_promotion" FOREIGN KEY (type_promotion_id) REFERENCES public.type_promotion(id)
);
COMMENT ON TABLE public.promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';

-- Column comments

COMMENT ON COLUMN public.promotion.product_id IS 'sản phẩm dc dùng';
COMMENT ON COLUMN public.promotion.type_promotion_id IS 'loại km';
COMMENT ON COLUMN public.promotion.endtime IS 'thời gian kết thúc';
COMMENT ON COLUMN public.promotion.starttime IS 'thời gian bắt đầu';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.promotion for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.promotion OWNER TO postgres;
GRANT ALL ON TABLE public.promotion TO postgres;


-- public.reports definition

-- Drop table

-- DROP TABLE public.reports;

CREATE TABLE public.reports (
	id serial4 NOT NULL,
	customers_id int2 NOT NULL, -- kh tố
	staff_id int2 NOT NULL, -- nhân viên nhận vào phản hồi
	sub_report int2 NOT NULL, -- là sub reporrt ko
	type_report_id int2 NOT NULL, -- loại tố cáo
	is_processed bool NULL DEFAULT false, -- đã dc giải quyêt xong chưa
	report_source_id int2 NOT NULL, -- mã nguồn tố cáo
	"content" varchar(1000) NOT NULL, -- nội dung kh
	feed_back_content varchar(1000) NULL, -- nội dung nv
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	sub bool NULL DEFAULT false, -- có phải là fback con ko
	CONSTRAINT reports_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_reports" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_reports" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_reports" FOREIGN KEY (sub_report) REFERENCES public.reports(id) ON UPDATE CASCADE,
	CONSTRAINT "FK4_reports" FOREIGN KEY (type_report_id) REFERENCES public.type_report(id) ON UPDATE CASCADE,
	CONSTRAINT "FK5_reports" FOREIGN KEY (report_source_id) REFERENCES public.report_source(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.reports IS 'các phiếu tố cáo';

-- Column comments

COMMENT ON COLUMN public.reports.customers_id IS 'kh tố';
COMMENT ON COLUMN public.reports.staff_id IS 'nhân viên nhận vào phản hồi';
COMMENT ON COLUMN public.reports.sub_report IS 'là sub reporrt ko';
COMMENT ON COLUMN public.reports.type_report_id IS 'loại tố cáo';
COMMENT ON COLUMN public.reports.is_processed IS 'đã dc giải quyêt xong chưa';
COMMENT ON COLUMN public.reports.report_source_id IS 'mã nguồn tố cáo';
COMMENT ON COLUMN public.reports."content" IS 'nội dung kh';
COMMENT ON COLUMN public.reports.feed_back_content IS 'nội dung nv';
COMMENT ON COLUMN public.reports.sub IS 'có phải là fback con ko';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.reports for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.reports OWNER TO postgres;
GRANT ALL ON TABLE public.reports TO postgres;


-- public.service_by_product definition

-- Drop table

-- DROP TABLE public.service_by_product;

CREATE TABLE public.service_by_product (
	id serial4 NOT NULL,
	product_id int2 NOT NULL, -- tên sp
	policy_id int2 NOT NULL, -- tên dv
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT service_by_product_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_service_by_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_service_by_product" FOREIGN KEY (policy_id) REFERENCES public."policy"(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.service_by_product IS 'các sản phảm được hưởng các dịch vụ';

-- Column comments

COMMENT ON COLUMN public.service_by_product.product_id IS 'tên sp';
COMMENT ON COLUMN public.service_by_product.policy_id IS 'tên dv';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.service_by_product for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.service_by_product OWNER TO postgres;
GRANT ALL ON TABLE public.service_by_product TO postgres;


-- public.ads definition

-- Drop table

-- DROP TABLE public.ads;

CREATE TABLE public.ads (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL, -- tên quảng cáo
	event_ads_id int2 NOT NULL, -- id sự kiện đang chạy
	staff_id int2 NOT NULL, -- mã nhân viên
	sub_menu_id int2 NOT NULL, -- thuộc sub menu nào
	img varchar(200) NOT NULL,
	"content" varchar(500) NULL,
	priority int4 NULL, -- vị trí ưu tiên
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT ads_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_ads" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_ads" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.ads IS 'quảng cáo';

-- Column comments

COMMENT ON COLUMN public.ads."name" IS 'tên quảng cáo';
COMMENT ON COLUMN public.ads.event_ads_id IS 'id sự kiện đang chạy';
COMMENT ON COLUMN public.ads.staff_id IS 'mã nhân viên';
COMMENT ON COLUMN public.ads.sub_menu_id IS 'thuộc sub menu nào';
COMMENT ON COLUMN public.ads.priority IS 'vị trí ưu tiên';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.ads for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.ads OWNER TO postgres;
GRANT ALL ON TABLE public.ads TO postgres;


-- public.comments_news definition

-- Drop table

-- DROP TABLE public.comments_news;

CREATE TABLE public.comments_news (
	id serial4 NOT NULL,
	news_id int2 NOT NULL, -- thuộc tin tức nào  lấy theo id tin tức
	customers_id int2 NOT NULL, -- id kh bình luận
	comment_id int2 NOT NULL, -- thuộc id của bình luận nào¶nếu = id chính nó thì là comment_main¶nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)
	"comment" varchar(500) NOT NULL, -- nội dung bình luận
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comments_news_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_comments_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_comments_news" FOREIGN KEY (comment_id) REFERENCES public.comments_news(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_comments_news" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.comments_news IS 'bình luận tin tức';

-- Column comments

COMMENT ON COLUMN public.comments_news.news_id IS 'thuộc tin tức nào  lấy theo id tin tức';
COMMENT ON COLUMN public.comments_news.customers_id IS 'id kh bình luận';
COMMENT ON COLUMN public.comments_news.comment_id IS 'thuộc id của bình luận nào
nếu = id chính nó thì là comment_main
nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)';
COMMENT ON COLUMN public.comments_news."comment" IS 'nội dung bình luận';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.comments_news for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.comments_news OWNER TO postgres;
GRANT ALL ON TABLE public.comments_news TO postgres;


-- public.comments_product definition

-- Drop table

-- DROP TABLE public.comments_product;

CREATE TABLE public.comments_product (
	id serial4 NOT NULL,
	product_id int2 NOT NULL, -- id sản phẩm
	customers_id int2 NOT NULL, -- id kh bình luận
	comments_product_id int2 NOT NULL, -- thuộc id của bình luận nào
	vote int2 NULL DEFAULT 5, -- điểm vote cho sp
	"comment" varchar(500) NOT NULL, -- nội dung bl
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT comments_product_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_comment_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_comment_product" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_comment_product" FOREIGN KEY (comments_product_id) REFERENCES public.comments_product(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.comments_product IS 'bình luận về sản phẩm';

-- Column comments

COMMENT ON COLUMN public.comments_product.product_id IS 'id sản phẩm';
COMMENT ON COLUMN public.comments_product.customers_id IS 'id kh bình luận';
COMMENT ON COLUMN public.comments_product.comments_product_id IS 'thuộc id của bình luận nào';
COMMENT ON COLUMN public.comments_product.vote IS 'điểm vote cho sp';
COMMENT ON COLUMN public.comments_product."comment" IS 'nội dung bl';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.comments_product for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.comments_product OWNER TO postgres;
GRANT ALL ON TABLE public.comments_product TO postgres;


-- public.depot_ticket definition

-- Drop table

-- DROP TABLE public.depot_ticket;

CREATE TABLE public.depot_ticket (
	id serial4 NOT NULL,
	code_ticket varchar(200) NOT NULL, -- mã phiếu
	ticket_id int2 NOT NULL, -- mã loại phiếu
	staff_id_export int2 NOT NULL, -- nv xuất
	staff_id_receive int2 NOT NULL, -- nv nhập
	product_id int2 NOT NULL, -- id sản phẩm
	product_number int4 NOT NULL, -- số lượng sp / nhập hoặc xuất
	total_money int4 NOT NULL, -- số tiền
	note varchar(500) NULL,
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT depot_ticket_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_depot_ticket" FOREIGN KEY (ticket_id) REFERENCES public.type_ticket(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_depot_ticket" FOREIGN KEY (staff_id_export) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK3_depot_ticket" FOREIGN KEY (staff_id_receive) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK4_depot_ticket" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE
);

-- Column comments

COMMENT ON COLUMN public.depot_ticket.code_ticket IS 'mã phiếu';
COMMENT ON COLUMN public.depot_ticket.ticket_id IS 'mã loại phiếu';
COMMENT ON COLUMN public.depot_ticket.staff_id_export IS 'nv xuất';
COMMENT ON COLUMN public.depot_ticket.staff_id_receive IS 'nv nhập';
COMMENT ON COLUMN public.depot_ticket.product_id IS 'id sản phẩm';
COMMENT ON COLUMN public.depot_ticket.product_number IS 'số lượng sp / nhập hoặc xuất';
COMMENT ON COLUMN public.depot_ticket.total_money IS 'số tiền';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.depot_ticket for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.depot_ticket OWNER TO postgres;
GRANT ALL ON TABLE public.depot_ticket TO postgres;


-- public.img_news definition

-- Drop table

-- DROP TABLE public.img_news;

CREATE TABLE public.img_news (
	id serial4 NOT NULL,
	name_img varchar(50) NOT NULL, -- tên ảnh
	news_id int2 NOT NULL, -- thuộc tin tức
	img varchar(200) NOT NULL,
	"location" int2 NOT NULL, -- vị trí
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT img_news_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_img_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE
);

-- Column comments

COMMENT ON COLUMN public.img_news.name_img IS 'tên ảnh';
COMMENT ON COLUMN public.img_news.news_id IS 'thuộc tin tức';
COMMENT ON COLUMN public.img_news."location" IS 'vị trí';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.img_news for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.img_news OWNER TO postgres;
GRANT ALL ON TABLE public.img_news TO postgres;


-- public.img_products definition

-- Drop table

-- DROP TABLE public.img_products;

CREATE TABLE public.img_products (
	id serial4 NOT NULL,
	product_id int2 NOT NULL, -- thuộc sản phẩm nào
	img varchar(200) NOT NULL, -- ảnh
	display_order int2 NOT NULL, -- ưu tiên hiển thị
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT img_products_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_img_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.img_products IS 'ảnh sản phảm';

-- Column comments

COMMENT ON COLUMN public.img_products.product_id IS 'thuộc sản phẩm nào';
COMMENT ON COLUMN public.img_products.img IS 'ảnh';
COMMENT ON COLUMN public.img_products.display_order IS 'ưu tiên hiển thị';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.img_products for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.img_products OWNER TO postgres;
GRANT ALL ON TABLE public.img_products TO postgres;


-- public.list_products_by_bill definition

-- Drop table

-- DROP TABLE public.list_products_by_bill;

CREATE TABLE public.list_products_by_bill (
	id serial4 NOT NULL,
	bill_id int2 NOT NULL, -- mã hóa đơn
	products_id int2 NOT NULL, -- mã sp
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	quantity int2 NULL, -- số lượng sản phẩm
	amount_of_money int4 NULL, -- số tiền của sản phẩm
	CONSTRAINT list_products_by_bill_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_list_products_by" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_list_products_by" FOREIGN KEY (products_id) REFERENCES public.products(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.list_products_by_bill IS 'ds sản phẩm  được mua theo hóa đơn';

-- Column comments

COMMENT ON COLUMN public.list_products_by_bill.bill_id IS 'mã hóa đơn';
COMMENT ON COLUMN public.list_products_by_bill.products_id IS 'mã sp';
COMMENT ON COLUMN public.list_products_by_bill.quantity IS 'số lượng sản phẩm';
COMMENT ON COLUMN public.list_products_by_bill.amount_of_money IS 'số tiền của sản phẩm';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.list_products_by_bill for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.list_products_by_bill OWNER TO postgres;
GRANT ALL ON TABLE public.list_products_by_bill TO postgres;


-- public.price_difference definition

-- Drop table

-- DROP TABLE public.price_difference;

CREATE TABLE public.price_difference (
	id serial4 NOT NULL,
	staff_id int2 NOT NULL, -- nhân viên tác động
	product_id int2 NOT NULL, -- sảm phẩm
	import_price int4 NOT NULL, -- số tiền nhập
	export_price int4 NOT NULL, -- bán ra
	status bool NULL DEFAULT true,
	created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT price_difference_pkey PRIMARY KEY (id),
	CONSTRAINT "FK1_price_difference" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE,
	CONSTRAINT "FK2_price_difference" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE
);
COMMENT ON TABLE public.price_difference IS 'bảng lưu sự chênh lệnh giá';

-- Column comments

COMMENT ON COLUMN public.price_difference.staff_id IS 'nhân viên tác động';
COMMENT ON COLUMN public.price_difference.product_id IS 'sảm phẩm';
COMMENT ON COLUMN public.price_difference.import_price IS 'số tiền nhập';
COMMENT ON COLUMN public.price_difference.export_price IS 'bán ra';

-- Table Triggers

create trigger update_table_updated_at before
update
    on
    public.price_difference for each row execute function update_updated_at();

-- Permissions

ALTER TABLE public.price_difference OWNER TO postgres;
GRANT ALL ON TABLE public.price_difference TO postgres;