import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

export enum Sex {
    Male = 'male',
    Female = 'female',
}

@Entity()
export class Tourist {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    firstName: string;

    @Column({ nullable: true })
    lastName?: string;

    @Column({ nullable: true })
    secondName?: string;

    @Column()
    passport: string;

    @Column({ type: 'enum', enum: Sex, enumName: 'Sex' })
    sex: Sex;

    @Column()
    age: number;

    @Column()
    experience: string;
}
