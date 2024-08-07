PGDMP  #    (                |           CourierCompanyDataBase    16.3    16.3 |    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    CourierCompanyDataBase    DATABASE     �   CREATE DATABASE "CourierCompanyDataBase" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Bulgarian_Bulgaria.1251';
 (   DROP DATABASE "CourierCompanyDataBase";
                postgres    false            �            1255    16398    check_admin_role()    FUNCTION     (  CREATE FUNCTION public.check_admin_role() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT role_id FROM public.users WHERE user_id = NEW.createFromAdmin) != 1 THEN
        RAISE EXCEPTION 'Only administrators can create courier companies';
    END IF;
    RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.check_admin_role();
       public          postgres    false            �            1255    16399    check_courier_role()    FUNCTION       CREATE FUNCTION public.check_courier_role() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT role_id FROM public.users WHERE user_id = NEW.recordedByCourier) != 2 THEN
        RAISE EXCEPTION 'Only couriers can record clients';
    END IF;
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.check_courier_role();
       public          postgres    false            �            1259    16400    cities    TABLE     g   CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city character varying(100) NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    16403    cityes_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cityes_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cityes_city_id_seq;
       public          postgres    false    215            �           0    0    cityes_city_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cityes_city_id_seq OWNED BY public.cities.city_id;
          public          postgres    false    216            �            1259    16404    clients    TABLE       CREATE TABLE public.clients (
    client_id integer NOT NULL,
    user_id integer NOT NULL,
    city_id integer,
    street_id integer,
    recordedbycourier integer,
    numberstreet integer,
    number_street character varying(255) DEFAULT 'Unknown'::character varying NOT NULL
);
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    16407    clients_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_client_id_seq;
       public          postgres    false    217            �           0    0    clients_client_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;
          public          postgres    false    218            �            1259    16408    couriercompanies    TABLE     �   CREATE TABLE public.couriercompanies (
    company_id integer NOT NULL,
    name character varying(255) NOT NULL,
    city_id integer,
    street_id integer,
    number character varying(255),
    createfromadmin integer,
    create_from_admin boolean
);
 $   DROP TABLE public.couriercompanies;
       public         heap    postgres    false            �            1259    16411    couriercompanies_company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.couriercompanies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.couriercompanies_company_id_seq;
       public          postgres    false    219            �           0    0    couriercompanies_company_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.couriercompanies_company_id_seq OWNED BY public.couriercompanies.company_id;
          public          postgres    false    220            �            1259    16412    couriers    TABLE     �   CREATE TABLE public.couriers (
    courier_id integer NOT NULL,
    user_id integer NOT NULL,
    company_id integer NOT NULL
);
    DROP TABLE public.couriers;
       public         heap    postgres    false            �            1259    16415    couriers_courier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.couriers_courier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.couriers_courier_id_seq;
       public          postgres    false    221            �           0    0    couriers_courier_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.couriers_courier_id_seq OWNED BY public.couriers.courier_id;
          public          postgres    false    222            �            1259    16416    messages    TABLE     b   CREATE TABLE public.messages (
    message_id integer NOT NULL,
    message_text text NOT NULL
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    16421    messages_message_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.messages_message_id_seq;
       public          postgres    false    223            �           0    0    messages_message_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.messages_message_id_seq OWNED BY public.messages.message_id;
          public          postgres    false    224            �            1259    16422    notifications    TABLE     �   CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    package_id integer NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    message_id integer
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    16426 !   notifications_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.notifications_notification_id_seq;
       public          postgres    false    225            �           0    0 !   notifications_notification_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;
          public          postgres    false    226            �            1259    16427    offices    TABLE     �   CREATE TABLE public.offices (
    office_id integer NOT NULL,
    company_id integer NOT NULL,
    city_id integer,
    street_id integer,
    number integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.offices;
       public         heap    postgres    false            �            1259    16430    offices_office_id_seq    SEQUENCE     �   CREATE SEQUENCE public.offices_office_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.offices_office_id_seq;
       public          postgres    false    227            �           0    0    offices_office_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.offices_office_id_seq OWNED BY public.offices.office_id;
          public          postgres    false    228            �            1259    16431    package_type    TABLE     �   CREATE TABLE public.package_type (
    package_type_id integer NOT NULL,
    package_type_name character varying(50) NOT NULL
);
     DROP TABLE public.package_type;
       public         heap    postgres    false            �            1259    16434     package_type_package_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.package_type_package_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.package_type_package_type_id_seq;
       public          postgres    false    229            �           0    0     package_type_package_type_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.package_type_package_type_id_seq OWNED BY public.package_type.package_type_id;
          public          postgres    false    230            �            1259    16435    packages    TABLE     \  CREATE TABLE public.packages (
    package_id integer NOT NULL,
    client_id integer NOT NULL,
    courier_id integer NOT NULL,
    registration_date character varying(255) DEFAULT CURRENT_TIMESTAMP,
    delivery_date character varying(255),
    package_type_id integer,
    status_id integer,
    price_id integer,
    cash_on_delivery bit(1)
);
    DROP TABLE public.packages;
       public         heap    postgres    false            �            1259    16439    packages_package_id_seq    SEQUENCE     �   CREATE SEQUENCE public.packages_package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.packages_package_id_seq;
       public          postgres    false    231            �           0    0    packages_package_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.packages_package_id_seq OWNED BY public.packages.package_id;
          public          postgres    false    232            �            1259    16440    price    TABLE     �   CREATE TABLE public.price (
    price_id integer NOT NULL,
    price_name character varying(50) NOT NULL,
    price numeric(38,2)
);
    DROP TABLE public.price;
       public         heap    postgres    false            �            1259    16443    price_price_id_seq    SEQUENCE     �   CREATE SEQUENCE public.price_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.price_price_id_seq;
       public          postgres    false    233            �           0    0    price_price_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.price_price_id_seq OWNED BY public.price.price_id;
          public          postgres    false    234            �            1259    16444    role    TABLE     h   CREATE TABLE public.role (
    role_id integer NOT NULL,
    namerole character varying(50) NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    16447    role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_role_id_seq;
       public          postgres    false    235            �           0    0    role_role_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;
          public          postgres    false    236            �            1259    16448    status    TABLE     j   CREATE TABLE public.status (
    status_id integer NOT NULL,
    status character varying(30) NOT NULL
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    16451    status_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_status_id_seq;
       public          postgres    false    237            �           0    0    status_status_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.status_status_id_seq OWNED BY public.status.status_id;
          public          postgres    false    238            �            1259    16452    streets    TABLE     l   CREATE TABLE public.streets (
    street_id integer NOT NULL,
    street character varying(100) NOT NULL
);
    DROP TABLE public.streets;
       public         heap    postgres    false            �            1259    16455    streets_street_id_seq    SEQUENCE     �   CREATE SEQUENCE public.streets_street_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.streets_street_id_seq;
       public          postgres    false    239            �           0    0    streets_street_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.streets_street_id_seq OWNED BY public.streets.street_id;
          public          postgres    false    240            �            1259    16456    users    TABLE     d  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    role_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone character varying(15),
    role character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16459    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    241            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    242            �           2604    16460    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cityes_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16461    clients client_id    DEFAULT     v   ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);
 @   ALTER TABLE public.clients ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16462    couriercompanies company_id    DEFAULT     �   ALTER TABLE ONLY public.couriercompanies ALTER COLUMN company_id SET DEFAULT nextval('public.couriercompanies_company_id_seq'::regclass);
 J   ALTER TABLE public.couriercompanies ALTER COLUMN company_id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16463    couriers courier_id    DEFAULT     z   ALTER TABLE ONLY public.couriers ALTER COLUMN courier_id SET DEFAULT nextval('public.couriers_courier_id_seq'::regclass);
 B   ALTER TABLE public.couriers ALTER COLUMN courier_id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16464    messages message_id    DEFAULT     z   ALTER TABLE ONLY public.messages ALTER COLUMN message_id SET DEFAULT nextval('public.messages_message_id_seq'::regclass);
 B   ALTER TABLE public.messages ALTER COLUMN message_id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    16465    notifications notification_id    DEFAULT     �   ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);
 L   ALTER TABLE public.notifications ALTER COLUMN notification_id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    16466    offices office_id    DEFAULT     v   ALTER TABLE ONLY public.offices ALTER COLUMN office_id SET DEFAULT nextval('public.offices_office_id_seq'::regclass);
 @   ALTER TABLE public.offices ALTER COLUMN office_id DROP DEFAULT;
       public          postgres    false    228    227            �           2604    16467    package_type package_type_id    DEFAULT     �   ALTER TABLE ONLY public.package_type ALTER COLUMN package_type_id SET DEFAULT nextval('public.package_type_package_type_id_seq'::regclass);
 K   ALTER TABLE public.package_type ALTER COLUMN package_type_id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    16468    packages package_id    DEFAULT     z   ALTER TABLE ONLY public.packages ALTER COLUMN package_id SET DEFAULT nextval('public.packages_package_id_seq'::regclass);
 B   ALTER TABLE public.packages ALTER COLUMN package_id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    16469    price price_id    DEFAULT     p   ALTER TABLE ONLY public.price ALTER COLUMN price_id SET DEFAULT nextval('public.price_price_id_seq'::regclass);
 =   ALTER TABLE public.price ALTER COLUMN price_id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    16470    role role_id    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    236    235            �           2604    16471    status status_id    DEFAULT     t   ALTER TABLE ONLY public.status ALTER COLUMN status_id SET DEFAULT nextval('public.status_status_id_seq'::regclass);
 ?   ALTER TABLE public.status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    16472    streets street_id    DEFAULT     v   ALTER TABLE ONLY public.streets ALTER COLUMN street_id SET DEFAULT nextval('public.streets_street_id_seq'::regclass);
 @   ALTER TABLE public.streets ALTER COLUMN street_id DROP DEFAULT;
       public          postgres    false    240    239            �           2604    16473    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    242    241            d          0    16400    cities 
   TABLE DATA           /   COPY public.cities (city_id, city) FROM stdin;
    public          postgres    false    215   ��       f          0    16404    clients 
   TABLE DATA           y   COPY public.clients (client_id, user_id, city_id, street_id, recordedbycourier, numberstreet, number_street) FROM stdin;
    public          postgres    false    217   )�       h          0    16408    couriercompanies 
   TABLE DATA           |   COPY public.couriercompanies (company_id, name, city_id, street_id, number, createfromadmin, create_from_admin) FROM stdin;
    public          postgres    false    219   Y�       j          0    16412    couriers 
   TABLE DATA           C   COPY public.couriers (courier_id, user_id, company_id) FROM stdin;
    public          postgres    false    221   M�       l          0    16416    messages 
   TABLE DATA           <   COPY public.messages (message_id, message_text) FROM stdin;
    public          postgres    false    223   s�       n          0    16422    notifications 
   TABLE DATA           V   COPY public.notifications (notification_id, package_id, date, message_id) FROM stdin;
    public          postgres    false    225   2�       p          0    16427    offices 
   TABLE DATA           T   COPY public.offices (office_id, company_id, city_id, street_id, number) FROM stdin;
    public          postgres    false    227   6�       r          0    16431    package_type 
   TABLE DATA           J   COPY public.package_type (package_type_id, package_type_name) FROM stdin;
    public          postgres    false    229   ��       t          0    16435    packages 
   TABLE DATA           �   COPY public.packages (package_id, client_id, courier_id, registration_date, delivery_date, package_type_id, status_id, price_id, cash_on_delivery) FROM stdin;
    public          postgres    false    231   ��       v          0    16440    price 
   TABLE DATA           <   COPY public.price (price_id, price_name, price) FROM stdin;
    public          postgres    false    233   D�       x          0    16444    role 
   TABLE DATA           1   COPY public.role (role_id, namerole) FROM stdin;
    public          postgres    false    235   ç       z          0    16448    status 
   TABLE DATA           3   COPY public.status (status_id, status) FROM stdin;
    public          postgres    false    237   2�       |          0    16452    streets 
   TABLE DATA           4   COPY public.streets (street_id, street) FROM stdin;
    public          postgres    false    239   Ȩ       ~          0    16456    users 
   TABLE DATA           p   COPY public.users (user_id, username, password, role_id, first_name, last_name, email, phone, role) FROM stdin;
    public          postgres    false    241   ��       �           0    0    cityes_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cityes_city_id_seq', 10, true);
          public          postgres    false    216            �           0    0    clients_client_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.clients_client_id_seq', 1, false);
          public          postgres    false    218            �           0    0    couriercompanies_company_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.couriercompanies_company_id_seq', 20, true);
          public          postgres    false    220            �           0    0    couriers_courier_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.couriers_courier_id_seq', 75, true);
          public          postgres    false    222            �           0    0    messages_message_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.messages_message_id_seq', 3, true);
          public          postgres    false    224            �           0    0 !   notifications_notification_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.notifications_notification_id_seq', 246, true);
          public          postgres    false    226            �           0    0    offices_office_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.offices_office_id_seq', 72, true);
          public          postgres    false    228            �           0    0     package_type_package_type_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.package_type_package_type_id_seq', 4, true);
          public          postgres    false    230            �           0    0    packages_package_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.packages_package_id_seq', 461, true);
          public          postgres    false    232            �           0    0    price_price_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.price_price_id_seq', 6, true);
          public          postgres    false    234            �           0    0    role_role_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_role_id_seq', 7, true);
          public          postgres    false    236            �           0    0    status_status_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_status_id_seq', 4, true);
          public          postgres    false    238            �           0    0    streets_street_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.streets_street_id_seq', 1, false);
          public          postgres    false    240            �           0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 191, true);
          public          postgres    false    242            �           2606    16475    cities cityes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cityes_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cityes_pkey;
       public            postgres    false    215            �           2606    16477    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    217            �           2606    16479 &   couriercompanies couriercompanies_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.couriercompanies
    ADD CONSTRAINT couriercompanies_pkey PRIMARY KEY (company_id);
 P   ALTER TABLE ONLY public.couriercompanies DROP CONSTRAINT couriercompanies_pkey;
       public            postgres    false    219            �           2606    16481    couriers couriers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT couriers_pkey PRIMARY KEY (courier_id);
 @   ALTER TABLE ONLY public.couriers DROP CONSTRAINT couriers_pkey;
       public            postgres    false    221            �           2606    16483    messages messages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    223            �           2606    16485     notifications notifications_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    225            �           2606    16487    offices offices_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (office_id);
 >   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_pkey;
       public            postgres    false    227            �           2606    16489    package_type package_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.package_type
    ADD CONSTRAINT package_type_pkey PRIMARY KEY (package_type_id);
 H   ALTER TABLE ONLY public.package_type DROP CONSTRAINT package_type_pkey;
       public            postgres    false    229            �           2606    16491    packages packages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package_id);
 @   ALTER TABLE ONLY public.packages DROP CONSTRAINT packages_pkey;
       public            postgres    false    231            �           2606    16493    price price_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (price_id);
 :   ALTER TABLE ONLY public.price DROP CONSTRAINT price_pkey;
       public            postgres    false    233            �           2606    16495    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    235            �           2606    16497    status status_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    237            �           2606    16499    streets streets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (street_id);
 >   ALTER TABLE ONLY public.streets DROP CONSTRAINT streets_pkey;
       public            postgres    false    239            �           2606    16501    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    241            �           2620    16502 %   couriercompanies trg_check_admin_role    TRIGGER     �   CREATE TRIGGER trg_check_admin_role BEFORE INSERT OR UPDATE ON public.couriercompanies FOR EACH ROW EXECUTE FUNCTION public.check_admin_role();
 >   DROP TRIGGER trg_check_admin_role ON public.couriercompanies;
       public          postgres    false    219    243            �           2620    16503    clients trg_check_courier_role    TRIGGER     �   CREATE TRIGGER trg_check_courier_role BEFORE INSERT OR UPDATE ON public.clients FOR EACH ROW EXECUTE FUNCTION public.check_courier_role();
 7   DROP TRIGGER trg_check_courier_role ON public.clients;
       public          postgres    false    244    217            �           2606    16504    clients clients_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_city_id_fkey;
       public          postgres    false    217    4774    215            �           2606    16509    clients clients_street_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_street_id_fkey FOREIGN KEY (street_id) REFERENCES public.streets(street_id);
 H   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_street_id_fkey;
       public          postgres    false    4798    239    217            �           2606    16514    clients clients_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_user_id_fkey;
       public          postgres    false    217    241    4800            �           2606    16519 .   couriercompanies couriercompanies_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.couriercompanies
    ADD CONSTRAINT couriercompanies_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 X   ALTER TABLE ONLY public.couriercompanies DROP CONSTRAINT couriercompanies_city_id_fkey;
       public          postgres    false    215    4774    219            �           2606    16524 0   couriercompanies couriercompanies_street_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.couriercompanies
    ADD CONSTRAINT couriercompanies_street_id_fkey FOREIGN KEY (street_id) REFERENCES public.streets(street_id);
 Z   ALTER TABLE ONLY public.couriercompanies DROP CONSTRAINT couriercompanies_street_id_fkey;
       public          postgres    false    4798    239    219            �           2606    16529    couriers couriers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT couriers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.couriers DROP CONSTRAINT couriers_user_id_fkey;
       public          postgres    false    241    4800    221            �           2606    16534 #   couriercompanies fk_createfromadmin    FK CONSTRAINT     �   ALTER TABLE ONLY public.couriercompanies
    ADD CONSTRAINT fk_createfromadmin FOREIGN KEY (createfromadmin) REFERENCES public.users(user_id);
 M   ALTER TABLE ONLY public.couriercompanies DROP CONSTRAINT fk_createfromadmin;
       public          postgres    false    241    219    4800            �           2606    16539    notifications fk_message    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_message FOREIGN KEY (message_id) REFERENCES public.messages(message_id);
 B   ALTER TABLE ONLY public.notifications DROP CONSTRAINT fk_message;
       public          postgres    false    4782    223    225            �           2606    16544    packages fk_package_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT fk_package_type FOREIGN KEY (package_type_id) REFERENCES public.package_type(package_type_id);
 B   ALTER TABLE ONLY public.packages DROP CONSTRAINT fk_package_type;
       public          postgres    false    231    4788    229            �           2606    16549    packages fk_price    FK CONSTRAINT     w   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT fk_price FOREIGN KEY (price_id) REFERENCES public.price(price_id);
 ;   ALTER TABLE ONLY public.packages DROP CONSTRAINT fk_price;
       public          postgres    false    4792    233    231            �           2606    16554    clients fk_recordedbycourier    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_recordedbycourier FOREIGN KEY (recordedbycourier) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT fk_recordedbycourier;
       public          postgres    false    217    4800    241            �           2606    16559    users fk_role    FK CONSTRAINT     p   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES public.role(role_id);
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_role;
       public          postgres    false    241    235    4794            �           2606    16564    packages fk_status    FK CONSTRAINT     {   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES public.status(status_id);
 <   ALTER TABLE ONLY public.packages DROP CONSTRAINT fk_status;
       public          postgres    false    4796    237    231            �           2606    16569 +   notifications notifications_package_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.packages(package_id);
 U   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_package_id_fkey;
       public          postgres    false    231    225    4790            �           2606    16574    offices offices_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);
 F   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_city_id_fkey;
       public          postgres    false    215    4774    227            �           2606    16579    offices offices_street_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_street_id_fkey FOREIGN KEY (street_id) REFERENCES public.streets(street_id);
 H   ALTER TABLE ONLY public.offices DROP CONSTRAINT offices_street_id_fkey;
       public          postgres    false    227    239    4798            �           2606    16584     packages packages_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 J   ALTER TABLE ONLY public.packages DROP CONSTRAINT packages_client_id_fkey;
       public          postgres    false    4776    231    217            �           2606    16589 !   packages packages_courier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_courier_id_fkey FOREIGN KEY (courier_id) REFERENCES public.couriers(courier_id);
 K   ALTER TABLE ONLY public.packages DROP CONSTRAINT packages_courier_id_fkey;
       public          postgres    false    231    221    4780            d   |  x�eUmR�P�m�"'����]z� 
