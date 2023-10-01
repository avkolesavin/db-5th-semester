import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class GuideCategory {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column('text')
    description: string;
}
