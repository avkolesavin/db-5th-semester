-- Таблицы
CREATE TABLE "season" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "start_date" date NOT NULL,
    "end_date" date NOT NULL,
    CONSTRAINT "PK_8ac0d081dbdb7ab02d166bcda9f" PRIMARY KEY ("id")
);

CREATE TABLE "guide_category" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "description" text NOT NULL,
    CONSTRAINT "PK_42dff7d16f51fbbe2d4fa296e81" PRIMARY KEY ("id")
);

CREATE TABLE "tourist_category" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "description" text NOT NULL,
    CONSTRAINT "PK_6fada8149dccf4e65e5a1a1c6a5" PRIMARY KEY ("id")
);

CREATE TABLE "route_difficulty" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "description" text,
    "min_guide_category_id" integer,
    "min_tourist_category_id" integer,
    CONSTRAINT "PK_21d83ca4572aa18681bffba9c5f" PRIMARY KEY ("id")
);

CREATE TABLE "route" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "length" double precision NOT NULL,
    "price" double precision NOT NULL,
    "path" geography(LineString, 4326) NOT NULL,
    "season_id" integer,
    "route_difficulty_id" integer,
    CONSTRAINT "PK_08affcd076e46415e5821acf52d" PRIMARY KEY ("id")
);

CREATE TABLE "routes_to_control_points" (
    "route_id" integer NOT NULL,
    "control_point_id" integer NOT NULL,
    CONSTRAINT "PK_bfb4e9857a52293a472e431c5f7" PRIMARY KEY ("route_id", "control_point_id")
);

CREATE TABLE "control_point" (
    "id" SERIAL NOT NULL,
    "lat" double precision NOT NULL,
    "long" double precision NOT NULL,
    "name" character varying NOT NULL,
    "description" text NOT NULL,
    CONSTRAINT "PK_72afbf3ea122479346c8f0acb01" PRIMARY KEY ("id")
);

CREATE TABLE "control_points_to_seasons" (
    "control_point_id" integer NOT NULL,
    "season_id" integer NOT NULL,
    CONSTRAINT "PK_7b102cf398c391053f6bf2fab56" PRIMARY KEY ("control_point_id", "season_id")
);

CREATE TABLE "equipment_type" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "season_id" integer,
    "parent_id" integer,
    CONSTRAINT "PK_ee23d8bc7edce7f6f0d2e90c573" PRIMARY KEY ("id")
);

CREATE TYPE "public"."Sex" AS ENUM('male', 'female');

CREATE TABLE "tourist" (
    "id" SERIAL NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying,
    "second_name" character varying,
    "passport" character varying NOT NULL,
    "sex" "public"."Sex" NOT NULL,
    "age" integer NOT NULL,
    "experience" character varying NOT NULL,
    "tourist_category_id" integer,
    CONSTRAINT "PK_802849ab727ecccce6344a3d8cb" PRIMARY KEY ("id")
);

CREATE TABLE "guide" (
    "id" SERIAL NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying,
    "second_name" character varying,
    "passport" character varying NOT NULL,
    "age" integer NOT NULL,
    "tours_count" integer NOT NULL,
    "can_drive" boolean NOT NULL,
    "can_raft" boolean NOT NULL,
    "experience" double precision NOT NULL,
    "guide_category_id" integer,
    CONSTRAINT "PK_fe92b4af32150e0580d37eacaef" PRIMARY KEY ("id")
);

CREATE TABLE "transport_type" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "description" text,
    CONSTRAINT "PK_4251a2ed8b09091d1012c866789" PRIMARY KEY ("id")
);

CREATE TABLE "transport" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "human_capacity" integer NOT NULL,
    "luggage_volume" double precision NOT NULL,
    "price" numeric(10, 2) NOT NULL,
    "transport_type_id" integer,
    CONSTRAINT "PK_298d9594bee72eca3d7a4032a39" PRIMARY KEY ("id")
);

CREATE TABLE "tour_log_to_transport" (
    "tour_log_id" integer NOT NULL,
    "transport_id" integer NOT NULL,
    "count" integer NOT NULL,
    CONSTRAINT "PK_12aabe28388d1a3b46044301b6c" PRIMARY KEY ("tour_log_id", "transport_id")
);

CREATE TABLE "tours_log" (
    "id" SERIAL NOT NULL,
    "start_date" date NOT NULL,
    "end_date" date NOT NULL,
    "route_id" integer,
    CONSTRAINT "PK_d8b3832d8ab5b016476a2ffa9c3" PRIMARY KEY ("id")
);

CREATE TABLE "tour_log_to_equipment" (
    "tour_log_id" integer NOT NULL,
    "equipment_id" integer NOT NULL,
    "count" integer NOT NULL,
    CONSTRAINT "PK_5c565916825ea25b338b752b9ad" PRIMARY KEY ("tour_log_id", "equipment_id")
);

CREATE TABLE "equipment" (
    "id" SERIAL NOT NULL,
    "name" character varying NOT NULL,
    "weight" double precision NOT NULL,
    "value" double precision NOT NULL,
    "rent_price" double precision NOT NULL,
    "count" integer NOT NULL,
    "equipment_type_id" integer,
    CONSTRAINT "PK_0722e1b9d6eb19f5874c1678740" PRIMARY KEY ("id")
);

