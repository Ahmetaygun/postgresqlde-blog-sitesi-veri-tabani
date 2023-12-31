PGDMP         +            
    {            odev    15.5    15.5 Z    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16637    odev    DATABASE     y   CREATE DATABASE odev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_T�rkiye.1254';
    DROP DATABASE odev;
                postgres    false            �            1259    17244    rozetler    TABLE     �   CREATE TABLE public.rozetler (
    "Id" integer NOT NULL,
    "KullaniciId" integer,
    "RozetIsmi" character varying(30) NOT NULL,
    "RozetSinifi" character varying(30),
    "VerilmeSayisi" integer,
    "VerilmeTarihi" date
);
    DROP TABLE public.rozetler;
       public         heap    postgres    false            �            1259    17247 
   altinrozet    TABLE     �   CREATE TABLE public.altinrozet (
    "RozetId" integer NOT NULL,
    "AltinRozetGereksinim" character varying(255)
)
INHERITS (public.rozetler);
    DROP TABLE public.altinrozet;
       public         heap    postgres    false    214            �            1259    17250    asagioy    TABLE     [   CREATE TABLE public.asagioy (
    "OyTipiId" integer NOT NULL,
    "ItibarEksi" integer
);
    DROP TABLE public.asagioy;
       public         heap    postgres    false            �            1259    17253 
   bronzrozet    TABLE     �   CREATE TABLE public.bronzrozet (
    "RozetId" integer NOT NULL,
    "BronzRozetGereksinim" character varying(255)
)
INHERITS (public.rozetler);
    DROP TABLE public.bronzrozet;
       public         heap    postgres    false    214            �            1259    17256    kullanicilar    TABLE       CREATE TABLE public.kullanicilar (
    "Id" integer NOT NULL,
    "KullaniciIsim" character varying(30) NOT NULL,
    "KullaniciOlmaTarihi" date DEFAULT '2023-12-08'::date,
    "KullaniciSiteBaglantisi" character varying(50),
    "KullaniciProfilResmiBaglantisi" character varying(50),
    "SonGorulme" date DEFAULT '2023-12-08'::date,
    "ProfilGoruntulenmesi" integer,
    "HakkindaGovdesi" character varying(255),
    "Yas" integer,
    "ItibarSayisi" integer,
    "ZiyaretEdilmeSayisi" integer,
    "SoruSayisi" integer
);
     DROP TABLE public.kullanicilar;
       public         heap    postgres    false            �            1259    17261    editor    TABLE     �   CREATE TABLE public.editor (
    "KullaniciId" integer NOT NULL,
    "DuzenlenmisSorular" character varying(500),
    "DuzenlenmisYanitlar" character varying(500),
    "DuzenlenmisEtiketler" character varying(100)
)
INHERITS (public.kullanicilar);
    DROP TABLE public.editor;
       public         heap    postgres    false    218            �            1259    17268 	   etiketler    TABLE     �   CREATE TABLE public.etiketler (
    "Id" integer,
    "EtiketIsmi" character varying(50),
    "EtiketSinifi" character varying(50),
    "EtiketSayisi" integer,
    "EtiketBilgisi" character varying(255)
);
    DROP TABLE public.etiketler;
       public         heap    postgres    false            �            1259    17271    filtre    TABLE     �   CREATE TABLE public.filtre (
    "Id" integer,
    "EtiketTipi" character varying(50),
    "SiralamaTipi" character varying(50),
    "İcerikBenzerligiYazi" character varying(500)
);
    DROP TABLE public.filtre;
       public         heap    postgres    false            �            1259    17276 
   gumusrozet    TABLE     �   CREATE TABLE public.gumusrozet (
    "RozetId" integer NOT NULL,
    "GumusRozetGereksinim" character varying(255)
)
INHERITS (public.rozetler);
    DROP TABLE public.gumusrozet;
       public         heap    postgres    false    214            �            1259    17282    oylar    TABLE     �   CREATE TABLE public.oylar (
    "Id" integer NOT NULL,
    "SoruId" integer,
    "KullaniciId" integer,
    "OylanmaZamani" date
);
    DROP TABLE public.oylar;
       public         heap    postgres    false            �            1259    17279    oytipi    TABLE     r   CREATE TABLE public.oytipi (
    "Id" integer NOT NULL,
    "OyId" integer,
    "OyIsmi" character varying(15)
);
    DROP TABLE public.oytipi;
       public         heap    postgres    false            �            1259    17285    soruetiketleri    TABLE     U   CREATE TABLE public.soruetiketleri (
    "SoruId" integer,
    "EtiketId" integer
);
 "   DROP TABLE public.soruetiketleri;
       public         heap    postgres    false            �            1259    17291    sorugecmisi    TABLE     �   CREATE TABLE public.sorugecmisi (
    "Id" integer NOT NULL,
    "SoruSahibiId" integer,
    "SorulmaTarihi" date,
    "SoruId" integer,
    "SoruGecmisTipiId" integer,
    "Gecmisİcerik" character varying(500),
    "GoruntulenmeSayisi" integer
);
    DROP TABLE public.sorugecmisi;
       public         heap    postgres    false            �            1259    17288    sorugecmistipi    TABLE     d   CREATE TABLE public.sorugecmistipi (
    "Id" integer NOT NULL,
    "Isim" character varying(50)
);
 "   DROP TABLE public.sorugecmistipi;
       public         heap    postgres    false            �            1259    17296    sorugeribildirimleri    TABLE     �   CREATE TABLE public.sorugeribildirimleri (
    "Id" integer NOT NULL,
    "SoruId" integer,
    "OyTipiId" integer,
    "BildirimOlusturmaZamani" date,
    "AnonimGeriBildirim" character varying(255)
);
 (   DROP TABLE public.sorugeribildirimleri;
       public         heap    postgres    false            �            1259    17299    sorular    TABLE     �  CREATE TABLE public.sorular (
    "Id" integer NOT NULL,
    "EtiketId" integer,
    "SoruSahibiId" integer,
    "SoruBasligi" character varying(100),
    "SoruGovdesi" character varying(500),
    "YorumSayisi" integer,
    "GoruntulenmeSayisi" integer,
    "OylanmaSayisi" integer,
    "FiltreId" integer,
    "SonAktiflikTarihi" date,
    "SonDuzenlenmeTarihi" date,
    "FavoriSayisi" integer,
    "OlusturmaTarihi" date
);
    DROP TABLE public.sorular;
       public         heap    postgres    false            �            1259    17304    yanitlar    TABLE     �   CREATE TABLE public.yanitlar (
    "Id" integer NOT NULL,
    "OyId" integer,
    "SoruId" integer,
    "KullaniciId" integer,
    "YanitGovdesi" character varying(500),
    "YanitlanmaZamani" date
);
    DROP TABLE public.yanitlar;
       public         heap    postgres    false            �            1259    17309    yonetici    TABLE     �   CREATE TABLE public.yonetici (
    "KullaniciId" integer NOT NULL,
    "TumSistemYetkisi" boolean
)
INHERITS (public.kullanicilar);
    DROP TABLE public.yonetici;
       public         heap    postgres    false    218            �            1259    17314    yukariOy    TABLE     ^   CREATE TABLE public."yukariOy" (
    "OyTipiId" integer NOT NULL,
    "ItibarArti" integer
);
    DROP TABLE public."yukariOy";
       public         heap    postgres    false            �           2604    17317    editor KullaniciOlmaTarihi    DEFAULT     b   ALTER TABLE ONLY public.editor ALTER COLUMN "KullaniciOlmaTarihi" SET DEFAULT '2023-12-08'::date;
 K   ALTER TABLE public.editor ALTER COLUMN "KullaniciOlmaTarihi" DROP DEFAULT;
       public          postgres    false    219            �           2604    17318    editor SonGorulme    DEFAULT     Y   ALTER TABLE ONLY public.editor ALTER COLUMN "SonGorulme" SET DEFAULT '2023-12-08'::date;
 B   ALTER TABLE public.editor ALTER COLUMN "SonGorulme" DROP DEFAULT;
       public          postgres    false    219            �           2604    17319    yonetici KullaniciOlmaTarihi    DEFAULT     d   ALTER TABLE ONLY public.yonetici ALTER COLUMN "KullaniciOlmaTarihi" SET DEFAULT '2023-12-08'::date;
 M   ALTER TABLE public.yonetici ALTER COLUMN "KullaniciOlmaTarihi" DROP DEFAULT;
       public          postgres    false    231            �           2604    17320    yonetici SonGorulme    DEFAULT     [   ALTER TABLE ONLY public.yonetici ALTER COLUMN "SonGorulme" SET DEFAULT '2023-12-08'::date;
 D   ALTER TABLE public.yonetici ALTER COLUMN "SonGorulme" DROP DEFAULT;
       public          postgres    false    231            �          0    17247 
   altinrozet 
   TABLE DATA           �   COPY public.altinrozet ("Id", "KullaniciId", "RozetIsmi", "RozetSinifi", "VerilmeSayisi", "VerilmeTarihi", "RozetId", "AltinRozetGereksinim") FROM stdin;
    public          postgres    false    215   @u       �          0    17250    asagioy 
   TABLE DATA           ;   COPY public.asagioy ("OyTipiId", "ItibarEksi") FROM stdin;
    public          postgres    false    216   �u       �          0    17253 
   bronzrozet 
   TABLE DATA           �   COPY public.bronzrozet ("Id", "KullaniciId", "RozetIsmi", "RozetSinifi", "VerilmeSayisi", "VerilmeTarihi", "RozetId", "BronzRozetGereksinim") FROM stdin;
    public          postgres    false    217   �u       �          0    17261    editor 
   TABLE DATA           T  COPY public.editor ("Id", "KullaniciIsim", "KullaniciOlmaTarihi", "KullaniciSiteBaglantisi", "KullaniciProfilResmiBaglantisi", "SonGorulme", "ProfilGoruntulenmesi", "HakkindaGovdesi", "Yas", "ItibarSayisi", "ZiyaretEdilmeSayisi", "SoruSayisi", "KullaniciId", "DuzenlenmisSorular", "DuzenlenmisYanitlar", "DuzenlenmisEtiketler") FROM stdin;
    public          postgres    false    219   ,v       �          0    17268 	   etiketler 
   TABLE DATA           h   COPY public.etiketler ("Id", "EtiketIsmi", "EtiketSinifi", "EtiketSayisi", "EtiketBilgisi") FROM stdin;
    public          postgres    false    220   �v       �          0    17271    filtre 
   TABLE DATA           ]   COPY public.filtre ("Id", "EtiketTipi", "SiralamaTipi", "İcerikBenzerligiYazi") FROM stdin;
    public          postgres    false    221   �w       �          0    17276 
   gumusrozet 
   TABLE DATA           �   COPY public.gumusrozet ("Id", "KullaniciId", "RozetIsmi", "RozetSinifi", "VerilmeSayisi", "VerilmeTarihi", "RozetId", "GumusRozetGereksinim") FROM stdin;
    public          postgres    false    222   x       �          0    17256    kullanicilar 
   TABLE DATA             COPY public.kullanicilar ("Id", "KullaniciIsim", "KullaniciOlmaTarihi", "KullaniciSiteBaglantisi", "KullaniciProfilResmiBaglantisi", "SonGorulme", "ProfilGoruntulenmesi", "HakkindaGovdesi", "Yas", "ItibarSayisi", "ZiyaretEdilmeSayisi", "SoruSayisi") FROM stdin;
    public          postgres    false    218   jx       �          0    17282    oylar 
   TABLE DATA           O   COPY public.oylar ("Id", "SoruId", "KullaniciId", "OylanmaZamani") FROM stdin;
    public          postgres    false    224   �x       �          0    17279    oytipi 
   TABLE DATA           8   COPY public.oytipi ("Id", "OyId", "OyIsmi") FROM stdin;
    public          postgres    false    223   Jy       �          0    17244    rozetler 
   TABLE DATA           u   COPY public.rozetler ("Id", "KullaniciId", "RozetIsmi", "RozetSinifi", "VerilmeSayisi", "VerilmeTarihi") FROM stdin;
    public          postgres    false    214   �y       �          0    17285    soruetiketleri 
   TABLE DATA           >   COPY public.soruetiketleri ("SoruId", "EtiketId") FROM stdin;
    public          postgres    false    225   #z       �          0    17291    sorugecmisi 
   TABLE DATA           �   COPY public.sorugecmisi ("Id", "SoruSahibiId", "SorulmaTarihi", "SoruId", "SoruGecmisTipiId", "Gecmisİcerik", "GoruntulenmeSayisi") FROM stdin;
    public          postgres    false    227   Xz       �          0    17288    sorugecmistipi 
   TABLE DATA           6   COPY public.sorugecmistipi ("Id", "Isim") FROM stdin;
    public          postgres    false    226   �{       �          0    17296    sorugeribildirimleri 
   TABLE DATA           {   COPY public.sorugeribildirimleri ("Id", "SoruId", "OyTipiId", "BildirimOlusturmaZamani", "AnonimGeriBildirim") FROM stdin;
    public          postgres    false    228   �{       �          0    17299    sorular 
   TABLE DATA           �   COPY public.sorular ("Id", "EtiketId", "SoruSahibiId", "SoruBasligi", "SoruGovdesi", "YorumSayisi", "GoruntulenmeSayisi", "OylanmaSayisi", "FiltreId", "SonAktiflikTarihi", "SonDuzenlenmeTarihi", "FavoriSayisi", "OlusturmaTarihi") FROM stdin;
    public          postgres    false    229   g|       �          0    17304    yanitlar 
   TABLE DATA           m   COPY public.yanitlar ("Id", "OyId", "SoruId", "KullaniciId", "YanitGovdesi", "YanitlanmaZamani") FROM stdin;
    public          postgres    false    230   f~       �          0    17309    yonetici 
   TABLE DATA           %  COPY public.yonetici ("Id", "KullaniciIsim", "KullaniciOlmaTarihi", "KullaniciSiteBaglantisi", "KullaniciProfilResmiBaglantisi", "SonGorulme", "ProfilGoruntulenmesi", "HakkindaGovdesi", "Yas", "ItibarSayisi", "ZiyaretEdilmeSayisi", "SoruSayisi", "KullaniciId", "TumSistemYetkisi") FROM stdin;
    public          postgres    false    231   �       �          0    17314    yukariOy 
   TABLE DATA           >   COPY public."yukariOy" ("OyTipiId", "ItibarArti") FROM stdin;
    public          postgres    false    232   S�       �           2606    17322    altinrozet AltinRozetPK 
   CONSTRAINT     ^   ALTER TABLE ONLY public.altinrozet
    ADD CONSTRAINT "AltinRozetPK" PRIMARY KEY ("RozetId");
 C   ALTER TABLE ONLY public.altinrozet DROP CONSTRAINT "AltinRozetPK";
       public            postgres    false    215            �           2606    17324    asagioy AsagiOyPK 
   CONSTRAINT     Y   ALTER TABLE ONLY public.asagioy
    ADD CONSTRAINT "AsagiOyPK" PRIMARY KEY ("OyTipiId");
 =   ALTER TABLE ONLY public.asagioy DROP CONSTRAINT "AsagiOyPK";
       public            postgres    false    216            �           2606    17326    bronzrozet BronzRozetPK 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bronzrozet
    ADD CONSTRAINT "BronzRozetPK" PRIMARY KEY ("RozetId");
 C   ALTER TABLE ONLY public.bronzrozet DROP CONSTRAINT "BronzRozetPK";
       public            postgres    false    217            �           2606    17328    editor EditorPK 
   CONSTRAINT     Z   ALTER TABLE ONLY public.editor
    ADD CONSTRAINT "EditorPK" PRIMARY KEY ("KullaniciId");
 ;   ALTER TABLE ONLY public.editor DROP CONSTRAINT "EditorPK";
       public            postgres    false    219            �           2606    17330    etiketler Etiketler_Id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.etiketler
    ADD CONSTRAINT "Etiketler_Id_key" UNIQUE ("Id");
 F   ALTER TABLE ONLY public.etiketler DROP CONSTRAINT "Etiketler_Id_key";
       public            postgres    false    220            �           2606    17332    gumusrozet GumusRozetPK 
   CONSTRAINT     ^   ALTER TABLE ONLY public.gumusrozet
    ADD CONSTRAINT "GumusRozetPK" PRIMARY KEY ("RozetId");
 C   ALTER TABLE ONLY public.gumusrozet DROP CONSTRAINT "GumusRozetPK";
       public            postgres    false    222            �           2606    17334    kullanicilar KullanicilarPK 
   CONSTRAINT     ]   ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT "KullanicilarPK" PRIMARY KEY ("Id");
 G   ALTER TABLE ONLY public.kullanicilar DROP CONSTRAINT "KullanicilarPK";
       public            postgres    false    218            �           2606    17336    oytipi OyTipiPK 
   CONSTRAINT     Q   ALTER TABLE ONLY public.oytipi
    ADD CONSTRAINT "OyTipiPK" PRIMARY KEY ("Id");
 ;   ALTER TABLE ONLY public.oytipi DROP CONSTRAINT "OyTipiPK";
       public            postgres    false    223            �           2606    17338    oylar OylarPK 
   CONSTRAINT     O   ALTER TABLE ONLY public.oylar
    ADD CONSTRAINT "OylarPK" PRIMARY KEY ("Id");
 9   ALTER TABLE ONLY public.oylar DROP CONSTRAINT "OylarPK";
       public            postgres    false    224            �           2606    17340    rozetler RozetlerPK 
   CONSTRAINT     U   ALTER TABLE ONLY public.rozetler
    ADD CONSTRAINT "RozetlerPK" PRIMARY KEY ("Id");
 ?   ALTER TABLE ONLY public.rozetler DROP CONSTRAINT "RozetlerPK";
       public            postgres    false    214            �           2606    17342    sorugecmistipi SoruGecmisTipiPK 
   CONSTRAINT     a   ALTER TABLE ONLY public.sorugecmistipi
    ADD CONSTRAINT "SoruGecmisTipiPK" PRIMARY KEY ("Id");
 K   ALTER TABLE ONLY public.sorugecmistipi DROP CONSTRAINT "SoruGecmisTipiPK";
       public            postgres    false    226            �           2606    17344    sorugecmisi SoruGecmisiPK 
   CONSTRAINT     [   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisiPK" PRIMARY KEY ("Id");
 E   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisiPK";
       public            postgres    false    227            �           2606    17346 ,   sorugecmisi SoruGecmisi_SoruGecmisTipiId_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisi_SoruGecmisTipiId_key" UNIQUE ("SoruGecmisTipiId");
 X   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisi_SoruGecmisTipiId_key";
       public            postgres    false    227            �           2606    17348 "   sorugecmisi SoruGecmisi_SoruId_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisi_SoruId_key" UNIQUE ("SoruId");
 N   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisi_SoruId_key";
       public            postgres    false    227            �           2606    17350 +   sorugeribildirimleri SoruGeriBildirimleriPK 
   CONSTRAINT     m   ALTER TABLE ONLY public.sorugeribildirimleri
    ADD CONSTRAINT "SoruGeriBildirimleriPK" PRIMARY KEY ("Id");
 W   ALTER TABLE ONLY public.sorugeribildirimleri DROP CONSTRAINT "SoruGeriBildirimleriPK";
       public            postgres    false    228            �           2606    17352    sorular SorularPK 
   CONSTRAINT     S   ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT "SorularPK" PRIMARY KEY ("Id");
 =   ALTER TABLE ONLY public.sorular DROP CONSTRAINT "SorularPK";
       public            postgres    false    229            �           2606    17354 #   sorular Sorular_OlusturmaTarihi_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT "Sorular_OlusturmaTarihi_key" UNIQUE ("OlusturmaTarihi");
 O   ALTER TABLE ONLY public.sorular DROP CONSTRAINT "Sorular_OlusturmaTarihi_key";
       public            postgres    false    229            �           2606    17356    yanitlar YanitlarPK 
   CONSTRAINT     U   ALTER TABLE ONLY public.yanitlar
    ADD CONSTRAINT "YanitlarPK" PRIMARY KEY ("Id");
 ?   ALTER TABLE ONLY public.yanitlar DROP CONSTRAINT "YanitlarPK";
       public            postgres    false    230            �           2606    17358    yonetici YoneticiPK 
   CONSTRAINT     ^   ALTER TABLE ONLY public.yonetici
    ADD CONSTRAINT "YoneticiPK" PRIMARY KEY ("KullaniciId");
 ?   ALTER TABLE ONLY public.yonetici DROP CONSTRAINT "YoneticiPK";
       public            postgres    false    231            �           2606    17360    yukariOy YukariOyPK 
   CONSTRAINT     ]   ALTER TABLE ONLY public."yukariOy"
    ADD CONSTRAINT "YukariOyPK" PRIMARY KEY ("OyTipiId");
 A   ALTER TABLE ONLY public."yukariOy" DROP CONSTRAINT "YukariOyPK";
       public            postgres    false    232            �           2606    17361    altinrozet AltinRozetFK    FK CONSTRAINT        ALTER TABLE ONLY public.altinrozet
    ADD CONSTRAINT "AltinRozetFK" FOREIGN KEY ("RozetId") REFERENCES public.rozetler("Id");
 C   ALTER TABLE ONLY public.altinrozet DROP CONSTRAINT "AltinRozetFK";
       public          postgres    false    215    214    3251            �           2606    17366    asagioy AsagiOyFK    FK CONSTRAINT     x   ALTER TABLE ONLY public.asagioy
    ADD CONSTRAINT "AsagiOyFK" FOREIGN KEY ("OyTipiId") REFERENCES public.oytipi("Id");
 =   ALTER TABLE ONLY public.asagioy DROP CONSTRAINT "AsagiOyFK";
       public          postgres    false    223    216    3267            �           2606    17371    bronzrozet BronzRozetFK    FK CONSTRAINT        ALTER TABLE ONLY public.bronzrozet
    ADD CONSTRAINT "BronzRozetFK" FOREIGN KEY ("RozetId") REFERENCES public.rozetler("Id");
 C   ALTER TABLE ONLY public.bronzrozet DROP CONSTRAINT "BronzRozetFK";
       public          postgres    false    217    3251    214            �           2606    17376    editor EditorFK    FK CONSTRAINT        ALTER TABLE ONLY public.editor
    ADD CONSTRAINT "EditorFK" FOREIGN KEY ("KullaniciId") REFERENCES public.kullanicilar("Id");
 ;   ALTER TABLE ONLY public.editor DROP CONSTRAINT "EditorFK";
       public          postgres    false    218    3259    219            �           2606    17381    gumusrozet GumusRozetFK    FK CONSTRAINT        ALTER TABLE ONLY public.gumusrozet
    ADD CONSTRAINT "GumusRozetFK" FOREIGN KEY ("RozetId") REFERENCES public.rozetler("Id");
 C   ALTER TABLE ONLY public.gumusrozet DROP CONSTRAINT "GumusRozetFK";
       public          postgres    false    3251    214    222            �           2606    17386    oytipi OyTipiFK    FK CONSTRAINT     q   ALTER TABLE ONLY public.oytipi
    ADD CONSTRAINT "OyTipiFK" FOREIGN KEY ("OyId") REFERENCES public.oylar("Id");
 ;   ALTER TABLE ONLY public.oytipi DROP CONSTRAINT "OyTipiFK";
       public          postgres    false    223    224    3269            �           2606    17391    oylar OylarKullaniciFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.oylar
    ADD CONSTRAINT "OylarKullaniciFK" FOREIGN KEY ("KullaniciId") REFERENCES public.kullanicilar("Id");
 B   ALTER TABLE ONLY public.oylar DROP CONSTRAINT "OylarKullaniciFK";
       public          postgres    false    3259    218    224            �           2606    17396    oylar OylarSoruFK    FK CONSTRAINT     w   ALTER TABLE ONLY public.oylar
    ADD CONSTRAINT "OylarSoruFK" FOREIGN KEY ("SoruId") REFERENCES public.sorular("Id");
 =   ALTER TABLE ONLY public.oylar DROP CONSTRAINT "OylarSoruFK";
       public          postgres    false    224    229    3281            �           2606    17401    rozetler RozetlerFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.rozetler
    ADD CONSTRAINT "RozetlerFK" FOREIGN KEY ("KullaniciId") REFERENCES public.kullanicilar("Id");
 ?   ALTER TABLE ONLY public.rozetler DROP CONSTRAINT "RozetlerFK";
       public          postgres    false    3259    214    218            �           2606    17406 %   soruetiketleri SoruEtiketleriEtiketFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.soruetiketleri
    ADD CONSTRAINT "SoruEtiketleriEtiketFK" FOREIGN KEY ("EtiketId") REFERENCES public.etiketler("Id");
 Q   ALTER TABLE ONLY public.soruetiketleri DROP CONSTRAINT "SoruEtiketleriEtiketFK";
       public          postgres    false    220    3263    225            �           2606    17411 #   soruetiketleri SoruEtiketleriSoruFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.soruetiketleri
    ADD CONSTRAINT "SoruEtiketleriSoruFK" FOREIGN KEY ("SoruId") REFERENCES public.sorular("Id");
 O   ALTER TABLE ONLY public.soruetiketleri DROP CONSTRAINT "SoruEtiketleriSoruFK";
       public          postgres    false    229    225    3281            �           2606    17416 )   sorugecmisi SoruGecmisiSoruGecmisTipiIdFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisiSoruGecmisTipiIdFK" FOREIGN KEY ("SoruGecmisTipiId") REFERENCES public.sorugecmisi("Id");
 U   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisiSoruGecmisTipiIdFK";
       public          postgres    false    227    3273    227            �           2606    17421    sorugecmisi SoruGecmisiSoruIdFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisiSoruIdFK" FOREIGN KEY ("SoruId") REFERENCES public.sorular("Id");
 K   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisiSoruIdFK";
       public          postgres    false    227    3281    229            �           2606    17426 #   sorugecmisi SoruGecmisiSoruSahibiFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisiSoruSahibiFK" FOREIGN KEY ("SoruSahibiId") REFERENCES public.kullanicilar("Id");
 O   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisiSoruSahibiFK";
       public          postgres    false    227    3259    218            �           2606    17431 &   sorugecmisi SoruGecmisiSorulmaTarihiFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugecmisi
    ADD CONSTRAINT "SoruGecmisiSorulmaTarihiFK" FOREIGN KEY ("SorulmaTarihi") REFERENCES public.sorular("OlusturmaTarihi");
 R   ALTER TABLE ONLY public.sorugecmisi DROP CONSTRAINT "SoruGecmisiSorulmaTarihiFK";
       public          postgres    false    227    3283    229            �           2606    17436 3   sorugeribildirimleri SoruGeriBildirimleriOyTipiIdFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugeribildirimleri
    ADD CONSTRAINT "SoruGeriBildirimleriOyTipiIdFK" FOREIGN KEY ("OyTipiId") REFERENCES public.oytipi("Id");
 _   ALTER TABLE ONLY public.sorugeribildirimleri DROP CONSTRAINT "SoruGeriBildirimleriOyTipiIdFK";
       public          postgres    false    223    228    3267            �           2606    17441 1   sorugeribildirimleri SoruGeriBildirimleriSoruIdFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorugeribildirimleri
    ADD CONSTRAINT "SoruGeriBildirimleriSoruIdFK" FOREIGN KEY ("SoruId") REFERENCES public.sorular("Id");
 ]   ALTER TABLE ONLY public.sorugeribildirimleri DROP CONSTRAINT "SoruGeriBildirimleriSoruIdFK";
       public          postgres    false    228    229    3281            �           2606    17446    sorular SorularEtiketFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT "SorularEtiketFK" FOREIGN KEY ("EtiketId") REFERENCES public.etiketler("Id");
 C   ALTER TABLE ONLY public.sorular DROP CONSTRAINT "SorularEtiketFK";
       public          postgres    false    220    229    3263            �           2606    17451    sorular SorularSoruSahibiFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sorular
    ADD CONSTRAINT "SorularSoruSahibiFK" FOREIGN KEY ("SoruSahibiId") REFERENCES public.kullanicilar("Id");
 G   ALTER TABLE ONLY public.sorular DROP CONSTRAINT "SorularSoruSahibiFK";
       public          postgres    false    229    3259    218            �           2606    17456    yanitlar YanitlarKullaniciIdFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.yanitlar
    ADD CONSTRAINT "YanitlarKullaniciIdFK" FOREIGN KEY ("KullaniciId") REFERENCES public.kullanicilar("Id");
 J   ALTER TABLE ONLY public.yanitlar DROP CONSTRAINT "YanitlarKullaniciIdFK";
       public          postgres    false    218    230    3259            �           2606    17461    yanitlar YanitlarOyIdFK    FK CONSTRAINT     y   ALTER TABLE ONLY public.yanitlar
    ADD CONSTRAINT "YanitlarOyIdFK" FOREIGN KEY ("OyId") REFERENCES public.oylar("Id");
 C   ALTER TABLE ONLY public.yanitlar DROP CONSTRAINT "YanitlarOyIdFK";
       public          postgres    false    224    230    3269            �           2606    17466    yanitlar YanitlarSoruIdFK    FK CONSTRAINT        ALTER TABLE ONLY public.yanitlar
    ADD CONSTRAINT "YanitlarSoruIdFK" FOREIGN KEY ("SoruId") REFERENCES public.sorular("Id");
 E   ALTER TABLE ONLY public.yanitlar DROP CONSTRAINT "YanitlarSoruIdFK";
       public          postgres    false    3281    230    229            �           2606    17471    yonetici YoneticiFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.yonetici
    ADD CONSTRAINT "YoneticiFK" FOREIGN KEY ("KullaniciId") REFERENCES public.kullanicilar("Id");
 ?   ALTER TABLE ONLY public.yonetici DROP CONSTRAINT "YoneticiFK";
       public          postgres    false    231    3259    218            �           2606    17476    yukariOy YukariOyFK    FK CONSTRAINT     |   ALTER TABLE ONLY public."yukariOy"
    ADD CONSTRAINT "YukariOyFK" FOREIGN KEY ("OyTipiId") REFERENCES public.oytipi("Id");
 A   ALTER TABLE ONLY public."yukariOy" DROP CONSTRAINT "YukariOyFK";
       public          postgres    false    223    232    3267            �   Z   x�3�4��/*u,K�,��t�)��ʯJ-���X 9ޥ99�y�ə
�
�@
ɩe�9����%�E\F�FĘcBȜ=... Qp-�      �      x�3�4�2bc ����� �      �   L   x�3�4�L���L�t*�ϫ
ʯJ-
��Xps:e)d��*$&�f�dqq�g�E_� �c!^      �   �   x�3�t��M-�4202�50�5���())(�������+�KM)�+)��!
�fh�f��Z�������������rdc��tE�:NSNC#NcNC�?�2�t�K-��Ն�X���ڜ�Мӄ�a�1�cN&�l�l�1��=... �.hK      �   �   x�m�=�0�g�9A��3!���XX����]5��\�3��^X�H��K0d;F��衄��5z'W�G�0=��
���������%�s����#Y�#���] #���w]�����na0�i����U�K�f�-[����Y�c��o^��dH�Os��o�R��#jR      �   t   x�3�L�K)��L�L���<����Ԣ�l��Լ�Ԣ��#�3�JsJ�sS�l��2�L��O�I%V�1gyf^J~y��:L82
���Pmʙ����UL��f��9�e�D�?F��� omw�      �   R   x�3�4��M-J����t/�--ʯJ-
��Xpqz���$�e&g*+����ڒ�".#�4!L����� ��(n      �   �   x�3�t��M-�4202�50�5���())(�������+�KM)�+)��!
�fh�f��Z�������������rdc��tE�:NSNC#Nc.#N׼�b*�gh��B��`��9�9M��9s2ig�pd�b���� �eaO      �   <   x�Uʱ  ���EGxQ���:�H	�f
�5cQ+mI�]o̢�g��,F3���UD�NN      �   R   x�3�4�t�K)��L��2�4�t��O�Ir�9�9�3�R�ˋ�<N΀� ˔Ӕ�/?%�$l�i�靓XV	����� �K      �   g   x�3�4��/*u,K�,��t�)��ʯJ-���Xp���E��9����X����y�����NE�yUXԘpc�)P!�̀jY���� �.<�      �   %   x�3�4�2�4�2�4�2�4�2�4�2�4����� 5Q�      �   P  x�=��R�0Ek�+���#	�LEAAAAC����XF��Ϥ�vC�����V���{UfeVU=+�Y��C�m��4��N��BNC0�q���w>�C��Q[2�*���J*�$��?��F��S�`��b�1Є�꼞\
!�</���P@��D�C1�%a��u`�na�Qf��G{�c��M��؂�)����0~R�h�
�@�_g�Y�Z8|�l)Ȼ�,��m�E���ka/y��t���)������d��C�l�N�cޔ�����d}'�ϣQ���F�t�h0J!{�L�Q��3 �jj�wA��î�h�\��<��?!���      �   1   x�3�L�;��$'1/1O!8��T����11,b�X�̰���qqq \,�      �   ^   x�3�4B##c]C#]N��"��Ҝ�ļ#��lT(�/*�+�*U����$�٨�e�	��j3�A��s� ��L9A�dmf� H��=... 4>v�      �   �  x��S=��@��_1%�l���h����A:mع�������~(%��tv���f�\88�4Ȳ��<�yo�m��\9<i�L�j��m�[g՟����]���ҷ��P�oԒ�+�2/���O�O���L�7ޯBĐ�*�*)�,,�����s����t�B�N�Gr��P�@���D�bBK�j��7��u�e�v���(ާgD�"b��1F��:�
����ѭtjkT��T�1�n�4��')A¸�<��a�Ft?�Ag12�h�3&XR/� en�f���=�7%z�ٜ�j��+LP�5k���o��ױ��:�p\��cQ䓯Cl���v���������P1R��,�����K���~-���$�偰x��v�p�R=1L,��m�Qw:b-�g�K�1�
�d���2���bcPS��A�I�A.ā�W`'�t.�8�G+��>>�����z��4�F� orbA      �   M  x�e��N�0�g�)n�TM
���G`�T9���+��:/��+]�ؚ�g�������;.U)��c�� �5��{�ALm4�ײ�f:��鐬ktM��\U�jY�U�x�U*�Tӻi�<�@/��$�]^7�A|����i o]�(Ǐ/�K�U�g�ƾy��'�4Bg��X�d9�w�-t��y���*�G����a��N\Ssut��xܣ��m�.��Qoh�	���)���4r�:	駶�V
�������W|>ʪ����@�66��|���y��I<.����_&�*�T�d���-��1��kS��g%aŐ��.���l6�>�=      �   �   x�3�t��M-�4202�50�5���())(�������+�KM)�+)��!
�fh�f��Z�������������rdc��tE�:NSNC#NcNC�.#N׼�b*�ih��R��`;�9�9M8��v��qqq NCR      �      x�3�4�2bc ����� �     