?
�t�@[(3��!��ĉ��ލ�+9I����=�I����#��}x�m8�$�[��י.�ՙ��~�i��Z��Ezp��jO�H�p��F
$	�8�N�� �gl��ѵT�^"�#���Xj�Xɾ��H��Gz��5��<:�h�Ib@��'��W��ï�� ����΁�5qIJ-+�T'T��+���v6�.�!�vș ٹ���Y�񸍉�1yZ]J�?��.M�^��>��#	D>��4�S$`L��:�Z�'܀�$���g��{�a�c�*#��g�MA��GTx�����dJ�r�]&A:Ȍ�#i�7�1>�����f�h	�rX�S�ws��B�FR�ªP����JZ�h��R �6�݀85[x�H6�
�\]8�Y̊�h(3�FO���F2���*p'� 2�w�,=Z�vd@���g��	��KV8�t��d�6z�*�E���&����M8�|�W�������phn\1����=<�.��s�O=��<s�N8ι�d͘��D��y�^�xsT&���|���L�rh�s�μ���85�vx���v���I/�r3z�{�"5�9i�d����`k_�F`t��WN��(
N���I���z��n
5����!�5VZ	̷f
3���x�������s�Q#e����l�i�3���`g�f���`,-�����l��%0߄��栃*�=�č �
W��/dmZV�{a6lz��*�_I��v�z˺*|)w�A�S�+�]�;���+1b���הo��R�^�y;5��إ�#�3{ 5�?pI��Ժ�%�}�K�q�yb�F�->�Xu�e��X������5q�;����Mg[�g��~䝱��nA�5l�x���ᐷoD��P�      f      x�M�Kn7D��a��_:Hv�A g���=�6\F	����i���J�o��������������ޥ�ǇO�l��O��m��g{�}���=>۳����\��g{�S�ke�>��d-M?���r:����?��[Π4�;���O�3��:���G�����<1��	�3yj�*�����?7T ��<=��*�gj:@�[Ce��35M��m�����>P��P9��LM+�G���x��ԿS�3-ݠ�]��l�ￕ�U����ߣ�бt����"����?�2�F[ڡ ك@Ǐ�~�@ !�1��!J�Bt��tD	���%--Q�<BOzz���M�4E	r		��_F�lB��{ڢ���IJ_� ��0��$��{�����鞾(AF!0h��/JR#��(AJ!a��%�)$hz�/J�SH��H_� �����zm�H*$hz�/JUH�K_� �����%+&M��E	�
�I�#}Q��B`��H_� ���陾(A\!�=}Q��B��g��q�M��E	�
	���wꌸB��g��q���ݓ�(A\!�|��/JW,������g��q�M��E	�
	�^����%�+$hz�/JWH��J_� ������pV���W��q������(A\!���%�+6M��E	�
	����4��%�+�(mQ��B���tE�
	>JS�OV!�avz�OT!�Y��ޑT�g�i�>�T�g�iɾ�Tȕ�XZr�H*��[,-95�
��MKN��B�����H��A����)gDR!W�++fW^�i����!��8����)xm�׌r"���>�9xq���	aŠ ��o�#BL
����/�+F��z�����n��Sax�����H*����n�rW$rbp�H_B����/�DV!��z_�ۍ�B����g�'��?����渧Fd�������W��|�k{Ͱ��7�,�#�k�{Fw���o�5�=3�{~'���`��Pc����o�o�Y'��p�����#x]�ר��P�̒V{��H�̒WV{ͼ�����\B�5      h   �   x�=��j�0D���Ǣ�-ɾ�����и�\L,� ���B��]!S���͢�]�e�v��%��S%1܂Otm���3�@����:_@�¥M�
ov� �%�d�1�F6�^-�Bv?�������S�?�A��f�Ç�G�mA;s�(=+ɮ�pw1����N��%��iqs�c�mI�������<͖�$�/�c=<7�7�%�G
\�y/Yj2D���UU��,G;      j     x��K�� ����L��˻�9F�&rE�$��(-�C[S�g�jo?���GY�*�:09�T�V�r�C����d����L6I�@V�WŒ/�5ߐ*�U����"��꼡U��K�3��;�$���L�&9����[�5.����5�z�,�j�s�\wȹ̡����lw���l��烮7\5g|O3���/�2�h�>f�		��̭Œ@�29 ���ZM=r-���<&?�Ro����t<v���p<~�7p-�x>ࠁ�V�N��'��/"���U1      l   �   x�mO9�0��W�����c�����`����/����(�bW;�ٙ���$%z��xD���{����(E���-��4J�����%Ӓ˝�i&��j��pU�R�kim�@��E*&s�yR��Uj~+���Fّ~{.=��8a�X�ev�G7$e�H���)��Mf�}yM��      n   �   x�U��m�0�Rl��%%Y�%���xu�c�!����r��ﯡ�Q�|{�	?$z�IC<�ц�0�c�m�L�xl�j��|���/�ǫ(Ei�+���hh�2G�����(:E�6�߲�]��~E/�K�T�E��6��<���a�EUu��0W+��b�0W+��x\:�UiԵ����0���jE��4���jE��2��\��V��q���
ۜ��Z�Z���0���i�}��� (n��      p   ]  x�5�[r�0���lORw��ϱh*���8�tƎ<r��������J~�W�b�'*fǬ��5�gW<Oŷ~M�y+��\��$ɛt�F�:���)gU�:P'� Ͳ�|����a��׽�5��P^�޿X?�A�������q��쌅�;�"��3��F������w2L���S���[�TF�� ���VF������S���~����w��m�����Gx�R���G8���?�����шus`r�
$B;�6_3���/z�@ r���=UPg��x{��>WCҟr�J�S;ӟ�S%���g�Ty�r��ܳT"��#����6[f���֏�������/�|�      r   F   x�3�0���;.��2�0��> g��&.c��A����(\�aÅ]`q����.l������� �%r      t   ;  x��X۱�:�f�p{K �� 6��?���BX?V�S[�@�Ս�dH@��O��Aψ��C���R ��Ё����������P*��2��t`�bX�>�A�*G���W��Y�� m��>��LoI�2Tiq.�|^=(�����S����Ah��YV��$���~1�iO�)#�F[����EӟNSZ��'�����6��ބ,��,��B�ق�.�5]��_�;a�k�`gL~M�)�	��1�5a�3��&��	�	C5�+��=c0�v�%�Z읐��)�|ۢ��d.�^
�N�3��`{��P�t)x��#�w&)%hR&M�=�#���R��9O�=�#��LS*�Dh�T��c;B��<�
M��T��H��;�4AoSu3�о3S��Nf��ѐ�U#B���T���CG~\�M&C�z�������d�����4����(WJ&öz��W��)�H��{�PY�o���|}��O��X|J#��O�m|���j���H���M3@����#��Kr�B�	�}j�O�e)�Mɧ��JRV�G�0���S()��
���E�5Vc�j%]�Z��)Y�Yf%&
l�}�Y��lc�"�B����ˬ\*��E��Vc�P�,
*�jȓIU��zNX4:4H�"�g��4�^�	��Q�@�M��^7Q�����ӧ���'��m�?�[LL�$Q�����T��h��^�l�?n�H����BA�������1�c�y��*R:b���T�_Pj~�(�ԩ���d�Bӣ�
�����d���#�&���U�_N2���R��H.�2���S<��I.�2���T\㽕���IfC4��.%��q9�,��פk	�	��(�=���u1�<!xE�*�^��&X,¼!�]�E�U��aވ4�Ll��t=�m(��8b���eB�>�Gl�*[
ὥ\�Sӈ�^eO!���!��lbw���P�7�!��2b�W�
Oŧ�3�����	��Զ��(<:�Ah.U�Qxt����M�+�£��lBZ�o�� x6a\�/�#�c<��W
̲��c<�0�4��J?��	�J�Y����لe��,�܏E�lº�aN���M�V:�b?����J��@�� �g�J�e׎��l"Z�,۱���Dq�òls?���x�òls?�ÔV:,�6�c:Ly�òl�yz�mO�U{��e���tY�w=]ߤ6=]ߤ6=]ߤ6=]ߤ6=]ߤ6=]ߤ6==�˛Ԯ�˛Ԯ�˛Ԯ�˛Ԯ����%l{z�mO/���%n{z�mO/i��K���R�=]��}��K����=�⶧W����=��״�����|>���~      v   o   x�3�0�bÅ�.캰A��.��ra��F�� (����T���ˈ�r�r#�rc�� ���M���paPl+�{��AL�� u��H�`n2����� �%�{      x   _   x�3�0�{.츰����.6\�p��¾�\F�f]l
츰Dr.�q/����e����e�	��9]|=��b���� ~v.�      z   �   x�M���0D��*�$>�P�m��rɅ3P��J���lG��8����<��F��Q�<zD�$���a�8Sh�	E)��9S��� ��	�=�������MN/�NX[�>���W�b��ND~6n�      |   �  x�}V�r�F>k�B/ �Z��$I(S�)�	+l���dW��6�>�L��c*rH��]��]�Fo���jf��r�Z�g������O�V^��6�6٤��夭͌O�u�Wuv�l��l�
�'f��-��)��~��#b5o��:���9�e��j���0��j�8͙h��k8����7�i�$n��s6��c�W�õk�k��N�ؘ��i���~��6��sb��XKx7+m�
8��1�jKg��8�r�b�� �lXӁ_�[C0���#!��i"������c`"_�5b82U�]@�cb��p��d=�M` bb�^b=g�3c��P��:�&/{[����f��z�	/Y�8��-��Q��n�%A�+��v��/�9e܃�AM.�����W�E��3|ʵԶ��:hK� ����\(c܀�w������p��up_6 @���s�6z5W�X�9�����p����eM1�>����)�x�>�?bZҖ�>Hc>{SPq �0�x��O��Hs��&�l8� ���d�̺b�iĎ��8��6+�^�L�}b�$�vF,CE���!��Vb@&�յ�,�=�%b�F��xŇ�RTP"�8Gp���F��%{���qJ,��E�o� �(��(�pj��-Y����g�ې�v9�ϰZ�@��W�+��mJe�6-�A��%����Bl[f \����՞�RT��ve������=�K��}Ŏ�%��S����^h��<�''��&=�cuj�r��rW�f�Sm(�6�`�q�G��GrApXF�Q�s0�� �q6����� 8=�	q|)�u�pk��;��%�HA\C��`F6��
�r���Յ �9�Uj��z��r���Sԇ����Mf�W@~�/�	L>���JJ�v��Su�s�஀|=U�oPm��D_��<C-K�48�{�S��e�U����O����̱��U�n�	��9�rQ�P$ ���8b����=_M��~k^�~9�_���Ꮫ�m�� p�*��þ3^Q�RŇB�r���0��|2��50���}Y-����!�}EE�3�D�g��R��|�-C�L��~+K� C[���;��#-��,q&-���B����G��t�W����W���Z/
��h�{�Q�F����� ������qq;A��c���]_M�Lϒ4��v��k_'a�I��+i��� ��Z�RH�l�/����[��8���_������Fx�Ԯ&4֗�Sx���4z�nD�
��Ƹdk4�8�K�mM���h_%�ު� ��n�8��Y��O���Μ�׮O�H�,�y�1���74	�Jݙ����|\]�;��(M��ւx�Mmizt;����z/MW������[����,��e�Q��hK4�͛|��i�
��h-H�g�|�
�&�.|��A�I���	!� 94�k      ~      x���I�������C� ny/��Sr�2�x8��gt��r��5��x�z�Y�Ȓ���?JWUW5@M3�prAwc��f_m]�����~�&���JM�d����v�}!�����I���,����=�7������k��u~�󟼦I�Fa�}���z���W�� �������eN^��3(π�O�� ���#�����i����a���Rk�jI�E�����ܾ¾�>B���[,����.����닳e�-i7�\,�j�'�/��
������n�j��{KMf7|	�=��"^��w�F<�}>�����U?+�Y�W �b�F�~��]��� Ӑ�?��g��܃�f�y+3X�᷸�gaͰOh�ݛ4[;�NV�|��f�40g�s:�������}z�p���,����kN���d�^${��i���h|<�6��~���i@s1��w(_��J�W���z�ov�;���w��l$Ti�]��d��р�+.��G\�a�o�1����¥Ku�^���$#��
Zeb�ٟ��>��s�Ң��ݬ��Y����|�Ȫ��E�{w��v8��O�]_`s=T�DZ����V��
�{oݠ��]/��e����JdUUQ,�j@�g�{�<��6��y���}�mN8b��(�1� ���EP��%��ͺy[�5�p]�$�&�e��8 �X�.���_P�[-r��(�1� �]��HG������d� cA���F��,c��6�9�A���y�����T�(�9�A�G ��.�r���C�{�>m�D�����:i0 ��A'Q�[.�-s���N�	��}�]Xr��YXn[�pљ�E u2����Jz����	C�DN��\o�+�P��T�j*4�_�����!r���[�]ϻ�b5k��etJ��j��*Te�"~*+�FEx�^s��P-�T%S�l�k���~��0ڷ��=�O��fBh��O��Bz�n+$׈UɄ*���bRkĆ�dDZя��hG�=�Mils;���*S���wh1�z�t4�ܟ.��E��$��MUɨ���f�/z��E��~x�x��F��XU���F��z//��{�3${�/N�`���̓�a\'Ƶ"�8{=������g-��˂;��jD�$?y�(G�ꧩ����b�5rm�k������ 	�;(�"�[x��E��0��ڒs��l�h@.ά=��5��e#,�ĲN�0�����l��mAmN��ȴ�ubZ{zQaK6�!ٳ�2�����5rl�c�8���ghs7�!��>,w�� k$�
�:������;���i��p��2�jU�P�� _=m���Ԯ.ڢ]e�'[S�*��D�))��!�N4���c��e#�V�4�L�Ho��@�`�6�7�'�w�?��E��~I�dZ!�$2�����o��o�P�wf��⢀&���Ӧ0vǒ�6=�2�����
j2�� �V@5	Tc)T���[��ͫ�hǦݪM�����k]��5��$T�2+a�{�:�W�[�HF`� k�����MP���o�����4� �Nv&��	�&Al�C��9v±I��c�8���e�Y�e�B��lȷ�M��4Y����Ԝ�SyM� �N��	x[��忤YҀ��`��&;%�{������Ah�Z��q�6��^'��ĸգ, ���L �C��1f2A��u�P�&&�(F�Q1�� ��1�:hH�썊]�^�W�f���@3��d�	��@n�֑=z�a�pZ� ���Q7�l��^H��t��qo�e�p]�?�W��Cc/\�ĵ�Ʃ�l�woE}��C����Ή�{A�&�mt����Oy3��5k�0��yv/���m(.���N��/BG����خLAI\yкO ��'�T�M{�%��:,hs���B�Kd;-ꏁ�Y�3�M!�^�v	kg�ك��2D�O��K��������48���B�� ����C ����߱8�CdHM�w �>����d�I�J��C�v�kF0�\	�.���/pG���8Ͳ�R"�;���J�v	o'��*�;ٽ3�����	�rs"ޕ��ޮ���R2���^�u�Ӷ�6� ޕ�������9�q���C�d�#蕀��A�Sd�߃.��� ���B�+A�'�="�g:� 4���~�^Ԝ_']#�g�%�0#��IO�ކm�A
d��U�z[�&�	&Rq�Z�q
�⬫�����>!�}�OY���ě���;��yg�깃��;�4O�g�%�0-�)�������gI�qg��9�-)7����Y�Ns���bo$\�����$���&�Ʌ��������O�ż�f���9�-�6U�9��I�&s���,L0�����M�*j�wK�M�t�"��-u���=���7+��QKЫ`E��A�� �����I2o��ӋKDK|��x~ѭ:�b';*�Z�i�H�����GEQ3ɒdӚ��$��#���3z���I�T�6t�rXz�i:�f�%�-��|��4�>3ʒqӎNx8�pin�fɴiOu�%'�Q��+pQ�|��4��0˒p���C��Fj�V2o���/��6����4�z�y���iÜJ�͔|B�͐��qF�G�h<��l9�0���3*ny:zM��R������D��#cF�h:�=0�0�jèJ�Ͱѽ��(gن��ܛ�fR�O8ʏjgt���Ѵ�=�^��ѱu�K��8r�n��6�����d��o� s�JIJ�Y2oi����3TZR2ڒ�3��$l�Fa��^�1g�Ƥd�%	g����<5�U��L�$�,�Ę�J��)����b���b�JNJ&]roV�Wq�I1Ku(�Ԋ0����_�,%f��d�%�fc5�!	1Kd+&[�m��C�Q:�Ê�4��c��֒a6V�1ޒ���0�:0f	l�`K��m��I�Y�X1Ē\�ͭ�$KKY�$�\)��D�%���K�lNIppi*G@K����}P���R�%�6g$.�A����؋�u�֍�#��L�lα�w��)G�K5�$���	:IN9�Z��$���RS.�2̒`s��)*�VR#&)5�P��i��њ����G��K����� �x�\r�f��(�L�d�<R�W|�_;�Oz��=�6��_E�J3ߞ�����Цa�����w#b�[=u+�|{��#�O�v���lܯ��ܺ	r͐{��#�_��:%�0?�)�T[)�d�=�'��HeH�!�:]���:$���M���Kͨ�yn����
n� {�Wl�b5�tc����+y\��6��g|=�b�P���n�*,!�kvͱx�����o8y�`�Jwnl�v�(wr��h6Ls�4We*5F�����Ox������.��0�S\��S�ʄy�l��ahsSP��2�q�Wz�u��SG���0�C\�qf5֨��%,e��f|1�(U�Y�����Dç��=�?Վ*�<W�s��/�]x�	�a�K�y�^ǔ:�y�g+���s���f��/ⴖõ�lb�2ÕT~W�x�&��ͫ�R��λ5�n���Hl[f�b���C���r�E)�4����6;qn��9�ra6PND:$��lרʩ��?�`�k��.c���1�c9Y�<�Y���B\[�f�kE�֎?��5���}��~O�JJ�e�k��)^���Ý��=�7�=y�,U�1���H������Z�f�a֤��I�P����x͌ז�@�q�5��.��0�Nv.b�1�5�_�[��To��_3��&�/E{ɐu�qۡ�6;i'�i����aD#��0�U��u���J+�U9&���A�QД���x�>$�ei�Z�f-PK�9�Hï�A�M�~v�C-4�_D:��hX4�-i�:~���7����PU9�a�MA҆Opx7D���=2�qǌ7�xc��Q|����cf�x?�T����0���EKT��<s�0��;8��RU���Yo��2�����8#���>I%��3�s�T�<㘆W~�up�J%��|��\75I�����P�gv�ԫ�Fϊ��^t��ͮ����Id���*����kc��F��vd�$�����RwR*��t�{1eMe�a��.��<�)�&�ԛ�1#>>c�9_��� H  ���ǯ1�T��RrR������7��`��=�L?��R~RJ�I�/���Cqp�C�{�>~�YI�I)u'�c_�Q��v�M��a��TUR~RJ�I�����L���[1�;i��ƹ������&����2&���X�W>΂ ?�j���<�x%e(�ԡ��m5y�DUU��RJQ�F�	�)#�WC�UU�y�������Q�Ѱ�(��g ��d��L�F��S5�J�d���
�>��f�v}2�v��	49��ւv�&�r2:��&���5�-9�<j���6���A{�5K�fTmv���<U��TV��ʨ��s$��A�?�-�1P�?#��N�e����˾����>��3�P˽�`Nf�J̾��bw�mP���jq��p�X�d�é�,Ւq1�m|驤L���TTFUe7q,=��)�%SRL���l�IR�w�F��c���r���1ˏ����g�)�P��0�q|�e�2���D�H�*ﬡ�/����zrvo��l�-'��M.������/������H����MU�� A
Iz��M��6^RS�u�Z�E��O�=��ݳ������ �iƇ     