CREATE TABLE "tours_logs_to_tourists" (
    "tours_log_id" integer NOT NULL,
    "tourist_id" integer NOT NULL,
    CONSTRAINT "PK_820ff4c69d69b906620b34d6f82" PRIMARY KEY ("tours_log_id", "tourist_id")
);

CREATE INDEX "IDX_6076d714cf9af7e48df4f706eb" ON "tours_logs_to_tourists" ("tours_log_id");

CREATE INDEX "IDX_a89776a200a325ee87ea065c2c" ON "tours_logs_to_tourists" ("tourist_id");

CREATE TABLE "tours_logs_to_guides" (
    "tours_log_id" integer NOT NULL,
    "guide_id" integer NOT NULL,
    CONSTRAINT "PK_5f9accedd785dcc1b1a13ba0c55" PRIMARY KEY ("tours_log_id", "guide_id")
);

CREATE INDEX "IDX_e4498a09920ca46084c8cccd9e" ON "tours_logs_to_guides" ("tours_log_id");

CREATE INDEX "IDX_20fe6296a6429ac61d33900363" ON "tours_logs_to_guides" ("guide_id");

-- Связи
ALTER TABLE
    "route_difficulty"
ADD
    CONSTRAINT "FK_adb0820256e01d340bcc1ae6c1d" FOREIGN KEY ("min_guide_category_id") REFERENCES "guide_category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "route_difficulty"
ADD
    CONSTRAINT "FK_9040bea264d6e2285eb35a1bfff" FOREIGN KEY ("min_tourist_category_id") REFERENCES "tourist_category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "route"
ADD
    CONSTRAINT "FK_937d6629e7e0173d831c9a28037" FOREIGN KEY ("season_id") REFERENCES "season"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "route"
ADD
    CONSTRAINT "FK_84cd961be163ac38ee37a8d3618" FOREIGN KEY ("route_difficulty_id") REFERENCES "route_difficulty"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "routes_to_control_points"
ADD
    CONSTRAINT "FK_f72100d201d8b6d838be68d97a4" FOREIGN KEY ("route_id") REFERENCES "route"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "routes_to_control_points"
ADD
    CONSTRAINT "FK_77e1fe88f4eac1a74c2702e0e8e" FOREIGN KEY ("control_point_id") REFERENCES "control_point"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "control_points_to_seasons"
ADD
    CONSTRAINT "FK_29cce861c379880b1387da97dd0" FOREIGN KEY ("control_point_id") REFERENCES "control_point"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "control_points_to_seasons"
ADD
    CONSTRAINT "FK_0c10bf718664ea9bfef79259e40" FOREIGN KEY ("season_id") REFERENCES "season"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "equipment_type"
ADD
    CONSTRAINT "FK_21e049341ad73926909fc2b1569" FOREIGN KEY ("season_id") REFERENCES "season"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "equipment_type"
ADD
    CONSTRAINT "FK_f5ae4f40680250a8012f47bf987" FOREIGN KEY ("parent_id") REFERENCES "equipment_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tourist"
ADD
    CONSTRAINT "FK_f544da5d0f359a0263ffd1f9183" FOREIGN KEY ("tourist_category_id") REFERENCES "tourist_category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "guide"
ADD
    CONSTRAINT "FK_5953e3a73497f32edbc855025ed" FOREIGN KEY ("guide_category_id") REFERENCES "guide_category"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "transport"
ADD
    CONSTRAINT "FK_ffc18634b7d8de6ddd783d4e52d" FOREIGN KEY ("transport_type_id") REFERENCES "transport_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tour_log_to_transport"
ADD
    CONSTRAINT "FK_b12061ebc489aff985b46d70b27" FOREIGN KEY ("tour_log_id") REFERENCES "tours_log"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tour_log_to_transport"
ADD
    CONSTRAINT "FK_3ce6a97b00bcdac69350342888f" FOREIGN KEY ("transport_id") REFERENCES "transport"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tours_log"
ADD
    CONSTRAINT "FK_86ba8712985f6a8205e615e7ca0" FOREIGN KEY ("route_id") REFERENCES "route"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tour_log_to_equipment"
ADD
    CONSTRAINT "FK_f6a4e1021945a29ec85bff5f6e8" FOREIGN KEY ("tour_log_id") REFERENCES "tours_log"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tour_log_to_equipment"
ADD
    CONSTRAINT "FK_742af0ff49355db27d8f5086218" FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "equipment"
ADD
    CONSTRAINT "FK_3a73cb0e6695b05e28cedcc3d23" FOREIGN KEY ("equipment_type_id") REFERENCES "equipment_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    "tours_logs_to_tourists"
ADD
    CONSTRAINT "FK_6076d714cf9af7e48df4f706eb3" FOREIGN KEY ("tours_log_id") REFERENCES "tours_log"("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    "tours_logs_to_tourists"
ADD
    CONSTRAINT "FK_a89776a200a325ee87ea065c2c1" FOREIGN KEY ("tourist_id") REFERENCES "tourist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    "tours_logs_to_guides"
ADD
    CONSTRAINT "FK_e4498a09920ca46084c8cccd9e0" FOREIGN KEY ("tours_log_id") REFERENCES "tours_log"("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    "tours_logs_to_guides"
ADD
    CONSTRAINT "FK_20fe6296a6429ac61d339003632" FOREIGN KEY ("guide_id") REFERENCES "guide"("id") ON DELETE CASCADE ON UPDATE CASCADE;