PGDMP     
                    |            test    15.3    15.3 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18523    test    DATABASE        CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE test;
                postgres    false            E           1255    18524    update_updated_at()    FUNCTION     �   CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.update_updated_at();
       public          postgres    false            �            1259    18525    account_admin_action    TABLE     =  CREATE TABLE public.account_admin_action (
    id integer NOT NULL,
    administration_id smallint NOT NULL,
    action_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.account_admin_action;
       public         heap    postgres    false            �           0    0    TABLE account_admin_action    COMMENT     r   COMMENT ON TABLE public.account_admin_action IS 'bảng trung gian tài khoản được gắn cho các quyền';
          public          postgres    false    214            �           0    0 -   COLUMN account_admin_action.administration_id    COMMENT     R   COMMENT ON COLUMN public.account_admin_action.administration_id IS 'mã quyền';
          public          postgres    false    214            �           0    0 %   COLUMN account_admin_action.action_id    COMMENT     L   COMMENT ON COLUMN public.account_admin_action.action_id IS 'mã thao tác';
          public          postgres    false    214            �            1259    18531    account_admin_action_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_admin_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_admin_action_id_seq;
       public          postgres    false    214            �           0    0    account_admin_action_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_admin_action_id_seq OWNED BY public.account_admin_action.id;
          public          postgres    false    215            �            1259    18532    account_customers    TABLE     �  CREATE TABLE public.account_customers (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    remember_token character varying(100) NOT NULL,
    user_name character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.account_customers;
       public         heap    postgres    false            �           0    0    TABLE account_customers    COMMENT     J   COMMENT ON TABLE public.account_customers IS 'tài khoản khách hàng';
          public          postgres    false    216            �           0    0 %   COLUMN account_customers.customers_id    COMMENT     N   COMMENT ON COLUMN public.account_customers.customers_id IS 'id khách hàng';
          public          postgres    false    216            �           0    0 "   COLUMN account_customers.user_name    COMMENT     N   COMMENT ON COLUMN public.account_customers.user_name IS 'tên đăng nhập';
          public          postgres    false    216            �           0    0 !   COLUMN account_customers.password    COMMENT     G   COMMENT ON COLUMN public.account_customers.password IS 'mật khẩu';
          public          postgres    false    216            �            1259    18538    account_customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.account_customers_id_seq;
       public          postgres    false    216            �           0    0    account_customers_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.account_customers_id_seq OWNED BY public.account_customers.id;
          public          postgres    false    217            �            1259    18539    action    TABLE     ;  CREATE TABLE public.action (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.action;
       public         heap    postgres    false            �           0    0    TABLE action    COMMENT     `   COMMENT ON TABLE public.action IS 'tên các quyền như thêm , sửa , xóa các trường';
          public          postgres    false    218            �           0    0    COLUMN action.name    COMMENT     8   COMMENT ON COLUMN public.action.name IS 'tên quyền';
          public          postgres    false    218            �           0    0    COLUMN action.content    COMMENT     9   COMMENT ON COLUMN public.action.content IS 'nội dung';
          public          postgres    false    218            �            1259    18547    action_id_seq    SEQUENCE     �   CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.action_id_seq;
       public          postgres    false    218            �           0    0    action_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;
          public          postgres    false    219            �            1259    18548    administration    TABLE       CREATE TABLE public.administration (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.administration;
       public         heap    postgres    false            �           0    0    TABLE administration    COMMENT     K   COMMENT ON TABLE public.administration IS 'tên cấp độ tài khoản';
          public          postgres    false    220            �           0    0    COLUMN administration.name    COMMENT     8   COMMENT ON COLUMN public.administration.name IS 'tên';
          public          postgres    false    220            �            1259    18554    administration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.administration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.administration_id_seq;
       public          postgres    false    220            �           0    0    administration_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.administration_id_seq OWNED BY public.administration.id;
          public          postgres    false    221            �            1259    18555    admins_notification    TABLE     �  CREATE TABLE public.admins_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.admins_notification;
       public         heap    postgres    false            �           0    0    TABLE admins_notification    COMMENT     N   COMMENT ON TABLE public.admins_notification IS 'thông báo cho nhân viên';
          public          postgres    false    222            �           0    0 ,   COLUMN admins_notification.type_notification    COMMENT     X   COMMENT ON COLUMN public.admins_notification.type_notification IS 'loại thông báo';
          public          postgres    false    222            �           0    0 "   COLUMN admins_notification.content    COMMENT     R   COMMENT ON COLUMN public.admins_notification.content IS 'nội dung thông báo';
          public          postgres    false    222            �            1259    18564    admins_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.admins_notification_id_seq;
       public          postgres    false    222            �           0    0    admins_notification_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.admins_notification_id_seq OWNED BY public.admins_notification.id;
          public          postgres    false    223            �            1259    18565    ads    TABLE     �  CREATE TABLE public.ads (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_menu_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500),
    priority integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �           0    0 	   TABLE ads    COMMENT     /   COMMENT ON TABLE public.ads IS 'quảng cáo';
          public          postgres    false    224            �           0    0    COLUMN ads.name    COMMENT     :   COMMENT ON COLUMN public.ads.name IS 'tên quảng cáo';
          public          postgres    false    224            �           0    0    COLUMN ads.event_ads_id    COMMENT     L   COMMENT ON COLUMN public.ads.event_ads_id IS 'id sự kiện đang chạy';
          public          postgres    false    224            �           0    0    COLUMN ads.staff_id    COMMENT     <   COMMENT ON COLUMN public.ads.staff_id IS 'mã nhân viên';
          public          postgres    false    224            �           0    0    COLUMN ads.sub_menu_id    COMMENT     E   COMMENT ON COLUMN public.ads.sub_menu_id IS 'thuộc sub menu nào';
          public          postgres    false    224            �           0    0    COLUMN ads.priority    COMMENT     @   COMMENT ON COLUMN public.ads.priority IS 'vị trí ưu tiên';
          public          postgres    false    224            �            1259    18573 
   ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.ads_id_seq;
       public          postgres    false    224            �           0    0 
   ads_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;
          public          postgres    false    225            �            1259    18574    api_weather    TABLE     �  CREATE TABLE public.api_weather (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    latityde character varying(50) NOT NULL,
    content json NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.api_weather;
       public         heap    postgres    false            �           0    0    TABLE api_weather    COMMENT     B   COMMENT ON TABLE public.api_weather IS 'table api thời tiết';
          public          postgres    false    226            �           0    0    COLUMN api_weather.name    COMMENT     9   COMMENT ON COLUMN public.api_weather.name IS 'tên api';
          public          postgres    false    226            �           0    0    COLUMN api_weather.content    COMMENT     ?   COMMENT ON COLUMN public.api_weather.content IS 'thông tin ';
          public          postgres    false    226            �            1259    18582    api_weather_id_seq    SEQUENCE     �   CREATE SEQUENCE public.api_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.api_weather_id_seq;
       public          postgres    false    226            �           0    0    api_weather_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.api_weather_id_seq OWNED BY public.api_weather.id;
          public          postgres    false    227            �            1259    18583    bill    TABLE     u  CREATE TABLE public.bill (
    id integer NOT NULL,
    code_bill character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    payment_methods_id smallint NOT NULL,
    shipping_method_id smallint NOT NULL,
    transfer_providers_id smallint NOT NULL,
    total_products smallint NOT NULL,
    initial_amount integer NOT NULL,
    actual_amount integer NOT NULL,
    giftcode_id smallint,
    successful_payment boolean DEFAULT false,
    note character varying(500),
    impact_number smallint DEFAULT '0'::smallint,
    report_ship boolean DEFAULT false,
    queue_bill boolean DEFAULT true,
    note_report character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.bill;
       public         heap    postgres    false            �           0    0 
   TABLE bill    COMMENT     .   COMMENT ON TABLE public.bill IS 'hóa đơn';
          public          postgres    false    228            �           0    0    COLUMN bill.code_bill    COMMENT     J   COMMENT ON COLUMN public.bill.code_bill IS 'mã hóa đơn hiển thị';
          public          postgres    false    228            �           0    0    COLUMN bill.staff_id    COMMENT     K   COMMENT ON COLUMN public.bill.staff_id IS 'mã nhân viên tạo phiếu';
          public          postgres    false    228            �           0    0    COLUMN bill.customers_id    COMMENT     B   COMMENT ON COLUMN public.bill.customers_id IS 'phiếu của kh';
          public          postgres    false    228            �           0    0    COLUMN bill.branch_id    COMMENT     U   COMMENT ON COLUMN public.bill.branch_id IS 'phiệu được tạo ở chi  nhánh';
          public          postgres    false    228            �           0    0    COLUMN bill.payment_methods_id    COMMENT     W   COMMENT ON COLUMN public.bill.payment_methods_id IS 'mã phương thức thanh toán';
          public          postgres    false    228            �           0    0    COLUMN bill.shipping_method_id    COMMENT     X   COMMENT ON COLUMN public.bill.shipping_method_id IS 'mã phương thức nhận hàng';
          public          postgres    false    228            �           0    0 !   COLUMN bill.transfer_providers_id    COMMENT     �   COMMENT ON COLUMN public.bill.transfer_providers_id IS 'nếu chọn hình thức nhận hàng online
đây là cột mã nhà cung cấp dịch vụ vận chuyển';
          public          postgres    false    228            �           0    0    COLUMN bill.total_products    COMMENT     B   COMMENT ON COLUMN public.bill.total_products IS 'tổng số sp';
          public          postgres    false    228            �           0    0    COLUMN bill.initial_amount    COMMENT     J   COMMENT ON COLUMN public.bill.initial_amount IS 'số tiền ban đầu';
          public          postgres    false    228            �           0    0    COLUMN bill.actual_amount    COMMENT     J   COMMENT ON COLUMN public.bill.actual_amount IS 'số tiền thực tế';
          public          postgres    false    228            �           0    0    COLUMN bill.giftcode_id    COMMENT     C   COMMENT ON COLUMN public.bill.giftcode_id IS 'id mã giảm giá';
          public          postgres    false    228            �           0    0    COLUMN bill.successful_payment    COMMENT     J   COMMENT ON COLUMN public.bill.successful_payment IS 'đã thanh toán ?';
          public          postgres    false    228            �           0    0    COLUMN bill.impact_number    COMMENT     K   COMMENT ON COLUMN public.bill.impact_number IS 'số lần chỉnh sửa';
          public          postgres    false    228            �           0    0    COLUMN bill.report_ship    COMMENT     S   COMMENT ON COLUMN public.bill.report_ship IS 'đơn bị tố cáo , cảnh báo';
          public          postgres    false    228            �           0    0    COLUMN bill.queue_bill    COMMENT     ^   COMMENT ON COLUMN public.bill.queue_bill IS 'đơn đang ở hàng đợi chưa đc duyệt';
          public          postgres    false    228            �            1259    18595    bill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.bill_id_seq;
       public          postgres    false    228            �           0    0    bill_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.bill_id_seq OWNED BY public.bill.id;
          public          postgres    false    229            �            1259    18596    branch    TABLE     �  CREATE TABLE public.branch (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    working_time character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.branch;
       public         heap    postgres    false            �           0    0    TABLE branch    COMMENT     :   COMMENT ON TABLE public.branch IS 'tên các chi nhánh';
          public          postgres    false    230            �           0    0    COLUMN branch.name    COMMENT     ;   COMMENT ON COLUMN public.branch.name IS 'tên chi nhánh';
          public          postgres    false    230            �           0    0    COLUMN branch.address    COMMENT     ;   COMMENT ON COLUMN public.branch.address IS 'địa chỉ';
          public          postgres    false    230            �           0    0    COLUMN branch.manage    COMMENT     =   COMMENT ON COLUMN public.branch.manage IS 'tên quản lý';
          public          postgres    false    230            �           0    0    COLUMN branch.working_time    COMMENT     K   COMMENT ON COLUMN public.branch.working_time IS 'thời gian làm việc';
          public          postgres    false    230            �            1259    18604    branch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.branch_id_seq;
       public          postgres    false    230            �           0    0    branch_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;
          public          postgres    false    231            �            1259    18605    comments_news    TABLE     ~  CREATE TABLE public.comments_news (
    id integer NOT NULL,
    news_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comment_id smallint NOT NULL,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.comments_news;
       public         heap    postgres    false            �           0    0    TABLE comments_news    COMMENT     C   COMMENT ON TABLE public.comments_news IS 'bình luận tin tức';
          public          postgres    false    232            �           0    0    COLUMN comments_news.news_id    COMMENT     e   COMMENT ON COLUMN public.comments_news.news_id IS 'thuộc tin tức nào  lấy theo id tin tức';
          public          postgres    false    232            �           0    0 !   COLUMN comments_news.customers_id    COMMENT     M   COMMENT ON COLUMN public.comments_news.customers_id IS 'id kh bình luận';
          public          postgres    false    232            �           0    0    COLUMN comments_news.comment_id    COMMENT     �   COMMENT ON COLUMN public.comments_news.comment_id IS 'thuộc id của bình luận nào
nếu = id chính nó thì là comment_main
nếu !=id chính nó thì nó là sub_comment (đang trả lời 1 comment khác)';
          public          postgres    false    232            �           0    0    COLUMN comments_news.comment    COMMENT     M   COMMENT ON COLUMN public.comments_news.comment IS 'nội dung bình luận';
          public          postgres    false    232            �            1259    18613    comments_news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.comments_news_id_seq;
       public          postgres    false    232            �           0    0    comments_news_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.comments_news_id_seq OWNED BY public.comments_news.id;
          public          postgres    false    233            �            1259    18614    comments_product    TABLE     �  CREATE TABLE public.comments_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    comments_product_id smallint NOT NULL,
    vote smallint DEFAULT 5,
    comment character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.comments_product;
       public         heap    postgres    false            �           0    0    TABLE comments_product    COMMENT     N   COMMENT ON TABLE public.comments_product IS 'bình luận về sản phẩm';
          public          postgres    false    234            �           0    0 "   COLUMN comments_product.product_id    COMMENT     K   COMMENT ON COLUMN public.comments_product.product_id IS 'id sản phẩm';
          public          postgres    false    234            �           0    0 $   COLUMN comments_product.customers_id    COMMENT     P   COMMENT ON COLUMN public.comments_product.customers_id IS 'id kh bình luận';
          public          postgres    false    234            �           0    0 +   COLUMN comments_product.comments_product_id    COMMENT     g   COMMENT ON COLUMN public.comments_product.comments_product_id IS 'thuộc id của bình luận nào';
          public          postgres    false    234            �           0    0    COLUMN comments_product.vote    COMMENT     I   COMMENT ON COLUMN public.comments_product.vote IS 'điểm vote cho sp';
          public          postgres    false    234            �           0    0    COLUMN comments_product.comment    COMMENT     F   COMMENT ON COLUMN public.comments_product.comment IS 'nội dung bl';
          public          postgres    false    234            �            1259    18623    comments_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_product_id_seq;
       public          postgres    false    234            �           0    0    comments_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.comments_product_id_seq OWNED BY public.comments_product.id;
          public          postgres    false    235            �            1259    18624    contact_support    TABLE     B  CREATE TABLE public.contact_support (
    id integer NOT NULL,
    logo character varying(200) NOT NULL,
    link character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.contact_support;
       public         heap    postgres    false            �           0    0    TABLE contact_support    COMMENT        COMMENT ON TABLE public.contact_support IS 'các tiện ích tích hợp ở góc phải màn hình : zalo , fb . chatonline';
          public          postgres    false    236            �            1259    18630    contact_support_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contact_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.contact_support_id_seq;
       public          postgres    false    236            �           0    0    contact_support_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.contact_support_id_seq OWNED BY public.contact_support.id;
          public          postgres    false    237            �            1259    18631 	   customers    TABLE     �  CREATE TABLE public.customers (
    id integer NOT NULL,
    rank_id smallint DEFAULT 0 NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(200) DEFAULT NULL::character varying,
    phone_number character varying[] NOT NULL,
    email character varying[] NOT NULL,
    birthday date,
    sex boolean,
    accumulated_points smallint DEFAULT '1'::smallint,
    number_ban smallint DEFAULT '0'::smallint,
    potential boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �           0    0    TABLE customers    COMMENT     .   COMMENT ON TABLE public.customers IS 'ds kh';
          public          postgres    false    238            �           0    0    COLUMN customers.rank_id    COMMENT     @   COMMENT ON COLUMN public.customers.rank_id IS 'cấp độ kh';
          public          postgres    false    238            �           0    0    COLUMN customers.first_name    COMMENT     9   COMMENT ON COLUMN public.customers.first_name IS 'tên';
          public          postgres    false    238            �           0    0    COLUMN customers.last_name    COMMENT     8   COMMENT ON COLUMN public.customers.last_name IS 'họ';
          public          postgres    false    238            �           0    0    COLUMN customers.address    COMMENT     >   COMMENT ON COLUMN public.customers.address IS 'địa chỉ';
          public          postgres    false    238            �           0    0    COLUMN customers.phone_number    COMMENT     K   COMMENT ON COLUMN public.customers.phone_number IS 'số điện thoại';
          public          postgres    false    238            �           0    0    COLUMN customers.email    COMMENT     5   COMMENT ON COLUMN public.customers.email IS 'email';
          public          postgres    false    238            �           0    0    COLUMN customers.birthday    COMMENT     =   COMMENT ON COLUMN public.customers.birthday IS 'sinh ngày';
          public          postgres    false    238            �           0    0    COLUMN customers.sex    COMMENT     J   COMMENT ON COLUMN public.customers.sex IS 'giới tính 0 : nữ 1: nam';
          public          postgres    false    238            �           0    0 #   COLUMN customers.accumulated_points    COMMENT     _   COMMENT ON COLUMN public.customers.accumulated_points IS 'số điểm tích để lên rank';
          public          postgres    false    238            �           0    0    COLUMN customers.number_ban    COMMENT     I   COMMENT ON COLUMN public.customers.number_ban IS 'số lần bị band';
          public          postgres    false    238            �           0    0    COLUMN customers.potential    COMMENT     �   COMMENT ON COLUMN public.customers.potential IS 'là kh tiềm năng hay ko , nếu là kh tiềm năng thì đồng nghĩa chưa mua hàng mà chỉ mới tạo tk';
          public          postgres    false    238            �            1259    18644    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    238            �           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    239            �            1259    18645    customers_notification    TABLE     �  CREATE TABLE public.customers_notification (
    id integer NOT NULL,
    type_notification smallint NOT NULL,
    customer_id smallint NOT NULL,
    content character varying(5000) NOT NULL,
    watched boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 *   DROP TABLE public.customers_notification;
       public         heap    postgres    false            �           0    0 /   COLUMN customers_notification.type_notification    COMMENT     [   COMMENT ON COLUMN public.customers_notification.type_notification IS 'loại thông báo';
          public          postgres    false    240            �           0    0 )   COLUMN customers_notification.customer_id    COMMENT     S   COMMENT ON COLUMN public.customers_notification.customer_id IS 'mã khách hàng';
          public          postgres    false    240            �            1259    18654    customers_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.customers_notification_id_seq;
       public          postgres    false    240            �           0    0    customers_notification_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.customers_notification_id_seq OWNED BY public.customers_notification.id;
          public          postgres    false    241            �            1259    18655    depot_ticket    TABLE       CREATE TABLE public.depot_ticket (
    id integer NOT NULL,
    code_ticket character varying(200) NOT NULL,
    ticket_id smallint NOT NULL,
    staff_id_export smallint NOT NULL,
    staff_id_receive smallint NOT NULL,
    product_id smallint NOT NULL,
    product_number integer NOT NULL,
    total_money integer NOT NULL,
    note character varying(500),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.depot_ticket;
       public         heap    postgres    false            �           0    0    COLUMN depot_ticket.code_ticket    COMMENT     D   COMMENT ON COLUMN public.depot_ticket.code_ticket IS 'mã phiếu';
          public          postgres    false    242            �           0    0    COLUMN depot_ticket.ticket_id    COMMENT     I   COMMENT ON COLUMN public.depot_ticket.ticket_id IS 'mã loại phiếu';
          public          postgres    false    242            �           0    0 #   COLUMN depot_ticket.staff_id_export    COMMENT     F   COMMENT ON COLUMN public.depot_ticket.staff_id_export IS 'nv xuất';
          public          postgres    false    242            �           0    0 $   COLUMN depot_ticket.staff_id_receive    COMMENT     G   COMMENT ON COLUMN public.depot_ticket.staff_id_receive IS 'nv nhập';
          public          postgres    false    242            �           0    0    COLUMN depot_ticket.product_id    COMMENT     G   COMMENT ON COLUMN public.depot_ticket.product_id IS 'id sản phẩm';
          public          postgres    false    242            �           0    0 "   COLUMN depot_ticket.product_number    COMMENT     c   COMMENT ON COLUMN public.depot_ticket.product_number IS 'số lượng sp / nhập hoặc xuất';
          public          postgres    false    242            �           0    0    COLUMN depot_ticket.total_money    COMMENT     D   COMMENT ON COLUMN public.depot_ticket.total_money IS 'số tiền';
          public          postgres    false    242            �            1259    18663    depot_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.depot_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.depot_ticket_id_seq;
       public          postgres    false    242            �           0    0    depot_ticket_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.depot_ticket_id_seq OWNED BY public.depot_ticket.id;
          public          postgres    false    243            �            1259    18664 	   event_ads    TABLE     �  CREATE TABLE public.event_ads (
    id integer NOT NULL,
    name_event character varying(50) NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    note character varying(500),
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.event_ads;
       public         heap    postgres    false            �           0    0    TABLE event_ads    COMMENT     M   COMMENT ON TABLE public.event_ads IS 'tên sự kiện chạy quảng cáo';
          public          postgres    false    244            �           0    0    COLUMN event_ads.name_event    COMMENT     <   COMMENT ON COLUMN public.event_ads.name_event IS 'tên sk';
          public          postgres    false    244            �           0    0    COLUMN event_ads.staff_id    COMMENT     >   COMMENT ON COLUMN public.event_ads.staff_id IS 'nv tạo sk';
          public          postgres    false    244            �           0    0    COLUMN event_ads.content    COMMENT     ?   COMMENT ON COLUMN public.event_ads.content IS 'nội dung sk';
          public          postgres    false    244            �           0    0    COLUMN event_ads.start_time    COMMENT     I   COMMENT ON COLUMN public.event_ads.start_time IS 'time bắt đầu sk';
          public          postgres    false    244            �           0    0    COLUMN event_ads.end_time    COMMENT     F   COMMENT ON COLUMN public.event_ads.end_time IS 'time kết thúc sk';
          public          postgres    false    244            �            1259    18672    event_ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.event_ads_id_seq;
       public          postgres    false    244            �           0    0    event_ads_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.event_ads_id_seq OWNED BY public.event_ads.id;
          public          postgres    false    245            �            1259    18673    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    18679    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    246            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    247            �            1259    18680    giftcode    TABLE     w  CREATE TABLE public.giftcode (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    event_ads_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    content character varying(500),
    img character varying(200),
    discount character varying(50) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    number_of_participants smallint NOT NULL,
    used smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.giftcode;
       public         heap    postgres    false            �           0    0    TABLE giftcode    COMMENT     M   COMMENT ON TABLE public.giftcode IS 'tên các sự kiện chạy mã code';
          public          postgres    false    248            �           0    0    COLUMN giftcode.name    COMMENT     A   COMMENT ON COLUMN public.giftcode.name IS 'tên sk chạy code';
          public          postgres    false    248            �           0    0    COLUMN giftcode.event_ads_id    COMMENT     R   COMMENT ON COLUMN public.giftcode.event_ads_id IS 'chạy theo sự sk ads nào';
          public          postgres    false    248            �           0    0    COLUMN giftcode.staff_id    COMMENT     :   COMMENT ON COLUMN public.giftcode.staff_id IS 'nv tạo';
          public          postgres    false    248            �           0    0    COLUMN giftcode.content    COMMENT     ;   COMMENT ON COLUMN public.giftcode.content IS 'nội dung';
          public          postgres    false    248            �           0    0    COLUMN giftcode.discount    COMMENT     a   COMMENT ON COLUMN public.giftcode.discount IS 'số giảm giá (% hoặc trực tiêp tiền)';
          public          postgres    false    248            �           0    0    COLUMN giftcode.start_time    COMMENT     L   COMMENT ON COLUMN public.giftcode.start_time IS 'thời gian bắt đầu';
          public          postgres    false    248            �           0    0    COLUMN giftcode.end_time    COMMENT     I   COMMENT ON COLUMN public.giftcode.end_time IS 'thời gian kết thúc';
          public          postgres    false    248            �           0    0 &   COLUMN giftcode.number_of_participants    COMMENT     R   COMMENT ON COLUMN public.giftcode.number_of_participants IS 'số lượt dùng';
          public          postgres    false    248            �           0    0    COLUMN giftcode.used    COMMENT     O   COMMENT ON COLUMN public.giftcode.used IS 'số lượt đã đc sử dụng';
          public          postgres    false    248            �            1259    18688    giftcode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.giftcode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.giftcode_id_seq;
       public          postgres    false    248            �           0    0    giftcode_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.giftcode_id_seq OWNED BY public.giftcode.id;
          public          postgres    false    249            �            1259    18689    history_payment    TABLE     �  CREATE TABLE public.history_payment (
    id integer NOT NULL,
    payment_method_id smallint NOT NULL,
    customers_id smallint NOT NULL,
    transfer_amount integer DEFAULT 0 NOT NULL,
    cash_amount integer DEFAULT 0 NOT NULL,
    note character varying(200),
    bill_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.history_payment;
       public         heap    postgres    false            �           0    0    TABLE history_payment    COMMENT     F   COMMENT ON TABLE public.history_payment IS 'lịch sử thanh toán';
          public          postgres    false    250            �           0    0 (   COLUMN history_payment.payment_method_id    COMMENT     ]   COMMENT ON COLUMN public.history_payment.payment_method_id IS 'phương thức thanh toán';
          public          postgres    false    250            �           0    0 #   COLUMN history_payment.customers_id    COMMENT     C   COMMENT ON COLUMN public.history_payment.customers_id IS 'mã kh';
          public          postgres    false    250            �           0    0 &   COLUMN history_payment.transfer_amount    COMMENT     W   COMMENT ON COLUMN public.history_payment.transfer_amount IS 'tiền chuyển khoản';
          public          postgres    false    250            �           0    0 "   COLUMN history_payment.cash_amount    COMMENT     H   COMMENT ON COLUMN public.history_payment.cash_amount IS 'tiền mặt';
          public          postgres    false    250            �           0    0    COLUMN history_payment.bill_id    COMMENT     I   COMMENT ON COLUMN public.history_payment.bill_id IS 'theo hoa đơn id';
          public          postgres    false    250            �            1259    18697    history_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.history_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.history_payment_id_seq;
       public          postgres    false    250            �           0    0    history_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.history_payment_id_seq OWNED BY public.history_payment.id;
          public          postgres    false    251            �            1259    18698    img_news    TABLE     |  CREATE TABLE public.img_news (
    id integer NOT NULL,
    name_img character varying(50) NOT NULL,
    news_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    location smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.img_news;
       public         heap    postgres    false            �           0    0    COLUMN img_news.name_img    COMMENT     <   COMMENT ON COLUMN public.img_news.name_img IS 'tên ảnh';
          public          postgres    false    252                        0    0    COLUMN img_news.news_id    COMMENT     B   COMMENT ON COLUMN public.img_news.news_id IS 'thuộc tin tức';
          public          postgres    false    252                       0    0    COLUMN img_news.location    COMMENT     ;   COMMENT ON COLUMN public.img_news.location IS 'vị trí';
          public          postgres    false    252            �            1259    18704    img_news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.img_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.img_news_id_seq;
       public          postgres    false    252                       0    0    img_news_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.img_news_id_seq OWNED BY public.img_news.id;
          public          postgres    false    253            �            1259    18705    img_products    TABLE     [  CREATE TABLE public.img_products (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    img character varying(200) NOT NULL,
    display_order smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.img_products;
       public         heap    postgres    false                       0    0    TABLE img_products    COMMENT     >   COMMENT ON TABLE public.img_products IS 'ảnh sản phảm';
          public          postgres    false    254                       0    0    COLUMN img_products.product_id    COMMENT     Q   COMMENT ON COLUMN public.img_products.product_id IS 'thuộc sản phẩm nào';
          public          postgres    false    254                       0    0    COLUMN img_products.img    COMMENT     6   COMMENT ON COLUMN public.img_products.img IS 'ảnh';
          public          postgres    false    254                       0    0 !   COLUMN img_products.display_order    COMMENT     Q   COMMENT ON COLUMN public.img_products.display_order IS 'ưu tiên hiển thị';
          public          postgres    false    254            �            1259    18711    img_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.img_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.img_products_id_seq;
       public          postgres    false    254                       0    0    img_products_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.img_products_id_seq OWNED BY public.img_products.id;
          public          postgres    false    255                        1259    18712    intermediary_account_service    TABLE     ,  CREATE TABLE public.intermediary_account_service (
    id integer NOT NULL,
    servive_name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 0   DROP TABLE public.intermediary_account_service;
       public         heap    postgres    false                       0    0 "   TABLE intermediary_account_service    COMMENT     �   COMMENT ON TABLE public.intermediary_account_service IS 'tên các bên dịch vụ tài khoản thứ 3 : gg, git , zalo ,..';
          public          postgres    false    256            	           0    0 0   COLUMN intermediary_account_service.servive_name    COMMENT     Q   COMMENT ON COLUMN public.intermediary_account_service.servive_name IS 'tên dv';
          public          postgres    false    256                       1259    18718 #   intermediary_account_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.intermediary_account_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.intermediary_account_service_id_seq;
       public          postgres    false    256            
           0    0 #   intermediary_account_service_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.intermediary_account_service_id_seq OWNED BY public.intermediary_account_service.id;
          public          postgres    false    257                       1259    18719    list_codes_received    TABLE     ^  CREATE TABLE public.list_codes_received (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    giftcode_id smallint NOT NULL,
    is_expired boolean DEFAULT true,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.list_codes_received;
       public         heap    postgres    false                       0    0    TABLE list_codes_received    COMMENT     O   COMMENT ON TABLE public.list_codes_received IS 'ds kh nhận dc những code';
          public          postgres    false    258                       0    0 '   COLUMN list_codes_received.customers_id    COMMENT     G   COMMENT ON COLUMN public.list_codes_received.customers_id IS 'mã kh';
          public          postgres    false    258                       0    0 &   COLUMN list_codes_received.giftcode_id    COMMENT     H   COMMENT ON COLUMN public.list_codes_received.giftcode_id IS 'mã code';
          public          postgres    false    258                       0    0 %   COLUMN list_codes_received.is_expired    COMMENT     P   COMMENT ON COLUMN public.list_codes_received.is_expired IS 'đã dc sử dung';
          public          postgres    false    258                       1259    18726    list_codes_received_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_codes_received_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.list_codes_received_id_seq;
       public          postgres    false    258                       0    0    list_codes_received_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.list_codes_received_id_seq OWNED BY public.list_codes_received.id;
          public          postgres    false    259                       1259    18727    list_giftcodes    TABLE     e  CREATE TABLE public.list_giftcodes (
    id integer NOT NULL,
    giftcode_id smallint NOT NULL,
    code character varying(20) NOT NULL,
    already_received boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.list_giftcodes;
       public         heap    postgres    false                       0    0 !   COLUMN list_giftcodes.giftcode_id    COMMENT     O   COMMENT ON COLUMN public.list_giftcodes.giftcode_id IS 'thuộc sk code nào';
          public          postgres    false    260                       0    0    COLUMN list_giftcodes.code    COMMENT     <   COMMENT ON COLUMN public.list_giftcodes.code IS 'mã code';
          public          postgres    false    260                       0    0 &   COLUMN list_giftcodes.already_received    COMMENT     b   COMMENT ON COLUMN public.list_giftcodes.already_received IS 'đã có người nhận hay chưa';
          public          postgres    false    260                       1259    18734    list_giftcodes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_giftcodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.list_giftcodes_id_seq;
       public          postgres    false    260                       0    0    list_giftcodes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.list_giftcodes_id_seq OWNED BY public.list_giftcodes.id;
          public          postgres    false    261                       1259    18735    list_products_by_bill    TABLE     j  CREATE TABLE public.list_products_by_bill (
    id integer NOT NULL,
    bill_id smallint NOT NULL,
    products_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    quantity smallint,
    amount_of_money integer
);
 )   DROP TABLE public.list_products_by_bill;
       public         heap    postgres    false                       0    0    TABLE list_products_by_bill    COMMENT     b   COMMENT ON TABLE public.list_products_by_bill IS 'ds sản phẩm  được mua theo hóa đơn';
          public          postgres    false    262                       0    0 $   COLUMN list_products_by_bill.bill_id    COMMENT     L   COMMENT ON COLUMN public.list_products_by_bill.bill_id IS 'mã hóa đơn';
          public          postgres    false    262                       0    0 (   COLUMN list_products_by_bill.products_id    COMMENT     H   COMMENT ON COLUMN public.list_products_by_bill.products_id IS 'mã sp';
          public          postgres    false    262                       0    0 %   COLUMN list_products_by_bill.quantity    COMMENT     Y   COMMENT ON COLUMN public.list_products_by_bill.quantity IS 'số lượng sản phẩm';
          public          postgres    false    262                       0    0 ,   COLUMN list_products_by_bill.amount_of_money    COMMENT     d   COMMENT ON COLUMN public.list_products_by_bill.amount_of_money IS 'số tiền của sản phẩm';
          public          postgres    false    262                       1259    18741    list_products_by_bill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_products_by_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.list_products_by_bill_id_seq;
       public          postgres    false    262                       0    0    list_products_by_bill_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.list_products_by_bill_id_seq OWNED BY public.list_products_by_bill.id;
          public          postgres    false    263                       1259    18742    log_deletes    TABLE     a  CREATE TABLE public.log_deletes (
    id integer NOT NULL,
    type_delete_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.log_deletes;
       public         heap    postgres    false                       0    0    TABLE log_deletes    COMMENT     ;   COMMENT ON TABLE public.log_deletes IS 'lịch sử xóa';
          public          postgres    false    264                       0    0 !   COLUMN log_deletes.type_delete_id    COMMENT     F   COMMENT ON COLUMN public.log_deletes.type_delete_id IS 'loại xóa';
          public          postgres    false    264                       0    0    COLUMN log_deletes.internal    COMMENT     N   COMMENT ON COLUMN public.log_deletes.internal IS 'thuộc nội bộ hay ko';
          public          postgres    false    264            	           1259    18749    log_deletes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_deletes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.log_deletes_id_seq;
       public          postgres    false    264                       0    0    log_deletes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.log_deletes_id_seq OWNED BY public.log_deletes.id;
          public          postgres    false    265            
           1259    18750 	   log_login    TABLE     �  CREATE TABLE public.log_login (
    id integer NOT NULL,
    user_login character varying(50) NOT NULL,
    type smallint NOT NULL,
    content character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.log_login;
       public         heap    postgres    false                       1259    18756    log_login_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.log_login_id_seq;
       public          postgres    false    266                       0    0    log_login_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.log_login_id_seq OWNED BY public.log_login.id;
          public          postgres    false    267                       1259    18757    log_updates    TABLE     a  CREATE TABLE public.log_updates (
    id integer NOT NULL,
    type_update_id smallint NOT NULL,
    content character varying(200) NOT NULL,
    internal boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.log_updates;
       public         heap    postgres    false                       1259    18764    log_updates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_updates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.log_updates_id_seq;
       public          postgres    false    268                       0    0    log_updates_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.log_updates_id_seq OWNED BY public.log_updates.id;
          public          postgres    false    269                       1259    18765 	   menu_main    TABLE     Y  CREATE TABLE public.menu_main (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(50),
    is_sub_menu boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.menu_main;
       public         heap    postgres    false                        0    0    TABLE menu_main    COMMENT     4   COMMENT ON TABLE public.menu_main IS 'menu chính';
          public          postgres    false    270            !           0    0    COLUMN menu_main.is_sub_menu    COMMENT     E   COMMENT ON COLUMN public.menu_main.is_sub_menu IS 'có sub menu ko';
          public          postgres    false    270                       1259    18772    menu_main_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_main_id_seq;
       public          postgres    false    270            "           0    0    menu_main_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_main_id_seq OWNED BY public.menu_main.id;
          public          postgres    false    271                       1259    18773 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false                       1259    18776    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    272            #           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    273                       1259    18777    news    TABLE     #  CREATE TABLE public.news (
    id integer NOT NULL,
    name_news character varying(50) NOT NULL,
    sub_menu_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    img_main character varying(200) NOT NULL,
    content text NOT NULL,
    tag character varying(100) NOT NULL,
    views smallint DEFAULT 0,
    likes smallint DEFAULT 0,
    comments smallint DEFAULT 0,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.news;
       public         heap    postgres    false            $           0    0 
   TABLE news    COMMENT     -   COMMENT ON TABLE public.news IS 'tin tức';
          public          postgres    false    274            %           0    0    COLUMN news.name_news    COMMENT     7   COMMENT ON COLUMN public.news.name_news IS 'tên tin';
          public          postgres    false    274            &           0    0    COLUMN news.sub_menu_id    COMMENT     G   COMMENT ON COLUMN public.news.sub_menu_id IS 'thuộc tin tức nào';
          public          postgres    false    274            '           0    0    COLUMN news.staff_id    COMMENT     @   COMMENT ON COLUMN public.news.staff_id IS 'nhân viên đnăg';
          public          postgres    false    274            (           0    0    COLUMN news.views    COMMENT     6   COMMENT ON COLUMN public.news.views IS 'lượt xem';
          public          postgres    false    274            )           0    0    COLUMN news.likes    COMMENT     4   COMMENT ON COLUMN public.news.likes IS 'số like';
          public          postgres    false    274            *           0    0    COLUMN news.comments    COMMENT     =   COMMENT ON COLUMN public.news.comments IS 'lượt comment';
          public          postgres    false    274                       1259    18788    news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false    274            +           0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public          postgres    false    275                       1259    18789    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false                       1259    18794    payment_methods    TABLE       CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.payment_methods;
       public         heap    postgres    false            ,           0    0    TABLE payment_methods    COMMENT     T   COMMENT ON TABLE public.payment_methods IS 'tên các phương thức thanh toán';
          public          postgres    false    277                       1259    18800    payment_methods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_methods_id_seq;
       public          postgres    false    277            -           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;
          public          postgres    false    278                       1259    18801    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false                       1259    18806    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    279            .           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    280                       1259    18807    policy    TABLE     �  CREATE TABLE public.policy (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    img character varying(200) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.policy;
       public         heap    postgres    false            /           0    0    TABLE policy    COMMENT     ^   COMMENT ON TABLE public.policy IS 'tên các dịch vụ , đặc quyền  cho sản phẩm';
          public          postgres    false    281            0           0    0    COLUMN policy.staff_id    COMMENT     D   COMMENT ON COLUMN public.policy.staff_id IS 'nv tạo dịch vụ';
          public          postgres    false    281            1           0    0    COLUMN policy.name    COMMENT     3   COMMENT ON COLUMN public.policy.name IS 'tên dv';
          public          postgres    false    281            2           0    0    COLUMN policy.content    COMMENT     A   COMMENT ON COLUMN public.policy.content IS 'nội dung quyền';
          public          postgres    false    281                       1259    18815    policy_id_seq    SEQUENCE     �   CREATE SEQUENCE public.policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.policy_id_seq;
       public          postgres    false    281            3           0    0    policy_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.policy_id_seq OWNED BY public.policy.id;
          public          postgres    false    282                       1259    18816    position    TABLE     ?  CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."position";
       public         heap    postgres    false            4           0    0    TABLE "position"    COMMENT     A   COMMENT ON TABLE public."position" IS 'chức vụ nhân viên';
          public          postgres    false    283            5           0    0    COLUMN "position".name    COMMENT     4   COMMENT ON COLUMN public."position".name IS 'tên';
          public          postgres    false    283                       1259    18824    position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.position_id_seq;
       public          postgres    false    283            6           0    0    position_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;
          public          postgres    false    284                       1259    18825    price_difference    TABLE     w  CREATE TABLE public.price_difference (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    product_id smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.price_difference;
       public         heap    postgres    false            7           0    0    TABLE price_difference    COMMENT     S   COMMENT ON TABLE public.price_difference IS 'bảng lưu sự chênh lệnh giá';
          public          postgres    false    285            8           0    0     COLUMN price_difference.staff_id    COMMENT     R   COMMENT ON COLUMN public.price_difference.staff_id IS 'nhân viên tác động';
          public          postgres    false    285            9           0    0 "   COLUMN price_difference.product_id    COMMENT     H   COMMENT ON COLUMN public.price_difference.product_id IS 'sảm phẩm';
          public          postgres    false    285            :           0    0 $   COLUMN price_difference.import_price    COMMENT     P   COMMENT ON COLUMN public.price_difference.import_price IS 'số tiền nhập';
          public          postgres    false    285            ;           0    0 $   COLUMN price_difference.export_price    COMMENT     E   COMMENT ON COLUMN public.price_difference.export_price IS 'bán ra';
          public          postgres    false    285                       1259    18831    price_difference_id_seq    SEQUENCE     �   CREATE SEQUENCE public.price_difference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.price_difference_id_seq;
       public          postgres    false    285            <           0    0    price_difference_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.price_difference_id_seq OWNED BY public.price_difference.id;
          public          postgres    false    286                       1259    18832    products    TABLE       CREATE TABLE public.products (
    id integer NOT NULL,
    sub_menu_id smallint NOT NULL,
    code_products character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    img_main character varying(50) NOT NULL,
    origin character varying(50) NOT NULL,
    color character varying[] NOT NULL,
    size character varying[] NOT NULL,
    into_money integer NOT NULL,
    vote double precision DEFAULT '0'::double precision,
    intro character varying(500) NOT NULL,
    number_of_products_sold integer NOT NULL,
    remaining_products integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_promotion boolean
);
    DROP TABLE public.products;
       public         heap    postgres    false            =           0    0    TABLE products    COMMENT     -   COMMENT ON TABLE public.products IS 'ds sp';
          public          postgres    false    287            >           0    0    COLUMN products.sub_menu_id    COMMENT     I   COMMENT ON COLUMN public.products.sub_menu_id IS 'thuộc submenu nào';
          public          postgres    false    287            ?           0    0    COLUMN products.code_products    COMMENT     =   COMMENT ON COLUMN public.products.code_products IS 'mã sp';
          public          postgres    false    287            @           0    0    COLUMN products.name    COMMENT     5   COMMENT ON COLUMN public.products.name IS 'tên sp';
          public          postgres    false    287            A           0    0    COLUMN products.origin    COMMENT     ?   COMMENT ON COLUMN public.products.origin IS 'nguồn gôc sp';
          public          postgres    false    287            B           0    0    COLUMN products.color    COMMENT     <   COMMENT ON COLUMN public.products.color IS 'màu sắc sp';
          public          postgres    false    287            C           0    0    COLUMN products.size    COMMENT     :   COMMENT ON COLUMN public.products.size IS 'các cỡ sp';
          public          postgres    false    287            D           0    0    COLUMN products.into_money    COMMENT     A   COMMENT ON COLUMN public.products.into_money IS 'tiền cho sp';
          public          postgres    false    287            E           0    0    COLUMN products.vote    COMMENT     :   COMMENT ON COLUMN public.products.vote IS 'lượt vote';
          public          postgres    false    287            F           0    0 '   COLUMN products.number_of_products_sold    COMMENT     c   COMMENT ON COLUMN public.products.number_of_products_sold IS 'số lượng sản phẩm bán dc';
          public          postgres    false    287            G           0    0 "   COLUMN products.remaining_products    COMMENT     S   COMMENT ON COLUMN public.products.remaining_products IS 'sản phẩm còn lại';
          public          postgres    false    287            H           0    0    COLUMN products.is_promotion    COMMENT     `   COMMENT ON COLUMN public.products.is_promotion IS 'đang trong chương trình giảm giá ko';
          public          postgres    false    287                        1259    18841    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    287            I           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    288            !           1259    18842    products_in_stock    TABLE     �  CREATE TABLE public.products_in_stock (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    warehouse_id smallint NOT NULL,
    remaining smallint NOT NULL,
    import_price integer NOT NULL,
    export_price integer NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.products_in_stock;
       public         heap    postgres    false            J           0    0    TABLE products_in_stock    COMMENT     F   COMMENT ON TABLE public.products_in_stock IS 'sản phẩmtrong kho';
          public          postgres    false    289            K           0    0 #   COLUMN products_in_stock.product_id    COMMENT     D   COMMENT ON COLUMN public.products_in_stock.product_id IS 'tên sp';
          public          postgres    false    289            L           0    0 %   COLUMN products_in_stock.warehouse_id    COMMENT     J   COMMENT ON COLUMN public.products_in_stock.warehouse_id IS 'thuộc kho';
          public          postgres    false    289            M           0    0 "   COLUMN products_in_stock.remaining    COMMENT     R   COMMENT ON COLUMN public.products_in_stock.remaining IS 'số sản phẩm còn';
          public          postgres    false    289            N           0    0 %   COLUMN products_in_stock.import_price    COMMENT     J   COMMENT ON COLUMN public.products_in_stock.import_price IS 'giá nhập';
          public          postgres    false    289            O           0    0 %   COLUMN products_in_stock.export_price    COMMENT     H   COMMENT ON COLUMN public.products_in_stock.export_price IS 'giá bán';
          public          postgres    false    289            "           1259    18848    products_in_stock_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_in_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_in_stock_id_seq;
       public          postgres    false    289            P           0    0    products_in_stock_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_in_stock_id_seq OWNED BY public.products_in_stock.id;
          public          postgres    false    290            #           1259    18849 	   promotion    TABLE     k  CREATE TABLE public.promotion (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    type_promotion_id smallint NOT NULL,
    endtime date NOT NULL,
    starttime date NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.promotion;
       public         heap    postgres    false            Q           0    0    TABLE promotion    COMMENT     y   COMMENT ON TABLE public.promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';
          public          postgres    false    291            R           0    0    COLUMN promotion.product_id    COMMENT     J   COMMENT ON COLUMN public.promotion.product_id IS 'sản phẩm dc dùng';
          public          postgres    false    291            S           0    0 "   COLUMN promotion.type_promotion_id    COMMENT     E   COMMENT ON COLUMN public.promotion.type_promotion_id IS 'loại km';
          public          postgres    false    291            T           0    0    COLUMN promotion.endtime    COMMENT     I   COMMENT ON COLUMN public.promotion.endtime IS 'thời gian kết thúc';
          public          postgres    false    291            U           0    0    COLUMN promotion.starttime    COMMENT     L   COMMENT ON COLUMN public.promotion.starttime IS 'thời gian bắt đầu';
          public          postgres    false    291            $           1259    18855    promotion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.promotion_id_seq;
       public          postgres    false    291            V           0    0    promotion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;
          public          postgres    false    292            %           1259    18856    rank    TABLE     u  CREATE TABLE public.rank (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    detail character varying(200) NOT NULL,
    icon character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    score smallint
);
    DROP TABLE public.rank;
       public         heap    postgres    false            W           0    0 
   TABLE rank    COMMENT     8   COMMENT ON TABLE public.rank IS 'tên các cấp rank';
          public          postgres    false    293            X           0    0    COLUMN rank.name    COMMENT     .   COMMENT ON COLUMN public.rank.name IS 'tên';
          public          postgres    false    293            Y           0    0    COLUMN rank.detail    COMMENT     6   COMMENT ON COLUMN public.rank.detail IS 'chi tiết';
          public          postgres    false    293            Z           0    0    COLUMN rank.score    COMMENT     M   COMMENT ON COLUMN public.rank.score IS 'số điểm để lên cấp rank';
          public          postgres    false    293            &           1259    18862    rank_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.rank_id_seq;
       public          postgres    false    293            [           0    0    rank_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.rank_id_seq OWNED BY public.rank.id;
          public          postgres    false    294            '           1259    18863    report_source    TABLE     ?  CREATE TABLE public.report_source (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.report_source;
       public         heap    postgres    false            \           0    0    TABLE report_source    COMMENT     C   COMMENT ON TABLE public.report_source IS 'tên nguồn tố cáo';
          public          postgres    false    295            ]           0    0    COLUMN report_source.name    COMMENT     7   COMMENT ON COLUMN public.report_source.name IS 'tên';
          public          postgres    false    295            (           1259    18871    report_source_id_seq    SEQUENCE     �   CREATE SEQUENCE public.report_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.report_source_id_seq;
       public          postgres    false    295            ^           0    0    report_source_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.report_source_id_seq OWNED BY public.report_source.id;
          public          postgres    false    296            )           1259    18872    reports    TABLE     >  CREATE TABLE public.reports (
    id integer NOT NULL,
    customers_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    sub_report smallint NOT NULL,
    type_report_id smallint NOT NULL,
    is_processed boolean DEFAULT false,
    report_source_id smallint NOT NULL,
    content character varying(1000) NOT NULL,
    feed_back_content character varying(1000),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    sub boolean DEFAULT false
);
    DROP TABLE public.reports;
       public         heap    postgres    false            _           0    0    TABLE reports    COMMENT     =   COMMENT ON TABLE public.reports IS 'các phiếu tố cáo';
          public          postgres    false    297            `           0    0    COLUMN reports.customers_id    COMMENT     <   COMMENT ON COLUMN public.reports.customers_id IS 'kh tố';
          public          postgres    false    297            a           0    0    COLUMN reports.staff_id    COMMENT     U   COMMENT ON COLUMN public.reports.staff_id IS 'nhân viên nhận vào phản hồi';
          public          postgres    false    297            b           0    0    COLUMN reports.sub_report    COMMENT     E   COMMENT ON COLUMN public.reports.sub_report IS 'là sub reporrt ko';
          public          postgres    false    297            c           0    0    COLUMN reports.type_report_id    COMMENT     G   COMMENT ON COLUMN public.reports.type_report_id IS 'loại tố cáo';
          public          postgres    false    297            d           0    0    COLUMN reports.is_processed    COMMENT     U   COMMENT ON COLUMN public.reports.is_processed IS 'đã dc giải quyêt xong chưa';
          public          postgres    false    297            e           0    0    COLUMN reports.report_source_id    COMMENT     N   COMMENT ON COLUMN public.reports.report_source_id IS 'mã nguồn tố cáo';
          public          postgres    false    297            f           0    0    COLUMN reports.content    COMMENT     =   COMMENT ON COLUMN public.reports.content IS 'nội dung kh';
          public          postgres    false    297            g           0    0     COLUMN reports.feed_back_content    COMMENT     G   COMMENT ON COLUMN public.reports.feed_back_content IS 'nội dung nv';
          public          postgres    false    297            h           0    0    COLUMN reports.sub    COMMENT     G   COMMENT ON COLUMN public.reports.sub IS 'có phải là fback con ko';
          public          postgres    false    297            *           1259    18882    reports_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reports_id_seq;
       public          postgres    false    297            i           0    0    reports_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;
          public          postgres    false    298            +           1259    18883    service_by_product    TABLE     4  CREATE TABLE public.service_by_product (
    id integer NOT NULL,
    product_id smallint NOT NULL,
    policy_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 &   DROP TABLE public.service_by_product;
       public         heap    postgres    false            j           0    0    TABLE service_by_product    COMMENT     f   COMMENT ON TABLE public.service_by_product IS 'các sản phảm được hưởng các dịch vụ';
          public          postgres    false    299            k           0    0 $   COLUMN service_by_product.product_id    COMMENT     E   COMMENT ON COLUMN public.service_by_product.product_id IS 'tên sp';
          public          postgres    false    299            l           0    0 #   COLUMN service_by_product.policy_id    COMMENT     D   COMMENT ON COLUMN public.service_by_product.policy_id IS 'tên dv';
          public          postgres    false    299            ,           1259    18889    service_by_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_by_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.service_by_product_id_seq;
       public          postgres    false    299            m           0    0    service_by_product_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.service_by_product_id_seq OWNED BY public.service_by_product.id;
          public          postgres    false    300            -           1259    18890    shipping_method    TABLE       CREATE TABLE public.shipping_method (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.shipping_method;
       public         heap    postgres    false            n           0    0    TABLE shipping_method    COMMENT     �   COMMENT ON TABLE public.shipping_method IS 'tên các phương thức nhận hàng : ở cửa hàng , ở chi nhánh khác ,  giao hàng';
          public          postgres    false    301            .           1259    18896    shipping_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.shipping_method_id_seq;
       public          postgres    false    301            o           0    0    shipping_method_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;
          public          postgres    false    302            /           1259    18897    staff    TABLE     j  CREATE TABLE public.staff (
    id integer NOT NULL,
    code_staff character varying(50) NOT NULL,
    position_id smallint NOT NULL,
    branch_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(200) NOT NULL,
    phone_number character varying(50) NOT NULL,
    email character varying(50),
    birthday date,
    sex boolean,
    img character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    background character varying(200)
);
    DROP TABLE public.staff;
       public         heap    postgres    false            p           0    0    TABLE staff    COMMENT     3   COMMENT ON TABLE public.staff IS 'ds nhân viên';
          public          postgres    false    303            q           0    0    COLUMN staff.code_staff    COMMENT     K   COMMENT ON COLUMN public.staff.code_staff IS 'mã đinh danh nhân viên';
          public          postgres    false    303            r           0    0    COLUMN staff.position_id    COMMENT     @   COMMENT ON COLUMN public.staff.position_id IS 'id chức vụ';
          public          postgres    false    303            s           0    0    COLUMN staff.branch_id    COMMENT     =   COMMENT ON COLUMN public.staff.branch_id IS 'id chi nhánh';
          public          postgres    false    303            t           0    0    COLUMN staff.name    COMMENT     ;   COMMENT ON COLUMN public.staff.name IS 'tên nhân viên';
          public          postgres    false    303            u           0    0    COLUMN staff.address    COMMENT     F   COMMENT ON COLUMN public.staff.address IS 'địa chỉ nhân viên';
          public          postgres    false    303            v           0    0    COLUMN staff.phone_number    COMMENT     6   COMMENT ON COLUMN public.staff.phone_number IS 'sdt';
          public          postgres    false    303            w           0    0    COLUMN staff.sex    COMMENT     F   COMMENT ON COLUMN public.staff.sex IS 'giới tính 0 : nữ 1: nam';
          public          postgres    false    303            0           1259    18905    staff_account    TABLE     0  CREATE TABLE public.staff_account (
    id integer NOT NULL,
    staff_id smallint NOT NULL,
    administration_id smallint NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token boolean,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    refresh_token character varying(500),
    issued_at timestamp without time zone,
    expired_time timestamp without time zone
);
 !   DROP TABLE public.staff_account;
       public         heap    postgres    false            x           0    0    TABLE staff_account    COMMENT     ;   COMMENT ON TABLE public.staff_account IS 'tk nhân viên';
          public          postgres    false    304            y           0    0 "   COLUMN staff_account.refresh_token    COMMENT     N   COMMENT ON COLUMN public.staff_account.refresh_token IS 'mã refresh tonken';
          public          postgres    false    304            z           0    0    COLUMN staff_account.issued_at    COMMENT     O   COMMENT ON COLUMN public.staff_account.issued_at IS 'thời gian phát hành';
          public          postgres    false    304            {           0    0 !   COLUMN staff_account.expired_time    COMMENT     R   COMMENT ON COLUMN public.staff_account.expired_time IS 'thời gian hết hạn';
          public          postgres    false    304            1           1259    18913    staff_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.staff_account_id_seq;
       public          postgres    false    304            |           0    0    staff_account_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.staff_account_id_seq OWNED BY public.staff_account.id;
          public          postgres    false    305            2           1259    18914    staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          postgres    false    303            }           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          postgres    false    306            3           1259    18915    sub_menu    TABLE     }  CREATE TABLE public.sub_menu (
    id integer NOT NULL,
    menu_main_id smallint NOT NULL,
    name character varying(20) NOT NULL,
    color character varying(20) NOT NULL,
    sub boolean DEFAULT false,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sub_menu;
       public         heap    postgres    false            ~           0    0    TABLE sub_menu    COMMENT     2   COMMENT ON TABLE public.sub_menu IS 'ds submenu';
          public          postgres    false    307                       0    0    COLUMN sub_menu.menu_main_id    COMMENT     G   COMMENT ON COLUMN public.sub_menu.menu_main_id IS 'thuộc menu nào';
          public          postgres    false    307            4           1259    18922    sub_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sub_menu_id_seq;
       public          postgres    false    307            �           0    0    sub_menu_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sub_menu_id_seq OWNED BY public.sub_menu.id;
          public          postgres    false    308            5           1259    18923    transfer_providers    TABLE       CREATE TABLE public.transfer_providers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 &   DROP TABLE public.transfer_providers;
       public         heap    postgres    false            �           0    0    TABLE transfer_providers    COMMENT     e   COMMENT ON TABLE public.transfer_providers IS 'các nhà cung cấp dịch vụ thanh toán online';
          public          postgres    false    309            6           1259    18929    transfer_providers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transfer_providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.transfer_providers_id_seq;
       public          postgres    false    309            �           0    0    transfer_providers_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.transfer_providers_id_seq OWNED BY public.transfer_providers.id;
          public          postgres    false    310            7           1259    18930    type_notification    TABLE     �  CREATE TABLE public.type_notification (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    color character varying(20) DEFAULT '000000'::character varying
);
 %   DROP TABLE public.type_notification;
       public         heap    postgres    false            8           1259    18939    type_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.type_notification_id_seq;
       public          postgres    false    311            �           0    0    type_notification_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.type_notification_id_seq OWNED BY public.type_notification.id;
          public          postgres    false    312            9           1259    18940    type_promotion    TABLE     r  CREATE TABLE public.type_promotion (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying(200) NOT NULL,
    code_hide character varying(200) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.type_promotion;
       public         heap    postgres    false            �           0    0    TABLE type_promotion    COMMENT     ~   COMMENT ON TABLE public.type_promotion IS 'tên các loại khuyến mãi dành cho sp
vd : mua 1 tăng 1 , giảm 20% ,...';
          public          postgres    false    313            �           0    0    COLUMN type_promotion.name    COMMENT     ;   COMMENT ON COLUMN public.type_promotion.name IS 'tên kh';
          public          postgres    false    313            �           0    0    COLUMN type_promotion.content    COMMENT     D   COMMENT ON COLUMN public.type_promotion.content IS 'nội dung km';
          public          postgres    false    313            �           0    0    COLUMN type_promotion.code_hide    COMMENT     �   COMMENT ON COLUMN public.type_promotion.code_hide IS 'đây là code ẩn khi gắn mà chương trình sẽ tính ra luôn kq km';
          public          postgres    false    313            :           1259    18946    type_promotion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.type_promotion_id_seq;
       public          postgres    false    313            �           0    0    type_promotion_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.type_promotion_id_seq OWNED BY public.type_promotion.id;
          public          postgres    false    314            ;           1259    18947    type_report    TABLE     =  CREATE TABLE public.type_report (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.type_report;
       public         heap    postgres    false            �           0    0    TABLE type_report    COMMENT     ;   COMMENT ON TABLE public.type_report IS 'loại tố cáo';
          public          postgres    false    315            <           1259    18955    type_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.type_report_id_seq;
       public          postgres    false    315            �           0    0    type_report_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.type_report_id_seq OWNED BY public.type_report.id;
          public          postgres    false    316            =           1259    18956    type_ticket    TABLE     4  CREATE TABLE public.type_ticket (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(200),
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.type_ticket;
       public         heap    postgres    false            �           0    0    TABLE type_ticket    COMMENT     9   COMMENT ON TABLE public.type_ticket IS 'loại phiếu';
          public          postgres    false    317            >           1259    18962    type_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.type_ticket_id_seq;
       public          postgres    false    317            �           0    0    type_ticket_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.type_ticket_id_seq OWNED BY public.type_ticket.id;
          public          postgres    false    318            ?           1259    18963    type_update    TABLE     =  CREATE TABLE public.type_update (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    note character varying(500) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.type_update;
       public         heap    postgres    false            �           0    0    TABLE type_update    COMMENT     K   COMMENT ON TABLE public.type_update IS 'các loại update / xóa / ẩn';
          public          postgres    false    319            @           1259    18971    type_update_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.type_update_id_seq;
       public          postgres    false    319            �           0    0    type_update_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.type_update_id_seq OWNED BY public.type_update.id;
          public          postgres    false    320            A           1259    18972 	   warehouse    TABLE     �  CREATE TABLE public.warehouse (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    hotline character varying(50) NOT NULL,
    manage character varying(50) NOT NULL,
    branch_id smallint NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.warehouse;
       public         heap    postgres    false            �           0    0    TABLE warehouse    COMMENT     6   COMMENT ON TABLE public.warehouse IS 'tên các kho';
          public          postgres    false    321            �           0    0    COLUMN warehouse.branch_id    COMMENT     K   COMMENT ON COLUMN public.warehouse.branch_id IS 'thuộc chi nhánh nào';
          public          postgres    false    321            B           1259    18978    warehouse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.warehouse_id_seq;
       public          postgres    false    321            �           0    0    warehouse_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;
          public          postgres    false    322            C           1259    18979    websockets_statistics_entries    TABLE     [  CREATE TABLE public.websockets_statistics_entries (
    id integer NOT NULL,
    app_id character varying(255) NOT NULL,
    peak_connection_count integer NOT NULL,
    websocket_message_count integer NOT NULL,
    api_message_count integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 1   DROP TABLE public.websockets_statistics_entries;
       public         heap    postgres    false            D           1259    18982 $   websockets_statistics_entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.websockets_statistics_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.websockets_statistics_entries_id_seq;
       public          postgres    false    323            �           0    0 $   websockets_statistics_entries_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.websockets_statistics_entries_id_seq OWNED BY public.websockets_statistics_entries.id;
          public          postgres    false    324            x           2604    18983    account_admin_action id    DEFAULT     �   ALTER TABLE ONLY public.account_admin_action ALTER COLUMN id SET DEFAULT nextval('public.account_admin_action_id_seq'::regclass);
 F   ALTER TABLE public.account_admin_action ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            |           2604    18984    account_customers id    DEFAULT     |   ALTER TABLE ONLY public.account_customers ALTER COLUMN id SET DEFAULT nextval('public.account_customers_id_seq'::regclass);
 C   ALTER TABLE public.account_customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    18985 	   action id    DEFAULT     f   ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);
 8   ALTER TABLE public.action ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    18986    administration id    DEFAULT     v   ALTER TABLE ONLY public.administration ALTER COLUMN id SET DEFAULT nextval('public.administration_id_seq'::regclass);
 @   ALTER TABLE public.administration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    18987    admins_notification id    DEFAULT     �   ALTER TABLE ONLY public.admins_notification ALTER COLUMN id SET DEFAULT nextval('public.admins_notification_id_seq'::regclass);
 E   ALTER TABLE public.admins_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            �           2604    18988    ads id    DEFAULT     `   ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);
 5   ALTER TABLE public.ads ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    18989    api_weather id    DEFAULT     p   ALTER TABLE ONLY public.api_weather ALTER COLUMN id SET DEFAULT nextval('public.api_weather_id_seq'::regclass);
 =   ALTER TABLE public.api_weather ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            �           2604    18990    bill id    DEFAULT     b   ALTER TABLE ONLY public.bill ALTER COLUMN id SET DEFAULT nextval('public.bill_id_seq'::regclass);
 6   ALTER TABLE public.bill ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            �           2604    18991 	   branch id    DEFAULT     f   ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);
 8   ALTER TABLE public.branch ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            �           2604    18992    comments_news id    DEFAULT     t   ALTER TABLE ONLY public.comments_news ALTER COLUMN id SET DEFAULT nextval('public.comments_news_id_seq'::regclass);
 ?   ALTER TABLE public.comments_news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            �           2604    18993    comments_product id    DEFAULT     z   ALTER TABLE ONLY public.comments_product ALTER COLUMN id SET DEFAULT nextval('public.comments_product_id_seq'::regclass);
 B   ALTER TABLE public.comments_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            �           2604    18994    contact_support id    DEFAULT     x   ALTER TABLE ONLY public.contact_support ALTER COLUMN id SET DEFAULT nextval('public.contact_support_id_seq'::regclass);
 A   ALTER TABLE public.contact_support ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236            �           2604    18995    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238            �           2604    18996    customers_notification id    DEFAULT     �   ALTER TABLE ONLY public.customers_notification ALTER COLUMN id SET DEFAULT nextval('public.customers_notification_id_seq'::regclass);
 H   ALTER TABLE public.customers_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240            �           2604    18997    depot_ticket id    DEFAULT     r   ALTER TABLE ONLY public.depot_ticket ALTER COLUMN id SET DEFAULT nextval('public.depot_ticket_id_seq'::regclass);
 >   ALTER TABLE public.depot_ticket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242            �           2604    18998    event_ads id    DEFAULT     l   ALTER TABLE ONLY public.event_ads ALTER COLUMN id SET DEFAULT nextval('public.event_ads_id_seq'::regclass);
 ;   ALTER TABLE public.event_ads ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244            �           2604    18999    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246            �           2604    19000    giftcode id    DEFAULT     j   ALTER TABLE ONLY public.giftcode ALTER COLUMN id SET DEFAULT nextval('public.giftcode_id_seq'::regclass);
 :   ALTER TABLE public.giftcode ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248            �           2604    19001    history_payment id    DEFAULT     x   ALTER TABLE ONLY public.history_payment ALTER COLUMN id SET DEFAULT nextval('public.history_payment_id_seq'::regclass);
 A   ALTER TABLE public.history_payment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250            �           2604    19002    img_news id    DEFAULT     j   ALTER TABLE ONLY public.img_news ALTER COLUMN id SET DEFAULT nextval('public.img_news_id_seq'::regclass);
 :   ALTER TABLE public.img_news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252            �           2604    19003    img_products id    DEFAULT     r   ALTER TABLE ONLY public.img_products ALTER COLUMN id SET DEFAULT nextval('public.img_products_id_seq'::regclass);
 >   ALTER TABLE public.img_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            �           2604    19004    intermediary_account_service id    DEFAULT     �   ALTER TABLE ONLY public.intermediary_account_service ALTER COLUMN id SET DEFAULT nextval('public.intermediary_account_service_id_seq'::regclass);
 N   ALTER TABLE public.intermediary_account_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            �           2604    19005    list_codes_received id    DEFAULT     �   ALTER TABLE ONLY public.list_codes_received ALTER COLUMN id SET DEFAULT nextval('public.list_codes_received_id_seq'::regclass);
 E   ALTER TABLE public.list_codes_received ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            �           2604    19006    list_giftcodes id    DEFAULT     v   ALTER TABLE ONLY public.list_giftcodes ALTER COLUMN id SET DEFAULT nextval('public.list_giftcodes_id_seq'::regclass);
 @   ALTER TABLE public.list_giftcodes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260            �           2604    19007    list_products_by_bill id    DEFAULT     �   ALTER TABLE ONLY public.list_products_by_bill ALTER COLUMN id SET DEFAULT nextval('public.list_products_by_bill_id_seq'::regclass);
 G   ALTER TABLE public.list_products_by_bill ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262            �           2604    19008    log_deletes id    DEFAULT     p   ALTER TABLE ONLY public.log_deletes ALTER COLUMN id SET DEFAULT nextval('public.log_deletes_id_seq'::regclass);
 =   ALTER TABLE public.log_deletes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264            �           2604    19009    log_login id    DEFAULT     l   ALTER TABLE ONLY public.log_login ALTER COLUMN id SET DEFAULT nextval('public.log_login_id_seq'::regclass);
 ;   ALTER TABLE public.log_login ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266            �           2604    19010    log_updates id    DEFAULT     p   ALTER TABLE ONLY public.log_updates ALTER COLUMN id SET DEFAULT nextval('public.log_updates_id_seq'::regclass);
 =   ALTER TABLE public.log_updates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268            �           2604    19011    menu_main id    DEFAULT     l   ALTER TABLE ONLY public.menu_main ALTER COLUMN id SET DEFAULT nextval('public.menu_main_id_seq'::regclass);
 ;   ALTER TABLE public.menu_main ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270            �           2604    19012    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    272            �           2604    19013    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    274                       2604    19014    payment_methods id    DEFAULT     x   ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);
 A   ALTER TABLE public.payment_methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277            	           2604    19015    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    279            
           2604    19016 	   policy id    DEFAULT     f   ALTER TABLE ONLY public.policy ALTER COLUMN id SET DEFAULT nextval('public.policy_id_seq'::regclass);
 8   ALTER TABLE public.policy ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    281                       2604    19017    position id    DEFAULT     l   ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);
 <   ALTER TABLE public."position" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283                       2604    19018    price_difference id    DEFAULT     z   ALTER TABLE ONLY public.price_difference ALTER COLUMN id SET DEFAULT nextval('public.price_difference_id_seq'::regclass);
 B   ALTER TABLE public.price_difference ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285                       2604    19019    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287                       2604    19020    products_in_stock id    DEFAULT     |   ALTER TABLE ONLY public.products_in_stock ALTER COLUMN id SET DEFAULT nextval('public.products_in_stock_id_seq'::regclass);
 C   ALTER TABLE public.products_in_stock ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    290    289                       2604    19021    promotion id    DEFAULT     l   ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);
 ;   ALTER TABLE public.promotion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291            #           2604    19022    rank id    DEFAULT     b   ALTER TABLE ONLY public.rank ALTER COLUMN id SET DEFAULT nextval('public.rank_id_seq'::regclass);
 6   ALTER TABLE public.rank ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    294    293            '           2604    19023    report_source id    DEFAULT     t   ALTER TABLE ONLY public.report_source ALTER COLUMN id SET DEFAULT nextval('public.report_source_id_seq'::regclass);
 ?   ALTER TABLE public.report_source ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    296    295            +           2604    19024 
   reports id    DEFAULT     h   ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);
 9   ALTER TABLE public.reports ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297            1           2604    19025    service_by_product id    DEFAULT     ~   ALTER TABLE ONLY public.service_by_product ALTER COLUMN id SET DEFAULT nextval('public.service_by_product_id_seq'::regclass);
 D   ALTER TABLE public.service_by_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    300    299            5           2604    19026    shipping_method id    DEFAULT     x   ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);
 A   ALTER TABLE public.shipping_method ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    302    301            9           2604    19027    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    306    303            =           2604    19028    staff_account id    DEFAULT     t   ALTER TABLE ONLY public.staff_account ALTER COLUMN id SET DEFAULT nextval('public.staff_account_id_seq'::regclass);
 ?   ALTER TABLE public.staff_account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    305    304            A           2604    19029    sub_menu id    DEFAULT     j   ALTER TABLE ONLY public.sub_menu ALTER COLUMN id SET DEFAULT nextval('public.sub_menu_id_seq'::regclass);
 :   ALTER TABLE public.sub_menu ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    308    307            F           2604    19030    transfer_providers id    DEFAULT     ~   ALTER TABLE ONLY public.transfer_providers ALTER COLUMN id SET DEFAULT nextval('public.transfer_providers_id_seq'::regclass);
 D   ALTER TABLE public.transfer_providers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    310    309            J           2604    19031    type_notification id    DEFAULT     |   ALTER TABLE ONLY public.type_notification ALTER COLUMN id SET DEFAULT nextval('public.type_notification_id_seq'::regclass);
 C   ALTER TABLE public.type_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    312    311            O           2604    19032    type_promotion id    DEFAULT     v   ALTER TABLE ONLY public.type_promotion ALTER COLUMN id SET DEFAULT nextval('public.type_promotion_id_seq'::regclass);
 @   ALTER TABLE public.type_promotion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    314    313            S           2604    19033    type_report id    DEFAULT     p   ALTER TABLE ONLY public.type_report ALTER COLUMN id SET DEFAULT nextval('public.type_report_id_seq'::regclass);
 =   ALTER TABLE public.type_report ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    316    315            W           2604    19034    type_ticket id    DEFAULT     p   ALTER TABLE ONLY public.type_ticket ALTER COLUMN id SET DEFAULT nextval('public.type_ticket_id_seq'::regclass);
 =   ALTER TABLE public.type_ticket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    318    317            [           2604    19035    type_update id    DEFAULT     p   ALTER TABLE ONLY public.type_update ALTER COLUMN id SET DEFAULT nextval('public.type_update_id_seq'::regclass);
 =   ALTER TABLE public.type_update ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    320    319            _           2604    19036    warehouse id    DEFAULT     l   ALTER TABLE ONLY public.warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);
 ;   ALTER TABLE public.warehouse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    322    321            c           2604    19037     websockets_statistics_entries id    DEFAULT     �   ALTER TABLE ONLY public.websockets_statistics_entries ALTER COLUMN id SET DEFAULT nextval('public.websockets_statistics_entries_id_seq'::regclass);
 O   ALTER TABLE public.websockets_statistics_entries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    324    323                      0    18525    account_admin_action 
   TABLE DATA           p   COPY public.account_admin_action (id, administration_id, action_id, status, created_at, updated_at) FROM stdin;
    public          postgres    false    214   ��                0    18532    account_customers 
   TABLE DATA           �   COPY public.account_customers (id, customers_id, remember_token, user_name, password, status, created_at, updated_at) FROM stdin;
    public          postgres    false    216   Ќ                0    18539    action 
   TABLE DATA           S   COPY public.action (id, name, content, status, created_at, updated_at) FROM stdin;
    public          postgres    false    218   �                0    18548    administration 
   TABLE DATA           R   COPY public.administration (id, name, status, created_at, updated_at) FROM stdin;
    public          postgres    false    220   
