import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { GuideCategory } from './guide-category';

@Entity()
export class Guide {
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

    @Column()
    age: number;

    @Column('int')
    toursCount: number;

    @Column('boolean')
    canDrive: boolean;

    @Column('boolean')
    canRaft: boolean;

    @Column('float')
    experience: number;

    @ManyToOne(() => GuideCategory)
    guideCategory: GuideCategory;
}
