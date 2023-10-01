import { MigrationInterface, QueryRunner } from "typeorm";

export class Test11695835570124 implements MigrationInterface {
    name = 'Test11695835570124'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            CREATE TABLE "tourist" (
                "id" SERIAL NOT NULL,
                "first_name" character varying NOT NULL,
                "last_name" character varying,
                "second_name" character varying,
                "passport" character varying NOT NULL,
                "sex" "public"."Sex" NOT NULL,
                "age" integer NOT NULL,
                "experience" character varying NOT NULL,
                CONSTRAINT "PK_802849ab727ecccce6344a3d8cb" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "tours_log" (
                "id" SERIAL NOT NULL,
                "start_date" date NOT NULL,
                "end_date" date NOT NULL,
                "test_point" json NOT NULL,
                CONSTRAINT "PK_d8b3832d8ab5b016476a2ffa9c3" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "tours_log_tourists_tourist" (
                "tours_log_id" integer NOT NULL,
                "tourist_id" integer NOT NULL,
                CONSTRAINT "PK_d83fb11001af29b52b6e9544f87" PRIMARY KEY ("tours_log_id", "tourist_id")
            )
        `);
        await queryRunner.query(`
            CREATE INDEX "IDX_8f0adc907c2a601e4c003c5119" ON "tours_log_tourists_tourist" ("tours_log_id")
        `);
        await queryRunner.query(`
            CREATE INDEX "IDX_3ca3cca3880258316e084b9c94" ON "tours_log_tourists_tourist" ("tourist_id")
        `);
        await queryRunner.query(`
            ALTER TABLE "tours_log_tourists_tourist"
            ADD CONSTRAINT "FK_8f0adc907c2a601e4c003c5119d" FOREIGN KEY ("tours_log_id") REFERENCES "tours_log"("id") ON DELETE CASCADE ON UPDATE CASCADE
        `);
        await queryRunner.query(`
            ALTER TABLE "tours_log_tourists_tourist"
            ADD CONSTRAINT "FK_3ca3cca3880258316e084b9c944" FOREIGN KEY ("tourist_id") REFERENCES "tourist"("id") ON DELETE CASCADE ON UPDATE CASCADE
        `);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "tours_log_tourists_tourist" DROP CONSTRAINT "FK_3ca3cca3880258316e084b9c944"
        `);
        await queryRunner.query(`
            ALTER TABLE "tours_log_tourists_tourist" DROP CONSTRAINT "FK_8f0adc907c2a601e4c003c5119d"
        `);
        await queryRunner.query(`
            DROP INDEX "public"."IDX_3ca3cca3880258316e084b9c94"
        `);
        await queryRunner.query(`
            DROP INDEX "public"."IDX_8f0adc907c2a601e4c003c5119"
        `);
        await queryRunner.query(`
            DROP TABLE "tours_log_tourists_tourist"
        `);
        await queryRunner.query(`
            DROP TABLE "tours_log"
        `);
        await queryRunner.query(`
            DROP TABLE "tourist"
        `);
    }

}