�                0    18555    admins_notification 
   TABLE DATA           �   COPY public.admins_notification (id, type_notification, staff_id, content, watched, status, created_at, updated_at) FROM stdin;
    public          postgres    false    222   K�                0    18565    ads 
   TABLE DATA           �   COPY public.ads (id, name, event_ads_id, staff_id, sub_menu_id, img, content, priority, status, created_at, updated_at) FROM stdin;
    public          postgres    false    224   h�                0    18574    api_weather 
   TABLE DATA           s   COPY public.api_weather (id, name, city, longitude, latityde, content, status, created_at, updated_at) FROM stdin;
    public          postgres    false    226   ��      !          0    18583    bill 
   TABLE DATA           :  COPY public.bill (id, code_bill, staff_id, customers_id, branch_id, payment_methods_id, shipping_method_id, transfer_providers_id, total_products, initial_amount, actual_amount, giftcode_id, successful_payment, note, impact_number, report_ship, queue_bill, note_report, status, created_at, updated_at) FROM stdin;
    public          postgres    false    228   ��      #          0    18596    branch 
   TABLE DATA           r   COPY public.branch (id, name, address, hotline, manage, working_time, status, created_at, updated_at) FROM stdin;
    public          postgres    false    230   ��      %          0    18605    comments_news 
   TABLE DATA           w   COPY public.comments_news (id, news_id, customers_id, comment_id, comment, status, created_at, updated_at) FROM stdin;
    public          postgres    false    232   ��      '          0    18614    comments_product 
   TABLE DATA           �   COPY public.comments_product (id, product_id, customers_id, comments_product_id, vote, comment, status, created_at, updated_at) FROM stdin;
    public          postgres    false    234   ��      )          0    18624    contact_support 
   TABLE DATA           Y   COPY public.contact_support (id, logo, link, status, created_at, updated_at) FROM stdin;
    public          postgres    false    236   ː      +          0    18631 	   customers 
   TABLE DATA           �   COPY public.customers (id, rank_id, first_name, last_name, address, phone_number, email, birthday, sex, accumulated_points, number_ban, potential, status, created_at, updated_at) FROM stdin;
    public          postgres    false    238   �      -          0    18645    customers_notification 
   TABLE DATA           �   COPY public.customers_notification (id, type_notification, customer_id, content, watched, status, created_at, updated_at) FROM stdin;
    public          postgres    false    240   �      /          0    18655    depot_ticket 
   TABLE DATA           �   COPY public.depot_ticket (id, code_ticket, ticket_id, staff_id_export, staff_id_receive, product_id, product_number, total_money, note, status, created_at, updated_at) FROM stdin;
    public          postgres    false    242   "�      1          0    18664 	   event_ads 
   TABLE DATA           �   COPY public.event_ads (id, name_event, staff_id, content, note, start_time, end_time, status, created_at, updated_at) FROM stdin;
    public          postgres    false    244   ?�      3          0    18673    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    246   \�      5          0    18680    giftcode 
   TABLE DATA           �   COPY public.giftcode (id, name, event_ads_id, staff_id, content, img, discount, start_time, end_time, number_of_participants, used, status, created_at, updated_at) FROM stdin;
    public          postgres    false    248   y�      7          0    18689    history_payment 
   TABLE DATA           �   COPY public.history_payment (id, payment_method_id, customers_id, transfer_amount, cash_amount, note, bill_id, status, created_at, updated_at) FROM stdin;
    public          postgres    false    250   ��      9          0    18698    img_news 
   TABLE DATA           h   COPY public.img_news (id, name_img, news_id, img, location, status, created_at, updated_at) FROM stdin;
    public          postgres    false    252   ��      ;          0    18705    img_products 
   TABLE DATA           j   COPY public.img_products (id, product_id, img, display_order, status, created_at, updated_at) FROM stdin;
    public          postgres    false    254   Б      =          0    18712    intermediary_account_service 
   TABLE DATA           h   COPY public.intermediary_account_service (id, servive_name, status, created_at, updated_at) FROM stdin;
    public          postgres    false    256   �      ?          0    18719    list_codes_received 
   TABLE DATA           x   COPY public.list_codes_received (id, customers_id, giftcode_id, is_expired, status, created_at, updated_at) FROM stdin;
    public          postgres    false    258   
�      A          0    18727    list_giftcodes 
   TABLE DATA           q   COPY public.list_giftcodes (id, giftcode_id, code, already_received, status, created_at, updated_at) FROM stdin;
    public          postgres    false    260   '�      C          0    18735    list_products_by_bill 
   TABLE DATA           �   COPY public.list_products_by_bill (id, bill_id, products_id, status, created_at, updated_at, quantity, amount_of_money) FROM stdin;
    public          postgres    false    262   D�      E          0    18742    log_deletes 
   TABLE DATA           l   COPY public.log_deletes (id, type_delete_id, content, internal, status, created_at, updated_at) FROM stdin;
    public          postgres    false    264   a�      G          0    18750 	   log_login 
   TABLE DATA           f   COPY public.log_login (id, user_login, type, content, ip, status, created_at, updated_at) FROM stdin;
    public          postgres    false    266   ~�      I          0    18757    log_updates 
   TABLE DATA           l   COPY public.log_updates (id, type_update_id, content, internal, status, created_at, updated_at) FROM stdin;
    public          postgres    false    268   ��      K          0    18765 	   menu_main 
   TABLE DATA           a   COPY public.menu_main (id, name, color, is_sub_menu, status, created_at, updated_at) FROM stdin;
    public          postgres    false    270   ��      M          0    18773 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    272   Ւ      O          0    18777    news 
   TABLE DATA           �   COPY public.news (id, name_news, sub_menu_id, staff_id, img_main, content, tag, views, likes, comments, status, created_at, updated_at) FROM stdin;
    public          postgres    false    274   ��      Q          0    18789    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    276   ȓ      R          0    18794    payment_methods 
   TABLE DATA           S   COPY public.payment_methods (id, name, status, created_at, updated_at) FROM stdin;
    public          postgres    false    277   �      T          0    18801    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    279   �      V          0    18807    policy 
   TABLE DATA           b   COPY public.policy (id, staff_id, name, img, content, status, created_at, updated_at) FROM stdin;
    public          postgres    false    281   �      X          0    18816    position 
   TABLE DATA           W   COPY public."position" (id, name, content, status, created_at, updated_at) FROM stdin;
    public          postgres    false    283   <�      Z          0    18825    price_difference 
   TABLE DATA           �   COPY public.price_difference (id, staff_id, product_id, import_price, export_price, status, created_at, updated_at) FROM stdin;
    public          postgres    false    285   c�      \          0    18832    products 
   TABLE DATA           �   COPY public.products (id, sub_menu_id, code_products, name, img_main, origin, color, size, into_money, vote, intro, number_of_products_sold, remaining_products, status, created_at, updated_at, is_promotion) FROM stdin;
    public          postgres    false    287   ��      ^          0    18842    products_in_stock 
   TABLE DATA           �   COPY public.products_in_stock (id, product_id, warehouse_id, remaining, import_price, export_price, status, created_at, updated_at) FROM stdin;
    public          postgres    false    289   ��      `          0    18849 	   promotion 
   TABLE DATA           z   COPY public.promotion (id, product_id, type_promotion_id, endtime, starttime, status, created_at, updated_at) FROM stdin;
    public          postgres    false    291   ��      b          0    18856    rank 
   TABLE DATA           ]   COPY public.rank (id, name, detail, icon, status, created_at, updated_at, score) FROM stdin;
    public          postgres    false    293   ו      d          0    18863    report_source 
   TABLE DATA           W   COPY public.report_source (id, name, note, status, created_at, updated_at) FROM stdin;
    public          postgres    false    295   9�      f          0    18872    reports 
   TABLE DATA           �   COPY public.reports (id, customers_id, staff_id, sub_report, type_report_id, is_processed, report_source_id, content, feed_back_content, status, created_at, updated_at, sub) FROM stdin;
    public          postgres    false    297   �      h          0    18883    service_by_product 
   TABLE DATA           g   COPY public.service_by_product (id, product_id, policy_id, status, created_at, updated_at) FROM stdin;
    public          postgres    false    299   �      j          0    18890    shipping_method 
   TABLE DATA           S   COPY public.shipping_method (id, name, status, created_at, updated_at) FROM stdin;
    public          postgres    false    301   !�      l          0    18897    staff 
   TABLE DATA           �   COPY public.staff (id, code_staff, position_id, branch_id, name, address, phone_number, email, birthday, sex, img, status, created_at, updated_at, background) FROM stdin;
    public          postgres    false    303   >�      m          0    18905    staff_account 
   TABLE DATA           �   COPY public.staff_account (id, staff_id, administration_id, user_name, password, remember_token, status, created_at, updated_at, refresh_token, issued_at, expired_time) FROM stdin;
    public          postgres    false    304   [�      p          0    18915    sub_menu 
   TABLE DATA           f   COPY public.sub_menu (id, menu_main_id, name, color, sub, status, created_at, updated_at) FROM stdin;
    public          postgres    false    307   x�      r          0    18923    transfer_providers 
   TABLE DATA           V   COPY public.transfer_providers (id, name, status, created_at, updated_at) FROM stdin;
    public          postgres    false    309   ��      t          0    18930    type_notification 
   TABLE DATA           b   COPY public.type_notification (id, name, note, status, created_at, updated_at, color) FROM stdin;
    public          postgres    false    311   ��      v          0    18940    type_promotion 
   TABLE DATA           f   COPY public.type_promotion (id, name, content, code_hide, status, created_at, updated_at) FROM stdin;
    public          postgres    false    313   �      x          0    18947    type_report 
   TABLE DATA           U   COPY public.type_report (id, name, note, status, created_at, updated_at) FROM stdin;
    public          postgres    false    315   :�      z          0    18956    type_ticket 
   TABLE DATA           U   COPY public.type_ticket (id, name, note, status, created_at, updated_at) FROM stdin;
    public          postgres    false    317   
�      |          0    18963    type_update 
   TABLE DATA           U   COPY public.type_update (id, name, note, status, created_at, updated_at) FROM stdin;
    public          postgres    false    319   j�      ~          0    18972 	   warehouse 
   TABLE DATA           r   COPY public.warehouse (id, name, address, hotline, manage, branch_id, status, created_at, updated_at) FROM stdin;
    public          postgres    false    321   ��      �          0    18979    websockets_statistics_entries 
   TABLE DATA           �   COPY public.websockets_statistics_entries (id, app_id, peak_connection_count, websocket_message_count, api_message_count, created_at, updated_at) FROM stdin;
    public          postgres    false    323   ��      �           0    0    account_admin_action_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_admin_action_id_seq', 1, false);
          public          postgres    false    215            �           0    0    account_customers_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.account_customers_id_seq', 1, false);
          public          postgres    false    217            �           0    0    action_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.action_id_seq', 1, false);
          public          postgres    false    219            �           0    0    administration_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.administration_id_seq', 1, true);
          public          postgres    false    221            �           0    0    admins_notification_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.admins_notification_id_seq', 103, true);
          public          postgres    false    223            �           0    0 
   ads_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.ads_id_seq', 1, false);
          public          postgres    false    225            �           0    0    api_weather_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.api_weather_id_seq', 11, true);
          public          postgres    false    227            �           0    0    bill_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.bill_id_seq', 1, false);
          public          postgres    false    229            �           0    0    branch_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.branch_id_seq', 11, true);
          public          postgres    false    231            �           0    0    comments_news_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.comments_news_id_seq', 1, false);
          public          postgres    false    233            �           0    0    comments_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_product_id_seq', 1, false);
          public          postgres    false    235            �           0    0    contact_support_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.contact_support_id_seq', 1, false);
          public          postgres    false    237            �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          postgres    false    239            �           0    0    customers_notification_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.customers_notification_id_seq', 1, false);
          public          postgres    false    241            �           0    0    depot_ticket_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.depot_ticket_id_seq', 1, false);
          public          postgres    false    243            �           0    0    event_ads_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.event_ads_id_seq', 1, false);
          public          postgres    false    245            �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    247            �           0    0    giftcode_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.giftcode_id_seq', 1, false);
          public          postgres    false    249            �           0    0    history_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.history_payment_id_seq', 1, false);
          public          postgres    false    251            �           0    0    img_news_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.img_news_id_seq', 1, false);
          public          postgres    false    253            �           0    0    img_products_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.img_products_id_seq', 1, false);
          public          postgres    false    255            �           0    0 #   intermediary_account_service_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.intermediary_account_service_id_seq', 1, false);
          public          postgres    false    257            �           0    0    list_codes_received_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.list_codes_received_id_seq', 1, false);
          public          postgres    false    259            �           0    0    list_giftcodes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.list_giftcodes_id_seq', 1, false);
          public          postgres    false    261            �           0    0    list_products_by_bill_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.list_products_by_bill_id_seq', 1, false);
          public          postgres    false    263            �           0    0    log_deletes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.log_deletes_id_seq', 1, false);
          public          postgres    false    265            �           0    0    log_login_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.log_login_id_seq', 1, false);
          public          postgres    false    267            �           0    0    log_updates_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.log_updates_id_seq', 1, false);
          public          postgres    false    269            �           0    0    menu_main_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_main_id_seq', 1, false);
          public          postgres    false    271            �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);
          public          postgres    false    273            �           0    0    news_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.news_id_seq', 1, false);
          public          postgres    false    275            �           0    0    payment_methods_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);
          public          postgres    false    278            �           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    280            �           0    0    policy_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.policy_id_seq', 1, false);
          public          postgres    false    282            �           0    0    position_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.position_id_seq', 9, true);
          public          postgres    false    284            �           0    0    price_difference_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.price_difference_id_seq', 1, false);
          public          postgres    false    286            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    288            �           0    0    products_in_stock_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_in_stock_id_seq', 1, false);
          public          postgres    false    290            �           0    0    promotion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);
          public          postgres    false    292            �           0    0    rank_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.rank_id_seq', 1, true);
          public          postgres    false    294            �           0    0    report_source_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.report_source_id_seq', 7, true);
          public          postgres    false    296            �           0    0    reports_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reports_id_seq', 1, false);
          public          postgres    false    298            �           0    0    service_by_product_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.service_by_product_id_seq', 1, false);
          public          postgres    false    300            �           0    0    shipping_method_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.shipping_method_id_seq', 1, false);
          public          postgres    false    302            �           0    0    staff_account_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.staff_account_id_seq', 10, true);
          public          postgres    false    305            �           0    0    staff_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.staff_id_seq', 25, true);
          public          postgres    false    306            �           0    0    sub_menu_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sub_menu_id_seq', 1, false);
          public          postgres    false    308            �           0    0    transfer_providers_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.transfer_providers_id_seq', 1, false);
          public          postgres    false    310            �           0    0    type_notification_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.type_notification_id_seq', 13, true);
          public          postgres    false    312            �           0    0    type_promotion_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.type_promotion_id_seq', 1, false);
          public          postgres    false    314            �           0    0    type_report_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.type_report_id_seq', 91, true);
          public          postgres    false    316            �           0    0    type_ticket_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.type_ticket_id_seq', 2, true);
          public          postgres    false    318            �           0    0    type_update_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.type_update_id_seq', 1, false);
          public          postgres    false    320            �           0    0    warehouse_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.warehouse_id_seq', 1, false);
          public          postgres    false    322            �           0    0 $   websockets_statistics_entries_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.websockets_statistics_entries_id_seq', 1, false);
          public          postgres    false    324            e           2606    19039 .   account_admin_action account_admin_action_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT account_admin_action_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_admin_action DROP CONSTRAINT account_admin_action_pkey;
       public            postgres    false    214            g           2606    19041 &   account_customers account_customers_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_pk PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.account_customers DROP CONSTRAINT account_customers_pk;
       public            postgres    false    216            i           2606    19043 &   account_customers account_customers_un 
   CONSTRAINT     f   ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT account_customers_un UNIQUE (user_name);
 P   ALTER TABLE ONLY public.account_customers DROP CONSTRAINT account_customers_un;
       public            postgres    false    216            k           2606    19045    action action_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.action DROP CONSTRAINT action_name_key;
       public            postgres    false    218            m           2606    19047    action action_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.action DROP CONSTRAINT action_pkey;
       public            postgres    false    218            o           2606    19049 &   administration administration_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_name_key UNIQUE (name);
 P   ALTER TABLE ONLY public.administration DROP CONSTRAINT administration_name_key;
       public            postgres    false    220            q           2606    19051 "   administration administration_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.administration
    ADD CONSTRAINT administration_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.administration DROP CONSTRAINT administration_pkey;
       public            postgres    false    220            t           2606    19053 *   admins_notification admins_notification_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.admins_notification DROP CONSTRAINT admins_notification_pk;
       public            postgres    false    222            v           2606    19055    ads ads_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    224            x           2606    19057    api_weather api_weather_key 
   CONSTRAINT     V   ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_key UNIQUE (city);
 E   ALTER TABLE ONLY public.api_weather DROP CONSTRAINT api_weather_key;
       public            postgres    false    226            z           2606    19059    api_weather api_weather_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.api_weather
    ADD CONSTRAINT api_weather_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.api_weather DROP CONSTRAINT api_weather_pkey;
       public            postgres    false    226            |           2606    19061    bill bill_code_bill_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_code_bill_key UNIQUE (code_bill);
 A   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_code_bill_key;
       public            postgres    false    228            ~           2606    19063    bill bill_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_pkey;
       public            postgres    false    228            �           2606    19065    branch branch_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.branch DROP CONSTRAINT branch_name_key;
       public            postgres    false    230            �           2606    19067    branch branch_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.branch DROP CONSTRAINT branch_pkey;
       public            postgres    false    230            �           2606    19069     comments_news comments_news_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT comments_news_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.comments_news DROP CONSTRAINT comments_news_pkey;
       public            postgres    false    232            �           2606    19071 &   comments_product comments_product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT comments_product_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.comments_product DROP CONSTRAINT comments_product_pkey;
       public            postgres    false    234            �           2606    19073 $   contact_support contact_support_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.contact_support
    ADD CONSTRAINT contact_support_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.contact_support DROP CONSTRAINT contact_support_pkey;
       public            postgres    false    236            �           2606    19075    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    238            �           2606    19077 0   customers_notification customers_notification_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.customers_notification DROP CONSTRAINT customers_notification_pk;
       public            postgres    false    240            �           2606    19079 $   customers customers_phone_number_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_number_key UNIQUE (phone_number);
 N   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_phone_number_key;
       public            postgres    false    238            �           2606    19081    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    238            �           2606    19083    depot_ticket depot_ticket_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT depot_ticket_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.depot_ticket DROP CONSTRAINT depot_ticket_pkey;
       public            postgres    false    242            �           2606    19085    event_ads event_ads_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT event_ads_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.event_ads DROP CONSTRAINT event_ads_pkey;
       public            postgres    false    244            �           2606    19087    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    246            �           2606    19089 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    246            �           2606    19091    giftcode giftcode_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT giftcode_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.giftcode DROP CONSTRAINT giftcode_pkey;
       public            postgres    false    248            �           2606    19093 $   history_payment history_payment_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT history_payment_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.history_payment DROP CONSTRAINT history_payment_pkey;
       public            postgres    false    250            �           2606    19095    img_news img_news_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT img_news_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.img_news DROP CONSTRAINT img_news_pkey;
       public            postgres    false    252            �           2606    19097    img_products img_products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT img_products_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.img_products DROP CONSTRAINT img_products_pkey;
       public            postgres    false    254            �           2606    19099 >   intermediary_account_service intermediary_account_service_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.intermediary_account_service DROP CONSTRAINT intermediary_account_service_pkey;
       public            postgres    false    256            �           2606    19101 J   intermediary_account_service intermediary_account_service_servive_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.intermediary_account_service
    ADD CONSTRAINT intermediary_account_service_servive_name_key UNIQUE (servive_name);
 t   ALTER TABLE ONLY public.intermediary_account_service DROP CONSTRAINT intermediary_account_service_servive_name_key;
       public            postgres    false    256            �           2606    19103 "   list_giftcodes list_giftcodes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT list_giftcodes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.list_giftcodes DROP CONSTRAINT list_giftcodes_pkey;
       public            postgres    false    260            �           2606    19105 0   list_products_by_bill list_products_by_bill_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT list_products_by_bill_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.list_products_by_bill DROP CONSTRAINT list_products_by_bill_pkey;
       public            postgres    false    262            �           2606    19107    log_deletes log_deletes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT log_deletes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.log_deletes DROP CONSTRAINT log_deletes_pkey;
       public            postgres    false    264            �           2606    19109    log_login log_login_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.log_login
    ADD CONSTRAINT log_login_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.log_login DROP CONSTRAINT log_login_pkey;
       public            postgres    false    266            �           2606    19111    log_updates log_updates_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT log_updates_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.log_updates DROP CONSTRAINT log_updates_pkey;
       public            postgres    false    268            �           2606    19113    menu_main menu_main_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.menu_main DROP CONSTRAINT menu_main_name_key;
       public            postgres    false    270            �           2606    19115    menu_main menu_main_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.menu_main
    ADD CONSTRAINT menu_main_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.menu_main DROP CONSTRAINT menu_main_pkey;
       public            postgres    false    270            �           2606    19117    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    272            �           2606    19119    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    274            �           2606    19121 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    276            �           2606    19123 (   payment_methods payment_methods_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_name_key;
       public            postgres    false    277            �           2606    19125 $   payment_methods payment_methods_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_pkey;
       public            postgres    false    277            �           2606    19127 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    279            �           2606    19129 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    279            �           2606    19131    policy policy_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.policy DROP CONSTRAINT policy_pkey;
       public            postgres    false    281            �           2606    19133    position position_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_name_key;
       public            postgres    false    283            �           2606    19135    position position_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    283            �           2606    19137 &   price_difference price_difference_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT price_difference_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.price_difference DROP CONSTRAINT price_difference_pkey;
       public            postgres    false    285            �           2606    19139 #   products products_code_products_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_code_products_key UNIQUE (code_products);
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT products_code_products_key;
       public            postgres    false    287            �           2606    19141 (   products_in_stock products_in_stock_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT products_in_stock_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_in_stock DROP CONSTRAINT products_in_stock_pkey;
       public            postgres    false    289            �           2606    19143    products products_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_name_key;
       public            postgres    false    287            �           2606    19145    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    287            �           2606    19147    promotion promotion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.promotion DROP CONSTRAINT promotion_pkey;
       public            postgres    false    291            �           2606    19149    rank rank_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.rank DROP CONSTRAINT rank_pkey;
       public            postgres    false    293            �           2606    19151 $   report_source report_source_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.report_source DROP CONSTRAINT report_source_name_key;
       public            postgres    false    295            �           2606    19153     report_source report_source_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.report_source
    ADD CONSTRAINT report_source_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.report_source DROP CONSTRAINT report_source_pkey;
       public            postgres    false    295            �           2606    19155    reports reports_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reports DROP CONSTRAINT reports_pkey;
       public            postgres    false    297            �           2606    19157 *   service_by_product service_by_product_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT service_by_product_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.service_by_product DROP CONSTRAINT service_by_product_pkey;
       public            postgres    false    299            �           2606    19159 (   shipping_method shipping_method_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.shipping_method DROP CONSTRAINT shipping_method_name_key;
       public            postgres    false    301            �           2606    19161 $   shipping_method shipping_method_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.shipping_method DROP CONSTRAINT shipping_method_pkey;
       public            postgres    false    301            �           2606    19163     staff_account staff_account_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.staff_account DROP CONSTRAINT staff_account_pkey;
       public            postgres    false    304            �           2606    19165 )   staff_account staff_account_user_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT staff_account_user_name_key UNIQUE (user_name);
 S   ALTER TABLE ONLY public.staff_account DROP CONSTRAINT staff_account_user_name_key;
       public            postgres    false    304            �           2606    19167    staff staff_code_staff_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_code_staff_key UNIQUE (code_staff);
 D   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_code_staff_key;
       public            postgres    false    303            �           2606    19169    staff staff_phone_number_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_phone_number_key UNIQUE (phone_number);
 F   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_phone_number_key;
       public            postgres    false    303            �           2606    19171    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    303            �           2606    19173    sub_menu sub_menu_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT sub_menu_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sub_menu DROP CONSTRAINT sub_menu_pkey;
       public            postgres    false    307            �           2606    19175 .   transfer_providers transfer_providers_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.transfer_providers DROP CONSTRAINT transfer_providers_name_key;
       public            postgres    false    309            �           2606    19177 *   transfer_providers transfer_providers_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transfer_providers
    ADD CONSTRAINT transfer_providers_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.transfer_providers DROP CONSTRAINT transfer_providers_pkey;
       public            postgres    false    309            �           2606    19179 &   type_notification type_notification_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_pk PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.type_notification DROP CONSTRAINT type_notification_pk;
       public            postgres    false    311            �           2606    19181 &   type_notification type_notification_un 
   CONSTRAINT     a   ALTER TABLE ONLY public.type_notification
    ADD CONSTRAINT type_notification_un UNIQUE (name);
 P   ALTER TABLE ONLY public.type_notification DROP CONSTRAINT type_notification_un;
       public            postgres    false    311            �           2606    19183 &   type_promotion type_promotion_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_name_key UNIQUE (name);
 P   ALTER TABLE ONLY public.type_promotion DROP CONSTRAINT type_promotion_name_key;
       public            postgres    false    313            �           2606    19185 "   type_promotion type_promotion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.type_promotion
    ADD CONSTRAINT type_promotion_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.type_promotion DROP CONSTRAINT type_promotion_pkey;
       public            postgres    false    313            �           2606    19187     type_report type_report_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_name_key UNIQUE (name);
 J   ALTER TABLE ONLY public.type_report DROP CONSTRAINT type_report_name_key;
       public            postgres    false    315            �           2606    19189    type_report type_report_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.type_report
    ADD CONSTRAINT type_report_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_report DROP CONSTRAINT type_report_pkey;
       public            postgres    false    315                       2606    19191     type_ticket type_ticket_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_name_key UNIQUE (name);
 J   ALTER TABLE ONLY public.type_ticket DROP CONSTRAINT type_ticket_name_key;
       public            postgres    false    317                       2606    19193    type_ticket type_ticket_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.type_ticket
    ADD CONSTRAINT type_ticket_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_ticket DROP CONSTRAINT type_ticket_pkey;
       public            postgres    false    317                       2606    19195     type_update type_update_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_name_key UNIQUE (name);
 J   ALTER TABLE ONLY public.type_update DROP CONSTRAINT type_update_name_key;
       public            postgres    false    319                       2606    19197    type_update type_update_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.type_update
    ADD CONSTRAINT type_update_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_update DROP CONSTRAINT type_update_pkey;
       public            postgres    false    319            �           2606    19199 &   staff_account unique_column_constraint 
   CONSTRAINT     e   ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT unique_column_constraint UNIQUE (staff_id);
 P   ALTER TABLE ONLY public.staff_account DROP CONSTRAINT unique_column_constraint;
       public            postgres    false    304            	           2606    19201    warehouse warehouse_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT warehouse_name_key;
       public            postgres    false    321                       2606    19203    warehouse warehouse_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT warehouse_pkey;
       public            postgres    false    321                       2606    19205 @   websockets_statistics_entries websockets_statistics_entries_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.websockets_statistics_entries
    ADD CONSTRAINT websockets_statistics_entries_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.websockets_statistics_entries DROP CONSTRAINT websockets_statistics_entries_pkey;
       public            postgres    false    323            r           1259    19206    admins_notification_id_idx    INDEX     X   CREATE INDEX admins_notification_id_idx ON public.admins_notification USING btree (id);
 .   DROP INDEX public.admins_notification_id_idx;
       public            postgres    false    222            �           1259    19207 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    279    279            N           2620    19208 ,   account_admin_action update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_admin_action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 E   DROP TRIGGER update_table_updated_at ON public.account_admin_action;
       public          postgres    false    325    214            O           2620    19209 )   account_customers update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.account_customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 B   DROP TRIGGER update_table_updated_at ON public.account_customers;
       public          postgres    false    325    216            P           2620    19210    action update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.action FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 7   DROP TRIGGER update_table_updated_at ON public.action;
       public          postgres    false    218    325            Q           2620    19211 &   administration update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.administration FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 ?   DROP TRIGGER update_table_updated_at ON public.administration;
       public          postgres    false    220    325            R           2620    19212 +   admins_notification update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.admins_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 D   DROP TRIGGER update_table_updated_at ON public.admins_notification;
       public          postgres    false    325    222            S           2620    19213    ads update_table_updated_at    TRIGGER     }   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 4   DROP TRIGGER update_table_updated_at ON public.ads;
       public          postgres    false    224    325            T           2620    19214 #   api_weather update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.api_weather FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.api_weather;
       public          postgres    false    226    325            U           2620    19215    bill update_table_updated_at    TRIGGER     ~   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 5   DROP TRIGGER update_table_updated_at ON public.bill;
       public          postgres    false    228    325            V           2620    19216    branch update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.branch FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 7   DROP TRIGGER update_table_updated_at ON public.branch;
       public          postgres    false    325    230            W           2620    19217 %   comments_news update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 >   DROP TRIGGER update_table_updated_at ON public.comments_news;
       public          postgres    false    325    232            X           2620    19218 (   comments_product update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.comments_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 A   DROP TRIGGER update_table_updated_at ON public.comments_product;
       public          postgres    false    234    325            Y           2620    19219 '   contact_support update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.contact_support FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 @   DROP TRIGGER update_table_updated_at ON public.contact_support;
       public          postgres    false    236    325            Z           2620    19220 !   customers update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.customers;
       public          postgres    false    238    325            [           2620    19221 .   customers_notification update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.customers_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 G   DROP TRIGGER update_table_updated_at ON public.customers_notification;
       public          postgres    false    240    325            \           2620    19222 $   depot_ticket update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.depot_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 =   DROP TRIGGER update_table_updated_at ON public.depot_ticket;
       public          postgres    false    325    242            ]           2620    19223 !   event_ads update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.event_ads FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.event_ads;
       public          postgres    false    325    244            ^           2620    19224 #   failed_jobs update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.failed_jobs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.failed_jobs;
       public          postgres    false    325    246            _           2620    19225     giftcode update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.giftcode FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 9   DROP TRIGGER update_table_updated_at ON public.giftcode;
       public          postgres    false    325    248            `           2620    19226 '   history_payment update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.history_payment FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 @   DROP TRIGGER update_table_updated_at ON public.history_payment;
       public          postgres    false    325    250            a           2620    19227     img_news update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 9   DROP TRIGGER update_table_updated_at ON public.img_news;
       public          postgres    false    252    325            b           2620    19228 $   img_products update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.img_products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 =   DROP TRIGGER update_table_updated_at ON public.img_products;
       public          postgres    false    254    325            c           2620    19229 4   intermediary_account_service update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.intermediary_account_service FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 M   DROP TRIGGER update_table_updated_at ON public.intermediary_account_service;
       public          postgres    false    325    256            d           2620    19230 +   list_codes_received update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_codes_received FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 D   DROP TRIGGER update_table_updated_at ON public.list_codes_received;
       public          postgres    false    325    258            e           2620    19231 &   list_giftcodes update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_giftcodes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 ?   DROP TRIGGER update_table_updated_at ON public.list_giftcodes;
       public          postgres    false    260    325            f           2620    19232 -   list_products_by_bill update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.list_products_by_bill FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 F   DROP TRIGGER update_table_updated_at ON public.list_products_by_bill;
       public          postgres    false    325    262            g           2620    19233 #   log_deletes update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_deletes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.log_deletes;
       public          postgres    false    325    264            h           2620    19234 !   log_login update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_login FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.log_login;
       public          postgres    false    266    325            i           2620    19235 #   log_updates update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.log_updates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.log_updates;
       public          postgres    false    325    268            j           2620    19236 !   menu_main update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.menu_main FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.menu_main;
       public          postgres    false    270    325            k           2620    19237 "   migrations update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.migrations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 ;   DROP TRIGGER update_table_updated_at ON public.migrations;
       public          postgres    false    272    325            l           2620    19238    news update_table_updated_at    TRIGGER     ~   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.news FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 5   DROP TRIGGER update_table_updated_at ON public.news;
       public          postgres    false    325    274            m           2620    19239 -   password_reset_tokens update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.password_reset_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 F   DROP TRIGGER update_table_updated_at ON public.password_reset_tokens;
       public          postgres    false    325    276            n           2620    19240 '   payment_methods update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.payment_methods FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 @   DROP TRIGGER update_table_updated_at ON public.payment_methods;
       public          postgres    false    277    325            o           2620    19241 .   personal_access_tokens update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.personal_access_tokens FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 G   DROP TRIGGER update_table_updated_at ON public.personal_access_tokens;
       public          postgres    false    279    325            p           2620    19242    policy update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.policy FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 7   DROP TRIGGER update_table_updated_at ON public.policy;
       public          postgres    false    325    281            q           2620    19243     position update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 ;   DROP TRIGGER update_table_updated_at ON public."position";
       public          postgres    false    283    325            r           2620    19244 (   price_difference update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.price_difference FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 A   DROP TRIGGER update_table_updated_at ON public.price_difference;
       public          postgres    false    325    285            s           2620    19245     products update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 9   DROP TRIGGER update_table_updated_at ON public.products;
       public          postgres    false    325    287            t           2620    19246 )   products_in_stock update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.products_in_stock FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 B   DROP TRIGGER update_table_updated_at ON public.products_in_stock;
       public          postgres    false    289    325            u           2620    19247 !   promotion update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.promotion;
       public          postgres    false    291    325            v           2620    19248    rank update_table_updated_at    TRIGGER     ~   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.rank FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 5   DROP TRIGGER update_table_updated_at ON public.rank;
       public          postgres    false    325    293            w           2620    19249 %   report_source update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.report_source FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 >   DROP TRIGGER update_table_updated_at ON public.report_source;
       public          postgres    false    325    295            x           2620    19250    reports update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.reports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 8   DROP TRIGGER update_table_updated_at ON public.reports;
       public          postgres    false    297    325            y           2620    19251 *   service_by_product update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.service_by_product FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 C   DROP TRIGGER update_table_updated_at ON public.service_by_product;
       public          postgres    false    299    325            z           2620    19252 '   shipping_method update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.shipping_method FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 @   DROP TRIGGER update_table_updated_at ON public.shipping_method;
       public          postgres    false    301    325            {           2620    19253    staff update_table_updated_at    TRIGGER        CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 6   DROP TRIGGER update_table_updated_at ON public.staff;
       public          postgres    false    325    303            |           2620    19254 %   staff_account update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.staff_account FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 >   DROP TRIGGER update_table_updated_at ON public.staff_account;
       public          postgres    false    304    325            }           2620    19255     sub_menu update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.sub_menu FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 9   DROP TRIGGER update_table_updated_at ON public.sub_menu;
       public          postgres    false    325    307            ~           2620    19256 *   transfer_providers update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.transfer_providers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 C   DROP TRIGGER update_table_updated_at ON public.transfer_providers;
       public          postgres    false    325    309                       2620    19257 )   type_notification update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_notification FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 B   DROP TRIGGER update_table_updated_at ON public.type_notification;
       public          postgres    false    311    325            �           2620    19258 &   type_promotion update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_promotion FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 ?   DROP TRIGGER update_table_updated_at ON public.type_promotion;
       public          postgres    false    313    325            �           2620    19259 #   type_report update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_report FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.type_report;
       public          postgres    false    315    325            �           2620    19260 #   type_ticket update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_ticket FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.type_ticket;
       public          postgres    false    325    317            �           2620    19261 #   type_update update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.type_update FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 <   DROP TRIGGER update_table_updated_at ON public.type_update;
       public          postgres    false    319    325            �           2620    19262 !   warehouse update_table_updated_at    TRIGGER     �   CREATE TRIGGER update_table_updated_at BEFORE UPDATE ON public.warehouse FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 :   DROP TRIGGER update_table_updated_at ON public.warehouse;
       public          postgres    false    325    321                       2606    19263 '   account_customers FK1_account_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_customers
    ADD CONSTRAINT "FK1_account_customers" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 S   ALTER TABLE ONLY public.account_customers DROP CONSTRAINT "FK1_account_customers";
       public          postgres    false    216    3726    238                       2606    19268 %   account_admin_action FK1_action_admin    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK1_action_admin" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.account_admin_action DROP CONSTRAINT "FK1_action_admin";
       public          postgres    false    214    220    3697                       2606    19273    ads FK1_ads    FK CONSTRAINT     �   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK1_ads" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;
 7   ALTER TABLE ONLY public.ads DROP CONSTRAINT "FK1_ads";
       public          postgres    false    244    3732    224                       2606    19278    bill FK1_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK1_bill" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK1_bill";
       public          postgres    false    303    228    3815                       2606    19283 $   comments_product FK1_comment_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK1_comment_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public.comments_product DROP CONSTRAINT "FK1_comment_product";
       public          postgres    false    3791    287    234                       2606    19288    comments_news FK1_comments_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK1_comments_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public.comments_news DROP CONSTRAINT "FK1_comments_news";
       public          postgres    false    232    274    3766            !           2606    19293    customers FK1_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT "FK1_customers" FOREIGN KEY (rank_id) REFERENCES public.rank(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.customers DROP CONSTRAINT "FK1_customers";
       public          postgres    false    293    238    3797            $           2606    19298    depot_ticket FK1_depot_ticket    FK CONSTRAINT     �   ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK1_depot_ticket" FOREIGN KEY (ticket_id) REFERENCES public.type_ticket(id) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.depot_ticket DROP CONSTRAINT "FK1_depot_ticket";
       public          postgres    false    3843    317    242            (           2606    19303    event_ads FK1_event_ads    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_ads
    ADD CONSTRAINT "FK1_event_ads" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.event_ads DROP CONSTRAINT "FK1_event_ads";
       public          postgres    false    3815    303    244            )           2606    19308    giftcode FK1_giftcode    FK CONSTRAINT     �   ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK1_giftcode" FOREIGN KEY (event_ads_id) REFERENCES public.event_ads(id) ON UPDATE CASCADE;
 A   ALTER TABLE ONLY public.giftcode DROP CONSTRAINT "FK1_giftcode";
       public          postgres    false    3732    248    244            +           2606    19313 #   history_payment FK1_history_payment    FK CONSTRAINT     �   ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK1_history_payment" FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public.history_payment DROP CONSTRAINT "FK1_history_payment";
       public          postgres    false    277    3772    250            .           2606    19318    img_news FK1_img_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.img_news
    ADD CONSTRAINT "FK1_img_news" FOREIGN KEY (news_id) REFERENCES public.news(id) ON UPDATE CASCADE;
 A   ALTER TABLE ONLY public.img_news DROP CONSTRAINT "FK1_img_news";
       public          postgres    false    252    274    3766            /           2606    19323    img_products FK1_img_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.img_products
    ADD CONSTRAINT "FK1_img_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 H   ALTER TABLE ONLY public.img_products DROP CONSTRAINT "FK1_img_product";
       public          postgres    false    254    3791    287            0           2606    19328 +   list_codes_received FK1_list_codes_received    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK1_list_codes_received" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY public.list_codes_received DROP CONSTRAINT "FK1_list_codes_received";
       public          postgres    false    238    3726    258            2           2606    19333 !   list_giftcodes FK1_list_giftcodes    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_giftcodes
    ADD CONSTRAINT "FK1_list_giftcodes" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;
 M   ALTER TABLE ONLY public.list_giftcodes DROP CONSTRAINT "FK1_list_giftcodes";
       public          postgres    false    260    3738    248            3           2606    19338 *   list_products_by_bill FK1_list_products_by    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK1_list_products_by" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;
 V   ALTER TABLE ONLY public.list_products_by_bill DROP CONSTRAINT "FK1_list_products_by";
       public          postgres    false    228    3710    262            5           2606    19343    log_deletes FK1_log_delete    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_deletes
    ADD CONSTRAINT "FK1_log_delete" FOREIGN KEY (type_delete_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY public.log_deletes DROP CONSTRAINT "FK1_log_delete";
       public          postgres    false    3847    264    319            6           2606    19348    log_updates FK1_log_update    FK CONSTRAINT     �   ALTER TABLE ONLY public.log_updates
    ADD CONSTRAINT "FK1_log_update" FOREIGN KEY (type_update_id) REFERENCES public.type_update(id) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY public.log_updates DROP CONSTRAINT "FK1_log_update";
       public          postgres    false    319    3847    268            7           2606    19353    news FK1_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK1_news" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.news DROP CONSTRAINT "FK1_news";
       public          postgres    false    307    3823    274            9           2606    19358    policy FK1_policy    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy
    ADD CONSTRAINT "FK1_policy" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 =   ALTER TABLE ONLY public.policy DROP CONSTRAINT "FK1_policy";
       public          postgres    false    281    3815    303            :           2606    19363 %   price_difference FK1_price_difference    FK CONSTRAINT     �   ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK1_price_difference" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.price_difference DROP CONSTRAINT "FK1_price_difference";
       public          postgres    false    285    303    3815            <           2606    19368    products FK1_products    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK1_products" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;
 A   ALTER TABLE ONLY public.products DROP CONSTRAINT "FK1_products";
       public          postgres    false    307    3823    287            =           2606    19373 '   products_in_stock FK1_products_in_stock    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK1_products_in_stock" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 S   ALTER TABLE ONLY public.products_in_stock DROP CONSTRAINT "FK1_products_in_stock";
       public          postgres    false    289    3791    287            ?           2606    19378    promotion FK1_promotion    FK CONSTRAINT     �   ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK1_promotion" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.promotion DROP CONSTRAINT "FK1_promotion";
       public          postgres    false    291    3791    287            A           2606    19383    reports FK1_reports    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK1_reports" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 ?   ALTER TABLE ONLY public.reports DROP CONSTRAINT "FK1_reports";
       public          postgres    false    297    3726    238            F           2606    19388 )   service_by_product FK1_service_by_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK1_service_by_product" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 U   ALTER TABLE ONLY public.service_by_product DROP CONSTRAINT "FK1_service_by_product";
       public          postgres    false    299    287    3791            H           2606    19393    staff FK1_staff    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK1_staff" FOREIGN KEY (position_id) REFERENCES public."position"(id) ON UPDATE CASCADE;
 ;   ALTER TABLE ONLY public.staff DROP CONSTRAINT "FK1_staff";
       public          postgres    false    3783    303    283            J           2606    19398    staff_account FK1_staff_account    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK1_staff_account" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public.staff_account DROP CONSTRAINT "FK1_staff_account";
       public          postgres    false    3815    303    304            L           2606    19403    sub_menu FK1_sub_menu    FK CONSTRAINT     �   ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT "FK1_sub_menu" FOREIGN KEY (menu_main_id) REFERENCES public.menu_main(id) ON UPDATE CASCADE;
 A   ALTER TABLE ONLY public.sub_menu DROP CONSTRAINT "FK1_sub_menu";
       public          postgres    false    307    3762    270            M           2606    19408    warehouse FK1_warehouse    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK1_warehouse" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK1_warehouse";
       public          postgres    false    321    3714    230                       2606    19413 %   account_admin_action FK2_action_admin    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_admin_action
    ADD CONSTRAINT "FK2_action_admin" FOREIGN KEY (action_id) REFERENCES public.action(id) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.account_admin_action DROP CONSTRAINT "FK2_action_admin";
       public          postgres    false    214    218    3693                       2606    19418    ads FK2_ads    FK CONSTRAINT     �   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT "FK2_ads" FOREIGN KEY (sub_menu_id) REFERENCES public.sub_menu(id) ON UPDATE CASCADE;
 7   ALTER TABLE ONLY public.ads DROP CONSTRAINT "FK2_ads";
       public          postgres    false    307    3823    224                       2606    19423    bill FK2_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK2_bill" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK2_bill";
       public          postgres    false    228    238    3726                       2606    19428 $   comments_product FK2_comment_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK2_comment_product" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public.comments_product DROP CONSTRAINT "FK2_comment_product";
       public          postgres    false    238    234    3726                       2606    19433    comments_news FK2_comments_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK2_comments_news" FOREIGN KEY (comment_id) REFERENCES public.comments_news(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public.comments_news DROP CONSTRAINT "FK2_comments_news";
       public          postgres    false    232    3716    232            %           2606    19438    depot_ticket FK2_depot_ticket    FK CONSTRAINT     �   ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK2_depot_ticket" FOREIGN KEY (staff_id_export) REFERENCES public.staff(id) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.depot_ticket DROP CONSTRAINT "FK2_depot_ticket";
       public          postgres    false    303    242    3815            *           2606    19443    giftcode FK2_giftcode    FK CONSTRAINT     �   ALTER TABLE ONLY public.giftcode
    ADD CONSTRAINT "FK2_giftcode" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 A   ALTER TABLE ONLY public.giftcode DROP CONSTRAINT "FK2_giftcode";
       public          postgres    false    303    3815    248            ,           2606    19448 #   history_payment FK2_history_payment    FK CONSTRAINT     �   ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK2_history_payment" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public.history_payment DROP CONSTRAINT "FK2_history_payment";
       public          postgres    false    238    3726    250            1           2606    19453 +   list_codes_received FK2_list_codes_received    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_codes_received
    ADD CONSTRAINT "FK2_list_codes_received" FOREIGN KEY (giftcode_id) REFERENCES public.giftcode(id) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY public.list_codes_received DROP CONSTRAINT "FK2_list_codes_received";
       public          postgres    false    3738    258    248            4           2606    19458 *   list_products_by_bill FK2_list_products_by    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_products_by_bill
    ADD CONSTRAINT "FK2_list_products_by" FOREIGN KEY (products_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 V   ALTER TABLE ONLY public.list_products_by_bill DROP CONSTRAINT "FK2_list_products_by";
       public          postgres    false    3791    262    287            8           2606    19463    news FK2_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT "FK2_news" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.news DROP CONSTRAINT "FK2_news";
       public          postgres    false    3815    303    274            ;           2606    19468 %   price_difference FK2_price_difference    FK CONSTRAINT     �   ALTER TABLE ONLY public.price_difference
    ADD CONSTRAINT "FK2_price_difference" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.price_difference DROP CONSTRAINT "FK2_price_difference";
       public          postgres    false    285    3791    287            >           2606    19473 '   products_in_stock FK2_products_in_stock    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_in_stock
    ADD CONSTRAINT "FK2_products_in_stock" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE;
 S   ALTER TABLE ONLY public.products_in_stock DROP CONSTRAINT "FK2_products_in_stock";
       public          postgres    false    289    3851    321            @           2606    19478    promotion FK2_promotion    FK CONSTRAINT     �   ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK2_promotion" FOREIGN KEY (type_promotion_id) REFERENCES public.type_promotion(id);
 C   ALTER TABLE ONLY public.promotion DROP CONSTRAINT "FK2_promotion";
       public          postgres    false    291    3835    313            B           2606    19483    reports FK2_reports    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK2_reports" FOREIGN KEY (staff_id) REFERENCES public.staff(id) ON UPDATE CASCADE;
 ?   ALTER TABLE ONLY public.reports DROP CONSTRAINT "FK2_reports";
       public          postgres    false    297    3815    303            G           2606    19488 )   service_by_product FK2_service_by_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_by_product
    ADD CONSTRAINT "FK2_service_by_product" FOREIGN KEY (policy_id) REFERENCES public.policy(id) ON UPDATE CASCADE;
 U   ALTER TABLE ONLY public.service_by_product DROP CONSTRAINT "FK2_service_by_product";
       public          postgres    false    299    3779    281            K           2606    19493    staff_account FK2_staff_account    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff_account
    ADD CONSTRAINT "FK2_staff_account" FOREIGN KEY (administration_id) REFERENCES public.administration(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public.staff_account DROP CONSTRAINT "FK2_staff_account";
       public          postgres    false    304    3697    220                       2606    19498    bill FK3_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK3_bill" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK3_bill";
       public          postgres    false    228    3714    230                        2606    19503 $   comments_product FK3_comment_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_product
    ADD CONSTRAINT "FK3_comment_product" FOREIGN KEY (comments_product_id) REFERENCES public.comments_product(id) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public.comments_product DROP CONSTRAINT "FK3_comment_product";
       public          postgres    false    234    3718    234                       2606    19508    comments_news FK3_comments_news    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments_news
    ADD CONSTRAINT "FK3_comments_news" FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public.comments_news DROP CONSTRAINT "FK3_comments_news";
       public          postgres    false    232    3726    238            &           2606    19513    depot_ticket FK3_depot_ticket    FK CONSTRAINT     �   ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK3_depot_ticket" FOREIGN KEY (staff_id_receive) REFERENCES public.staff(id) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.depot_ticket DROP CONSTRAINT "FK3_depot_ticket";
       public          postgres    false    242    3815    303            -           2606    19518 #   history_payment FK3_history_payment    FK CONSTRAINT     �   ALTER TABLE ONLY public.history_payment
    ADD CONSTRAINT "FK3_history_payment" FOREIGN KEY (bill_id) REFERENCES public.bill(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public.history_payment DROP CONSTRAINT "FK3_history_payment";
       public          postgres    false    250    3710    228            C           2606    19523    reports FK3_reports    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK3_reports" FOREIGN KEY (sub_report) REFERENCES public.reports(id) ON UPDATE CASCADE;
 ?   ALTER TABLE ONLY public.reports DROP CONSTRAINT "FK3_reports";
       public          postgres    false    297    3803    297            I           2606    19528    staff FK3_staff    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT "FK3_staff" FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;
 ;   ALTER TABLE ONLY public.staff DROP CONSTRAINT "FK3_staff";
       public          postgres    false    303    230    3714                       2606    19533    bill FK4_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK4_bill" FOREIGN KEY (payment_methods_id) REFERENCES public.payment_methods(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK4_bill";
       public          postgres    false    228    3772    277            '           2606    19538    depot_ticket FK4_depot_ticket    FK CONSTRAINT     �   ALTER TABLE ONLY public.depot_ticket
    ADD CONSTRAINT "FK4_depot_ticket" FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.depot_ticket DROP CONSTRAINT "FK4_depot_ticket";
       public          postgres    false    3791    242    287            D           2606    19543    reports FK4_reports    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK4_reports" FOREIGN KEY (type_report_id) REFERENCES public.type_report(id) ON UPDATE CASCADE;
 ?   ALTER TABLE ONLY public.reports DROP CONSTRAINT "FK4_reports";
       public          postgres    false    297    315    3839                       2606    19548    bill FK5_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK5_bill" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK5_bill";
       public          postgres    false    3809    228    301            E           2606    19553    reports FK5_reports    FK CONSTRAINT     �   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "FK5_reports" FOREIGN KEY (report_source_id) REFERENCES public.report_source(id) ON UPDATE CASCADE;
 ?   ALTER TABLE ONLY public.reports DROP CONSTRAINT "FK5_reports";
       public          postgres    false    295    297    3801                       2606    19558    bill FK6_bill    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT "FK6_bill" FOREIGN KEY (transfer_providers_id) REFERENCES public.transfer_providers(id) ON UPDATE CASCADE;
 9   ALTER TABLE ONLY public.bill DROP CONSTRAINT "FK6_bill";
       public          postgres    false    228    309    3827                       2606    19563 *   admins_notification admins_notification_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;
 T   ALTER TABLE ONLY public.admins_notification DROP CONSTRAINT admins_notification_fk;
       public          postgres    false    3829    222    311                       2606    19568 0   admins_notification admins_notification_staff_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admins_notification
    ADD CONSTRAINT admins_notification_staff_fk FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 Z   ALTER TABLE ONLY public.admins_notification DROP CONSTRAINT admins_notification_staff_fk;
       public          postgres    false    303    222    3815            "           2606    19573 0   customers_notification customers_notification_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk FOREIGN KEY (type_notification) REFERENCES public.type_notification(id) ON UPDATE CASCADE;
 Z   ALTER TABLE ONLY public.customers_notification DROP CONSTRAINT customers_notification_fk;
       public          postgres    false    3829    240    311            #           2606    19578 2   customers_notification customers_notification_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_notification
    ADD CONSTRAINT customers_notification_fk_1 FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE;
 \   ALTER TABLE ONLY public.customers_notification DROP CONSTRAINT customers_notification_fk_1;
       public          postgres    false    238    240    3726                  x������ � �            x������ � �            x������ � �         1   x�3����O�,�4202�50�5�P04�25�21�3c<R\1z\\\ ��W            x������ � �            x������ � �           x�U�ON�0����[w�+�b{W.\��i�@�?!¥�0;g��{p;�q���}�����2�>�ܭM��F����%7�I�^ȘD<D���p�A�`K�	F�ܶ���x0(�P��s����.��a7�_ۊ~=�^���m�U[��%LK��4h�G&n�������b�<k������/�z3��?��`�mliݓ�W2L�����K\�m���4G"��
ӕ���S�Ӑc,��%�K��'(�
n� ��i�      !      x������ � �      #   �  x��Tێ�0}�|�| �|Kl�m�K��/DM�ZGZ%H�7�?ƌ��e%h���X���K���_(���M�#g�VNI7c )K�`%�.�-�C�c�W�Y�J���a~�"�=����4.���S�M�p�8����j�|��_�F,QZ:O4�RZ��R�T��i�J���g��)>Qq��i�=����w���V�xqG�;�.\�5\�w�	=)�<ڀ� p︗�XS��	����+�܇�O��s��O
{��-�A/s������	)���$�"A3�巿a��"��6'p��g�m�#i�G�����Ftd�y���]�2�Uh#�X�o�|��xw#򎍗&�0��2���]�\�`
�o��^�LMZ���a?�]���$��Ǳ��&H	-���S|����S�3�?�ݒ�=V�t#�F�U������*����G      %      x������ � �      '      x������ � �      )      x������ � �      +      x������ � �      -      x������ � �      /      x������ � �      1      x������ � �      3      x������ � �      5      x������ � �      7      x������ � �      9      x������ � �      ;      x������ � �      =      x������ � �      ?      x������ � �      A      x������ � �      C      x������ � �      E      x������ � �      G      x������ � �      I      x������ � �      K      x������ � �      M   �   x�m�m
� ���0C]�uwkS�V�0���������b�B���\l@�3�����ذ#v� '	ش#JT���%A���<��C	�?p�`��+��~��q#vp��6~��/!�w\�9�Ofc-�A�"k��T"�y� �f}��J�kftb�Di�d��G���2�2X�]\�N�LTG��%}�vB�ґ��      O      x������ � �      Q      x������ � �      R      x������ � �      T      x������ � �      V      x������ � �      X     x�}�;N�0�k�s�D~��DO���#X�@��T���'�QSQ9�M0�P�M3�����(���X������w�F�0��Q�;!'9��j���@e�=�ط���4�������%�l�Ϸ ���%�j���%�P��P�D�c�u�m��sU���ʱT.���Ur݅�dZ�
Ґ����T��5v�<�O�sB-5va=�t���ij�/��ʤ��ZKjV��6�bR��T��,�7��6����XA��@خ���`�?J��|�c��g$ˮ      Z      x������ � �      \      x������ � �      ^      x������ � �      `      x������ � �      b   R   x�3�<2����y��w--P82���
��*dg$frr�p�X�Y(Y�X��Y��[X��240������ �O�      d   �   x�3��K?���
)�w�+d<�ݮP$'9�)��y�!E`g	�������%)�XZ��Y����2�kGriqI~nnj���q�\���73]�����������9).s���D4?ܽ(tx�X�ƛX���[XZ������� /#um      f      x������ � �      h      x������ � �      j      x������ � �      l      x������ � �      m      x������ � �      p      x������ � �      r      x������ � �      t   [  x���1N�0�g�> �l�8�3R�#5��\�^1WLHT����Z�!�{�&8�I
	O������5���Ll�SW��j6&g�_��6�E�e<UO�&rZ�:Kr;&�x��.=�M�`z��!2�3.�6\�b�4���A�_^m���� M5����h'��`��~�����#[��:��4,^ݯ�&c)��N6I����ذ�s$&uU��iI��Q��Q��#�͞:���f�%6��-�TT�8"ޑ��\�DJs%�)���oG�JW,�.f�Ѹ�s�udk�

�wRS��*����>v��
$o���aϘ���`�shI��E��(����-�      v      x������ � �      x   �  x��S?o1��O�&D�Z���]�X�Kɝ�.ir����JŀJ��!!ujN�+���I�K���ɂd�,��~��&/���Ϡ��gh&�=�&�?���ۯ%�u=�燃����H�rx��n\�����;$�� M�����Y\���6ܐ�H.�>�}� �7�s�T&,�; ���(:������ؾ���j8)�eM�+�n�pV��il��n����K͌@+���%��U�2Wc7𦌋�5�������EE&]f��1��±Lr��=�
Ry-�B��g)f� 1@z�Q��6b��b�ie������(�Җ"�ۋb�=)l�����g6�׫u%�8
�3��^��#u
�tL	e��������z�g�fTM6�V|���Lhv@ԉ'����a��ɋ��Cl���N��i�"\V�k�Ҿڜ�~��q7�ń��+F)��o_�      z   P   x�3�,��|�k�BIF)�!g	��������������������������).#�9�w-��(s33K<R\1z\\\ ќ$�      |      x������ � �      ~      x������ � �      �      x������ � �     